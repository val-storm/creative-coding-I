PImage pGoat1, pGoat2, pGoat3, GGoat4, bg;

float x1, y1, x2, y2, x3, y3, x4, y4;
boolean goatLookin = false;
boolean timeToHide = false;


void setup () {
  size(800,600);
  pGoat1 = loadImage("prettyGoat1.png");
  pGoat2 = loadImage("prettyGoat2.png");
  pGoat3 = loadImage("prettyGoat3.png");
  GGoat4 = loadImage("gorgeousGoat.png");
  bg = loadImage("IsleOfMan.jpg");
  bg.resize(800,600);
  x3 = 0;
  y3 = 75;
}

void draw () {
  background(0);
  tint(map(mouseX, 0, 800, 0, 255), 150, 150, 255);
  imageMode(CORNER);
  image(bg, 0, 0);
  
  pushMatrix();
  translate(420, 150);
  imageMode(CENTER);
  tint(255, 255);
  image(pGoat1, 0, 0, pGoat1.width/2, pGoat1.height/2);
  popMatrix();
  
  pushMatrix();
  translate(400, 400);
  imageMode(CENTER);
  tint(255, 255);
  image(pGoat2, 0, 0, pGoat2.width/2, pGoat2.height/2);
  popMatrix();
  
  if(frameCount % 150 == 0){
    goatLookin = !goatLookin;
  }
  
  //Staring Goat
  if(goatLookin){
    pushMatrix();
    translate(600, 650);
    imageMode(CENTER);
    tint(255, 255);
    image(pGoat3, x3, y3, pGoat3.width/2, pGoat3.height/2);
    popMatrix();
    
    if(y3 < 0){
      timeToHide = true;
    }
    
    if(timeToHide){
      y3 += 1;
    } else {
      y3 -= 1;
    } 
      
  } else {
    y3 = 75;
    timeToHide = false;
  }
  
  pushMatrix();
  translate(200, 480);
  imageMode(CENTER);
  tint(255, 255);
  image(GGoat4, 0, 0, GGoat4.width/3, GGoat4.height/3);
  popMatrix();
  
  
}
