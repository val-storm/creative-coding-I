/*****************************************************
  PCC Creative Coding I - Oscillations vs Logic
  --------------------------------------------------
  Animated infographic to visualize differences in
  methods of contstraining variables used for movement
  
  for more info on sin and cosine:
  https://jackschaedler.github.io/circles-sines-signals/sincos.html

*****************************************************/

float angle = 0.0;
float h = 0;
int cols = 8;
int TEXT_Y = 250;
int colWidth;


void setup () {
  size(600, 600);
  colWidth = width/cols;
}

void draw () {
  background(0);
  translate(width/2, height/2);
  fill(175);
  scale(1, -1);
  rect(-colWidth*3, 0, 10, (h % 275));
  rect(-colWidth*2, 0, 10, sin(angle)*275);
  rect(-colWidth*1, 0, 10, cos(angle)*275);
  rect(colWidth*0, 0, 10, abs(sin(angle)*275));
  rect(colWidth*1, 0, 10, abs(cos(angle)*275));
  angle += 0.01;
  h += 0.5;
}
