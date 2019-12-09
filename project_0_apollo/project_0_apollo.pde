
PImage stars;
PImage astro;
float astroScale = 1.0;
float starScale = 1.0;


void setup () {

  size(800, 800);
  stars = loadImage("stars.jpg");
  astro = loadImage("astronaut.png");
  stars.resize(800,800);
  astro.resize(astro.width*2,astro.height*2);
  colorMode(HSB);

}

void draw () {
  
  background(0);
 
  
  pushMatrix();
  tint(255, 0, 255*(astroScale));
  translate(width/2, height/2);
  imageMode(CENTER);
  image(stars, 0, 0, stars.width*starScale, stars.height*starScale);
  popMatrix();
  
  //tint back to normal unless keyPressed
  tint(255*astroScale, 255);
  if(keyPressed){
    tint(key, 255, 255); 
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
  starScale += 0.001;
  if(starScale > 2.0){
    starScale = 1.0;
  }
  
  fill(255);
  text("Last Key Pressed: " + key, 10, 10);
  text("ASCII Value: " + int(key), 10, 30);
}


void mousePressed () {
  
  astroScale = 1.0;
  starScale = 1.0;
  
}
