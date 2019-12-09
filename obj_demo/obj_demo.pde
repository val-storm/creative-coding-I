/*******************************************************************
  PCC Creative Coding - Loading 3D models int Processing
  ------------------------------------------------------
  
  When trying to load other models, remember that 
  different files have different "hard coded" sizes.
  So while these scale arguments work for these obj files, 
  they might cause others to be either too small or too big
  to be visible comment out scale() calls if you are having trouble.
  
********************************************************************/


PShape powerLines;
PShape auto;
float carX, carY, carZ;
float radz = 0.0;
float orbitSize = 600;
void setup () {
   fullScreen(P3D);
   powerLines = loadShape("power_lines.obj"); //load the obj file *only do once*
   auto = loadShape("alfa147.obj");
}

void draw () {
  background(0);
  lights();
  translate(width/2, height/2);
  directionalLight(frameCount % 255, 0, 0, 1, 0, 0);
  directionalLight(0, 0, 255, -1, 0, 0);
  directionalLight(255, 0, 0, 0, -1, 0);
  directionalLight(0, 0, frameCount % 255, 0, 1, 0);
  rotateY(map(frameCount % 800, 0, 800, -2*PI, 2*PI));
 
  //try to simulate some kind of orbit
  carX = sin(radz)*orbitSize;
  carY = map(cos(radz), -1, 1, -200, 200);
  carZ = 10 - cos(radz)*orbitSize; 
  
  pushMatrix();
  translate(carX, carY, carZ);
  rotateY(radz);
  rotateX(-radz);
  shape(auto, 0, 0);
  popMatrix();
    
  scale(50, 50, 50);
  shape(powerLines, 0, 0);

  radz += 0.01;
}
