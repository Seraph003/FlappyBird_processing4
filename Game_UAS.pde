int koordinatPipaX = 400; // Move 400 - 0
int koordinatPipaY = 0;   // Range -90 -- 50
int koordinatPipaXn = 400; // Move 400 - 0
int koordinatPipaYn = 0;   // Range -90 -- 50
int pipewidth = 80;
int pipespace = 150;
int pipespeed = 5;
int count = 0;
float score = 0;
float playerPos = 250;
float playerVelocity = 0;

void setup() {
  size(500, 500);  
}

void draw() {
  background(255); 
  
  println("===================================");
  println("Koordinat Pipa X:" + koordinatPipaX);
  println("Koordinat Pipa Y:" + koordinatPipaY);
  println("Player Position:" + playerPos);
  println("Player Velocity:" + playerVelocity);
  println("Player Score: " + Math.round(score)); 
  player(); 
  pipe();
  generatePipe();
  control(); 
  updatePlayer(); 
  gameOver();
  powerup();
  powerupGen();
  //Score();
  moretime();
  fill(0);
  textSize(40);
  text("Score: "+ Math.round(score) +" s", 20, 30);
}

void pipe() {
  noStroke();
  // Long Pipe
  fill(#65B741);
  rect(koordinatPipaX, koordinatPipaY - 50, pipewidth, 200);
  rect(koordinatPipaX, koordinatPipaY + 400, pipewidth, 200);
  // Short Pipe
  fill(#C1F2B0);
  rect(koordinatPipaX - 10, koordinatPipaY + 100, pipewidth + 20, 50);
  rect(koordinatPipaX - 10, koordinatPipaY + 400, pipewidth + 20, 50);
}

void powerup(){
  fill(#F4CE14);
   ellipse(koordinatPipaXn - 10 , koordinatPipaYn + 300 , 25, 25);
}

void player() {
  fill(#F4CE14);
  ellipse(50, playerPos, 50, 50);
  fill(#000000);
  ellipse(65, playerPos, 10, 10);
}

void control() {
  if (keyPressed) {
    if (key == ' ') {
      // move up
      playerVelocity = -10; // Adjustable Upw ard
    }
  } 
}

void updatePlayer() { 
  playerPos += playerVelocity;
  playerVelocity += 0.5;
  playerVelocity = constrain(playerVelocity, -10, 10);    
  playerPos = constrain(playerPos, 0, height - 25);  
  score +=0.01;
}  
 
void generatePipe(){   
  koordinatPipaX -= pipespeed;
  if(koordinatPipaX + pipewidth < 0) { 
   koordinatPipaX = width; 
   koordinatPipaY = int(random(-90,50));  
          
  } 
} 

void powerupGen(){  
  koordinatPipaXn -= pipespeed;
    count = int(random(100));
   if(count <1){
     koordinatPipaXn = width; 
     koordinatPipaYn = int(random(-90,50));
  }
}


//void Score(){
// if(playerPos == koordinatPipaX){
//   score= score+1;
// }
//}

void gameOver(){ 
  if ((playerPos < koordinatPipaY + 75 && playerPos > koordinatPipaX - 75) ||
      (playerPos < koordinatPipaY + 170 && playerPos > koordinatPipaX + 45)||
      (playerPos > koordinatPipaY + 370 && playerPos > koordinatPipaX + 375))
  {
    println("Game Over");
    noLoop();
  }
} 

void moretime(){
 if(dist(50, playerPos,koordinatPipaXn - 10 , koordinatPipaYn + 300)<50+25){
   score += 5;
   koordinatPipaYn = 1000;
 }
}
