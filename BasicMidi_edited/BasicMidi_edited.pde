import themidibus.*; //Import the library

MidiBus myBus; // The MidiBus

int cols = 8;
int colWidth;
int[] colColor = new int[8];
float[] alphaVals = new float[8];
float[] rotationVals = new float[8];
int rot = 0;

void setup() {
  size(600, 600, P3D);
  background(0);
  colorMode(HSB);
  colWidth = width/cols;
  MidiBus.list(); // List all available Midi devices on STDOUT. This will show each device's index and name.

  // Either you can
  //                   Parent In Out
  //                     |    |  |
  myBus = new MidiBus(this, 0, -1); // Create a new MidiBus using the device index to select the Midi input and output devices respectively.

  // or you can ...
  //                   Parent         In                   Out
  //                     |            |                     |
  //myBus = new MidiBus(this, "IncomingDeviceName", "OutgoingDeviceName"); // Create a new MidiBus using the device names to select the Midi input and output devices respectively.

  // or for testing you could ...
  //                 Parent  In        Out
  //                   |     |          |
  //myBus = new MidiBus(this, -1, "Java Sound Synthesizer"); // Create a new MidiBus with no input device and the default Java Sound Synthesizer as the output device.
}

void draw() {
  background(0);
  rectMode(CENTER);
  translate(width/2, height/2);

  noFill();
  stroke(255);
  for(int i = 0; i < alphaVals.length; i++) {
    stroke(255, alphaVals[i]);
    pushMatrix();
    rotateX((2.0*PI)*(rotationVals[i]/127.0));
    rect(0, 0, 50*(i+1), 50*(i+1));
    popMatrix();
    rotationVals[i] -= 0.1;
    alphaVals[i] -= 5;
    if(alphaVals[i] < 0)
      alphaVals[i] = 0;
    if(rotationVals[i] < 0)
      rotationVals[i] = 0;
  }
  
   
   
}

void noteOn(int channel, int pitch, int velocity) {
  // Receive a noteOn
  println();
  println("Note On:");
  println("--------");
  println("Channel:"+channel);
  println("Pitch:"+pitch);
  println("Velocity:"+velocity);
  drawLightSquare(pitch, velocity);
  
}

void noteOff(int channel, int pitch, int velocity) {
  // Receive a noteOff
  println();
  println("Note Off:");
  println("--------");
  println("Channel:"+channel);
  println("Pitch:"+pitch);
  println("Velocity:"+velocity);
}

void controllerChange(int channel, int number, int value) {
  // Receive a controllerChange
  println();
  println("Controller Change:");
  println("--------");
  println("Channel:"+channel);
  println("Number:"+number);
  println("Value:"+value);
  changeColumnColor(number, value);
}

void changeColumnColor (int number, int value) {

  rotationVals[number - 1] = (float)value;

}

void drawLightSquare(int number, int brightness) {
 
  alphaVals[number - 36] = brightness*2;
  rotationVals[number - 36] = (float)brightness;
}
