var scene = document.getElementsByClassName("scene")[0];
var enemyImg = '<img src="assets/enemy.png" alt="enemy">';
var playerImg = '<img src="assets/player.png" alt="player">';

let bulletsShot = 0
let enemiesSpawned = 0;
//player
var speedX = 12; //default 6, 12
var speedY = 8; //default 4, 8
//player
var enemyCooldown = 2; //default 2
var fireRate = 0.2; //default 0.2
var score = 0;
var UpArrowPressed = false;
var DownArrowPressed = false;
var LeftArrowPressed = false;
var RightArrowPressed = false;
var MousePressed = false;
var time = 0;
var isOnCooldown = false;
var time2 = 0;
var enemyOnCooldown = false;

class Player{
    constructor(SpawnX, SpawnY, direction, HP){
        this.time = 1;
        this.HP = HP;
        this.dir = direction;
        this.X = SpawnX;
        this.Y = SpawnY;
        scene.innerHTML += '<div class="player">' + playerImg + '</div>';
        this.element = document.getElementsByClassName("player");
    }
    update(){
        this.fix();
        this.element[0].style.left = this.X + "px";
        this.element[0].style.bottom = this.Y + "px";
        this.element[0].style.transform = 'rotate(' + (this.dir - 90) + 'deg)';
        if (this.time % 6 === 0) {
            this.element[0].style.filter = 'brightness(100%)';
        }
        this.time++;
    }
    getDamaged(amount){
        this.HP -= amount;
        // if(this.HP > 0){
        //      if player could die put code below here
        // }
        this.element[0].style.filter = 'brightness(30%)';
        this.time = 1;
    }
    fix(){
        if(this.X < 0){
            this.X = 0;
        }
        if(this.X > 1850){
            this.X = 1850;
        }
        if(this.Y < 17){
            this.Y = 17;
        }
        if(this.Y > 800){
            this.Y = 800;
        }

    }
    getHP(){
        return this.HP;
    }
    setHP(HP){
        this.HP = HP;
    }
    getX(){
        return this.X;
    }
    getY(){
        return this.Y;
    }
    getDir(){
        return this.dir;
    }
    setX(x){
        this.X = x;
    }
    setY(y){
        this.Y = y;
    }
    setDir(dir){
        this.dir = dir;
    }
}

class Enemy{
    constructor(SpawnX, SpawnY, direction, speed, HP, ID){
        this.time = 1;
        this.speed = speed;
        this.HP = HP;
        this.ID = ID;
        this.dir = direction;
        this.X = SpawnX;
        this.Y = SpawnY;
        scene.innerHTML += '<div class="enemy" id="e' + this.ID + '">' + enemyImg + '</div>';
        this.element = document.getElementById("e" + this.ID);
    }
    update(){
        this.fix();
        this.Y -= this.speed;
        this.element = document.getElementById("e" + this.ID);
        this.element.style.left = this.X + "px";
        this.element.style.bottom = this.Y + "px";
        this.element.style.transform = 'rotate(' + (this.dir - 90) + 'deg)';
        if (this.time % 6 === 0) {
            this.element.style.filter = 'brightness(100%)';
        }
        this.time++;
    }
    remove(){
        this.element = document.getElementById("e" + this.ID);
        this.element.remove();
    }
    getDamaged(amount){
        this.HP -= amount;
        if(this.HP > 0){
            this.element = document.getElementById("e" + this.ID);
            this.element.style.filter = 'brightness(200%)';
            this.time = 1;
        }
    }
    fix(){
        if(this.X < 0){
            this.X = 0;
        }
        if(this.X > 1850){
            this.X = 1850;
        }
        if(this.Y < 0){
            this.Y = 0;
        }
        if(this.Y > 1100){
            this.Y = 1100;
        }

    }
    getHP(){
        return this.HP
    }
    setHP(hp){
        this.HP = hp;
    }
    getX(){
        return this.X;
    }
    getY(){
        return this.Y;
    }
    getDir(){
        return this.dir;
    }
    setX(x){
        this.X = x;
    }
    setY(y){
        this.Y = y;
    }
    setDir(dir){
        this.dir = dir;
    }
}

class Enemies{
    constructor(){
        this.enemies = [];
    }
    update(colision, player){
        this.enemies.forEach(Enemy => {
            Enemy.update();
            if(Enemy.getY() < 10){
                Enemy.remove();
                this.enemies.splice(this.enemies.indexOf(Enemy) , 1);
            }
            if(Enemy.getHP() < 1){
                Enemy.remove();
                this.enemies.splice(this.enemies.indexOf(Enemy) , 1);
                score++;
            }
            if (Enemy.getX()+60 > player.getX() && Enemy.getX()-30 < player.getX()
            && Enemy.getY()+50 > player.getY() && Enemy.getY()-50 < player.getY()){
                Enemy.remove();
                this.enemies.splice(this.enemies.indexOf(Enemy) , 1);
                console.log("Player damaged!");
                player.getDamaged(1);
                //damage player
            }

            colision.allBullets().forEach(Bullet =>{
                if (Enemy.getX()+60 > Bullet.getX() && Enemy.getX()-10 < Bullet.getX()
                && Enemy.getY()+20 > Bullet.getY() && Enemy.getY()-20 < Bullet.getY()) {
                    console.log("Collision!");
                    Enemy.getDamaged(1);
                    //damage
                    Bullet.remove();
                    colision.allBullets().splice(colision.allBullets().indexOf(Bullet) , 1);
                }
            });

        });
    }
    newEnemy(SpawnX, SpawnY, direction, speed, HP, ID){
        let enemy = new Enemy(SpawnX, SpawnY, direction, speed, HP, ID);
        this.enemies.push(enemy);
        this.enemy = enemy;
    }
    getEnemy(Id){
        return this.enemies[Id];
    }
    allEnemies(){
        return this.enemies;
    }
    numberOfEnemies(){
        return this.enemies.length;
    }
}

class Bullet{
    constructor(player, speed, ID){
        this.X = player.getX()+15;
        this.Y = player.getY()+20;
        this.speed = speed;
        this.ID = ID;
        scene.innerHTML += '<hr class="Pbullet" id="b' + ID + '">';
        this.elem = document.getElementById('b' + this.ID);
        this.canUpdate = 1;
    }
    update(){
        if (this.canUpdate == 1) {
            this.elem = document.getElementById('b' + this.ID);
            this.Y += this.speed;
            this.elem.style.bottom = this.Y + "px";
            this.elem.style.left = this.X + "px";
        }
    }
    remove(){
        this.canUpdate = 0;
        this.elem = document.getElementById('b' + this.ID);
        this.elem.remove();
    }
    getId(){
        return this.ID;
    }
    getX(){
        return this.X;
    }
    getY(){
        return this.Y;
    }
    setX(x){
        this.X = x;
    }
    setY(y){
        this.Y = y;
    }
}

class Bullets{
    constructor(){
        this.bullets = [];
    }
    update(){
        this.bullets.forEach(Bullet => {
            Bullet.update();
            if(Bullet.getY() > 1200){
                Bullet.remove();
                this.bullets.splice(this.bullets.indexOf(Bullet) , 1);
            }
        });
    }
    newBullet(player, speed, ID){
        let bullet = new Bullet(player, speed, ID);
        this.bullets.push(bullet);
        this.bullet = bullet;
    }
    getBullet(Id){
        return this.bullets[Id];
    }
    allBullets(){
        return this.bullets;
    }
    numberOfBullets(){
        return this.bullets.length;
    }
}

window.onload = start();

function start(){
    document.addEventListener('keydown', keyDownHandler, false);
    document.addEventListener('keyup', keyUpHandler, false);
    document.addEventListener('mousedown', function(){
        MousePressed = true;
    });
    document.addEventListener('mouseup', function(){
        MousePressed = false;
    });
    let player = new Player(window.innerWidth/2, 30, 0, 3);
    let bullets = new Bullets();
    let enemies = new Enemies();

    player.update();

    setInterval(() => {
        player.update();
        applyVelocity(player);
        shootCooldown(fireRate, bullets, player);
        bullets.update();
        createEnemy(enemyCooldown, enemies);

        enemies.update(bullets, player);

        preventOverload();
    }, 20);
}

function createEnemy(cooldownSec, enemies){
    if(enemyOnCooldown === false){
        enemyOnCooldown = true;
        time2 = 1;

        enemies.newEnemy(getRandomInt(0, window.innerWidth), 1100, 180, 5, 3, enemiesSpawned); //5speed 3hp
        enemiesSpawned += 1;
    }
    else{
        if(time2 % (cooldownSec * 50) === 0){
            enemyOnCooldown = false;
        }
        time2++;
    }
}

function shootCooldown(sec, bullets, player) {
    if (isOnCooldown === false) {
        shoot(bullets, player);
    }
    else{
        // % 50 is 1 second
        if (time % (sec * 50) === 0) { 
            isOnCooldown = false;
        }
        time++; 
    }
}

function shoot(bullets, player){
    if(MousePressed){
        bullets.newBullet(player, 20, bulletsShot);
        bulletsShot += 1;
        isOnCooldown = true;
        time = 1;
        return;
    }
}

function keyUpHandler(event){
    if(event.keyCode == 39 || event.keyCode == 68) {
      RightArrowPressed = false;
    }
    if(event.keyCode == 37 || event.keyCode == 65) {
      LeftArrowPressed = false;
    }
    if(event.keyCode == 40 || event.keyCode == 83) {
      DownArrowPressed = false;
    }
    if(event.keyCode == 38 || event.keyCode == 87) {
      UpArrowPressed = false;
    }
}
  
function keyDownHandler(event) {
    if(event.keyCode == 39 || event.keyCode == 68) {
      RightArrowPressed = true;
    }
    if(event.keyCode == 37 || event.keyCode == 65) {
      LeftArrowPressed = true;
    }
    if(event.keyCode == 40 || event.keyCode == 83) {
      DownArrowPressed = true;
    }
    if(event.keyCode == 38 || event.keyCode == 87) {
      UpArrowPressed = true;
    }
}
  
function applyVelocity(objPlayer){
    if(RightArrowPressed) {
        objPlayer.setX(objPlayer.getX() + speedX);
    }
    if(LeftArrowPressed) {
        objPlayer.setX(objPlayer.getX() - speedX);
    }
    if(DownArrowPressed) {
        objPlayer.setY(objPlayer.getY() - speedY);
    }
    if(UpArrowPressed) {
        objPlayer.setY(objPlayer.getY() + speedY);
    }
}

function preventOverload(){
    if (bulletsShot > 900) {
        bulletsShot = 0;
    }
}

function getRandomInt(min, max) {
    min = Math.ceil(min);
    max = Math.floor(max);
    return Math.floor(Math.random() * (max - min)) + min;
}