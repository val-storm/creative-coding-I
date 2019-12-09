float angle = 0.1;
float amplitude;

void setup () {
  
  size(720, 720, P3D);
  amplitude = height/4;
  
}

void draw () {
  background(0);
  noFill();
  stroke(255);
  translate(width/2, height/2);
  pushMatrix();
  translate(sin(angle)*amplitude, cos(angle/2)*amplitude);
  sphere(100);
  popMatrix();
  angle += 0.01;
  
  
}
