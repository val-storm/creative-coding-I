int cols = 10;
int rows = 10;
int depth = 10;
int colwidth;
int rowWidth;
float rotation_index_x = 0;
float rotation_index_y = 0;
int offset = 0;
float litUp = 0;

void setup () {
  
  size(640, 640, P3D);
  colwidth = (width/2)/cols;
  rowWidth = (height/2)/rows;
}

void draw () {
  
  background(0);
  noFill();
  stroke(255);
  colwidth = (width/2)/cols;
  rowWidth = (height/2)/rows;
  translate(width/2, height/2, 100);
  rotateY(rotation_index_y);
  translate(-width/4, -height/4);
  for(int x = 0; x < cols; x++) {
    for(int y = 0; y < rows; y++) {
      for(int z = 0; z < depth; z++) {
        pushMatrix();
        float brightness = map((z + litUp) % 10, 0, 9, 255, 0); 
        translate(x*colwidth, y*rowWidth, 100 - z*colwidth);
        stroke(255, 255, 255, brightness);
        //rotateY(rotation_index_y);
        box(colwidth * 0.50);
        popMatrix();
      }
    }
  }
  rotation_index_y += 0.01;
  offset +=1;
  if(offset > 155)
    offset = 0;
  if(frameCount % 5 == 0)
    litUp++;
}
