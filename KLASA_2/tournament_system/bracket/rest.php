<?php
/**
 * jQuery Bracket server - release 1
 *
 * Copyright (c) 2012, Teijo Laine,
 * http://aropupu.fi/bracket-server/
 *
 * Licenced under the MIT licence
 */

if (get_magic_quotes_gpc()) {
  $process = array(&$_GET, &$_POST, &$_COOKIE, &$_REQUEST);
  while (list($key, $val) = each($process)) {
    foreach ($val as $k => $v) {
      unset($process[$key][$k]);
      if (is_array($v)) {
        $process[$key][stripslashes($k)] = $v;
        $process[] = &$process[$key][stripslashes($k)];
      } else {
        $process[$key][stripslashes($k)] = stripslashes($v);
      }
    }
  }
  unset($process);
}

define('VALID_PATTERN', '[0-9a-z_]+');
define('PATH', './data/');

function get($id) { return isset($_GET[$id])?$_GET[$id]:false; }
function pathwrap($id) { return PATH.'jqb_'.$id.'.json'; }

$args = array('op' => get('op'),
              'id' => get('id'),
              'data' => get('data'));

$error = false;

$restApi = array(
  'get' => apiGet,
  'set' => apiSet,
  'list' => apiList,
  'delete' => apiDelete
);

if (!in_array($args['op'], array_keys($restApi))) {
  doError();
}
if ($args['id'] !== false && !preg_match('/^'.VALID_PATTERN.'$/', $args['id'])) {
  doError();
}

function doError() {
  header('content-type: json; charset=utf-8');
  header("HTTP/1.0 404 Not Found");
  echo '{"api": ["?op=get&id=<name>", "?op=set&id=<name>&data=<json data>", "?op=list", "?op=delete&id=<name>"]}';
  exit(0);
}

function apiDelete($args) {
  return unlink(pathwrap($args['id']));
}

function apiGet($args) {
  return file_get_contents(pathwrap($args['id']));
}

function apiSet($args) {
  return file_put_contents(pathwrap($args['id']), $args['data']);
}

function apiList($args) {
  $d = dir(PATH);
  $res = '[';
  while (false !== ($entry = $d->read())) {
    if (preg_match('/^jqb_('.VALID_PATTERN.')\.json$/', $entry, $match)) {
      $res .= '"'.$match[1].'",';
    }
  }
  if (strlen($res) > 2)
    $res = substr($res, 0, strlen($res)-1);
  $res .= ']';
  $d->close();
  return $res;
}

$res = $restApi[$args['op']]($args);

if ($res === false)
  $error = true;
else if (is_string($res)) {
  header('content-type: json; charset=utf-8');
  echo $res;
}

if ($error === true) {
  doError();
}
?>
