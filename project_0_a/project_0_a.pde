PImage face1;
PImage face2;
PImage mask1;
PImage mask2;

float x1, x2;

float shift;
float transparency;

float greens = 0;

void setup () {
  size(500, 500);
  
  face1 = loadImage("face1.png");
  face2 = loadImage("face2.png");
  mask1 = loadImage("mask1.png");
  mask2 = loadImage("mask2.png");
  
  face1.resize(face1.width/2, face1.height/2);
  face2.resize(face2.width/2, face2.height/2);
  mask1.resize(mask1.width/2, mask1.height/2);
  mask2.resize(mask2.width/2, mask2.height/2);

  x1 = 0;
  x2 = 0;
  shift = 0;
  
}

void draw () {
  
  translate(width/2, height/2);
  
  shift = map(mouseX, 0, 500, 0, 50);
  transparency = map(mouseY, 0, 500, 0, 255);
  /*
  if(frameCount % 2 == 0){
    x1 = shift;
    x2 = -shift;
  } else {
    x1 = -shift;
    x2 = shift;
  }
  */
  imageMode(CENTER);
  
  background(0);
  tint(255, greens, 0, (transparency + 0) % 255);
  image(mask2, x1, 0);
  tint(0, greens, 255, (transparency + 62) % 255);
  image(face1, x2, 0);
  tint(255, greens, 0, (transparency + 127) % 255);
  image(face2, x1, 0);
  tint(0, greens, 255, (transparency + 192) % 255);
  image(mask1, x2, 0);
  
  greens += 0.5;
  
  if(greens > 255)
    greens = 0;
}
