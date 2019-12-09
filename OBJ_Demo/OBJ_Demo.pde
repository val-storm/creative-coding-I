PShape cactus;

void setup () {
  size(600, 400, P3D);
  cactus = loadShape("gourd.obj");
  
}

void draw () {
  background(0);
  lights();
  cactus.setFill(127);
  scale(200, 200, 200);
  translate(width/2, height/2);
  shape(cactus, 0, 0);
  
}
