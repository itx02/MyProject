import processing.sound.*;
SoundFile GameOver;

float ballX = 0;
float ballY = 0;
float speedX = 15;
float speedY = 1;
int hit = 0;
int lives = 3;
color colour;


void setup() {
  size (800, 500);
  colour = color(255,0,0);
  GameOver = new SoundFile(this, "GameOver.mp3");
  
}

void draw () {
  

  float paddle = 1000/(hit+10);
  
  background (0, 0, 0);
  ball ();

  fill (0, 0, 255);
  rect (mouseX-paddle, height-10, 2*paddle, 10);



  fill (255, 255, 255);
  textSize (20);
  text ("HITS:" + hit, 10, 20);
  text ("LIVES:" + lives, 10, 40);


  if (ballX<0 || ballX > width-25) speedX = -speedX;
  if (ballY > height-50)
  {
    speedY = -speedY;
    float distance = abs (mouseX-ballX);

    if (distance < paddle+20) {
      hit += 1; 
      colour=color(random(255), random(255), random(255));
    } else lives -= 1;
  } else speedY += 1;


  ballX += speedX;
  ballY += speedY;

  if (mousePressed)
  {
    hit = 0; 
    lives = 3;
  }

  if (lives < 1 && !mousePressed) {

    background (0, 0, 0);
    
    GameOver.play();
    text ("GAMEOVER, CLICK HERE TO PLAY AGAIN", width/2-200, height/2);
    
  }
}

void ball () {

  fill (colour);
  ellipse(ballX, ballY, 50, 50);
}
