/*****************************************************
  PCC Creative Coding I - Oscillations vs Logic
  --------------------------------------------------
  Animated infographic for use of sin() and cos()
  instead of conditionals to control/constrain movement
  
  Remember: our angle is in RADIANS...
    0 - 360 degrees is 0 - 2*PI in RADIANS (6.28...)
  
  amplitude changes max travel for x and y (pixels)
  
  This sketch is meant to highlight the use of math
  instead of logic (if, else) to control movement of
  animations. Lookback to our bouncing ball sketch 
  from the first day...
  
  sin and cos give us values between -1 and 1. 
  
  50% of a number is number*0.50
  
  so by "oscillating" between -100% and 100%  of a value 
  we can automate values to go between the max travel in 
  the negative, to the max travel in the positive direction
  without using conditionals to check the values of location variables.
  
  for more info on sin and cosine:
  https://jackschaedler.github.io/circles-sines-signals/sincos.html

*****************************************************/




float angle = 0.1;
float amplitude;
int trailLength = 50;
float x;
float y;

void setup () {
  
  size(720, 720, P3D);
  amplitude = height/4;
  textMode(SHAPE);
  
}

void draw () {
  background(0);
  
  //try experimenting with these expressions...
  //what happens when we do sin(pow(angle, 2)?
  //sin(angle - PI)?
  
  x = sin(angle)*amplitude;
  y = cos(angle/2)*amplitude; //what about angle*2?
  
  
  lights();
  fill(255);
  stroke(255);
  
  //printing infographic to the screen
  textSize(20);
  text("degree of angle: " + degrees(angle) % 360, 20, 40);
  translate(width/2, height/2);
  textSize(10);
  stroke(0, 255, 0);
  line(0, 0, sin(angle)*amplitude, 0);
  text("sin(angle) = " + sin(angle), sin(angle)*amplitude, -20);
  stroke(0, 0, 255);
  line(0, 0, 0, cos(angle/2)*amplitude);
  text("cos(angle/2) = " + cos(angle/2), 0, cos(angle/2)*amplitude + 10);
  
  //draw some more lines
  drawGrid();
  
  //this loop draws a bright point at current x, y
  //for as many times as trailLength draw a slightly
  //dimmer point at what x,y was about i frames ago
  for(int i = 0; i < trailLength; i++){   
    fill(255, 255, 255, 255 - (i*6)); //make each next loops fill slightly dimmer
    noStroke();
    pushMatrix();
    float delay = radians(i); //as i increases so does our delay
    //if every new draw loop angle += 0.01, our previous locations would be
    //angle - 0.01, so as i gets bigger, we are going back to recently passed
    //x,y positions by subtracting slightly increasing amounts from our "angle"
    translate(sin(angle - delay)*amplitude, cos((angle - delay)/2)*amplitude);
    rect(0,0,2,2);
    popMatrix();
  }
  
  //draw a sphere at x,y
  //z index = -101 to move it far behind the text
  pushMatrix();
  noStroke();
  fill(127);
  translate(sin(angle)*amplitude, cos(angle/2)*amplitude, -100);
  sphere(50);
  popMatrix();
  
  //increment the little variable that is driving
  //this whole animation.
  angle += 0.01;
  
}

void drawGrid () {
  
  stroke(255);
  line(-amplitude, 10, -amplitude, -10);
  text("x = -amplitude", -amplitude, 20);
  line(amplitude, 10, amplitude, -10);
  text("x = amplitude", amplitude, 20);
  line(-10, -amplitude, 10, -amplitude);
  text("y = -amplitude", 0, -amplitude - 10);
  line(-10, amplitude, 10, amplitude);
  text("y = amplitude", 0, amplitude + 10);
}
