
PVector sphereCenters[];
//int locations[][][][];

void setup () {
  
  size(640, 640, P3D);
 
  sphereCenters = new PVector[10];
}

void draw () {
  
  sphereCenters[5].add();
  background(0);
  noFill();
  stroke(255);
  translate(width/2, height/2, 100);
 
    
}
