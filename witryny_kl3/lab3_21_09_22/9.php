<?php

// Zdefiniuj jeden z trzech kolorów czerwony, zolty, zielony w zmiennej $kolor, a nastepnie wyswietl w zaleznosci od zdefiniowanego koloru:
// jeśli zielony "$kolor oznacza JEDZ"
// jeśli zolty "$kolor oznacza UWAZAJ"
// jeśli czerwony "$kolor oznacza STOJ"

$color = "czerwony";
$color = "zolty";
$color = "zielony";

switch ($color){
    case "czerwony";
        echo "stój";
        break;
    case "zolty";
        echo "uważaj";
        break;
    case "zielony";
        echo "jedź";
        break;
    default:
        echo "???";
}