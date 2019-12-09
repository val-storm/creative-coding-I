
PImage stars;
PImage astro;
float astroScale = 1.0;

void setup () {

  size(800, 800);
  stars = loadImage("stars.jpg");
  astro = loadImage("astronaut.png");
  stars.resize(800,800);
  astro.resize(astro.width*2,astro.height*2);
  colorMode(HSB);

}

void draw () {
  
  background(stars);
  textSize(100);
  textAlign(CENTER);
  text(frameRate, 100, 100);
  tint(255*astroScale, 255);
  if(mousePressed){ //last key in register
    tint(255*astroScale, 255, 255);
  }
  pushMatrix();
  translate(width/2, height/2);
  rotate((1-astroScale)*2*PI);
  imageMode(CENTER);
  image(astro, 0, 0, astro.width*astroScale, astro.height*astroScale);
  popMatrix();
  
  pushMatrix();
  translate(width/2, height/2);
  rotate(astroScale*2*PI);
  imageMode(CORNERS);
  image(astro, 0, 0, astro.width*astroScale, astro.height*astroScale);
  popMatrix();
  
  astroScale -= 0.001;
  if(astroScale < 0.0){
    astroScale = 1.0;
  }
}


void mousePressed () {
  
}
