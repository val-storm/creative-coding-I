/************************************************
*
* FLOATING MASKS 
*    mouse coordinates move two masks around the
*    center of the canvas and also affects alpha.
*    mousePressed inverts color scheme.
*
************************************************/

PImage mask;

float shiftX;
float shiftY;
float colorShift;

int c1 = 255;
int c2 = 0;


void setup () {
  size(500, 500);
  
  mask = loadImage("mask2.png");
  
  mask.resize(mask.width/2, mask.height/2);

  shiftX = 0;
  shiftY = 0;
  
}

void draw () {
  
  translate(width/2, height/2);
  
  //map mouse coordinates to usable values
  shiftX = map(mouseX, 0, 500, -50, 50);
  shiftY = map(mouseY, 0, 500, -50, 50);
  colorShift = map((mouseX+mouseY)/2, 0, 500, -127, 127);
  
  if(mousePressed){
    c1 = 0;
    c2 = 255;
  } else {
    c1 = 255;
    c2 = 0;
  }
 
  imageMode(CENTER);
  
  background(0);
  tint(c1, 127+colorShift, c2, 127-colorShift);
  image(mask, shiftX, shiftY);
  
  scale(-1, 1); //scale can flip canvas (1,-1) would flip along y axis
  
  tint(c2, 127-colorShift, c1, 127+colorShift);
  image(mask, shiftX, -shiftY);
  
}
