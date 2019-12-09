//Demonstrates the problems with using signed values 
//at the higher end of their ranges

int lowestValue;
int highestValue;

int difference;

//long is a 64 bit signed number, so is can store much
//"longer" numbers.
long actualDifference;

void setup () {
  
  size(500, 200);
  lowestValue = Integer.MIN_VALUE;
  highestValue = Integer.MAX_VALUE;
  difference = highestValue - lowestValue;
  actualDifference = (long) highestValue - (long) lowestValue;
}

void draw () {
  background(255);
  fill(0);
  textSize(10);
  text("   " + highestValue, 10, 20);
  text("- (" + lowestValue + ")", 10, 35);
  text("   " + difference, 10, 65);
  
  text("   " + highestValue, 150, 20);
  text("- (" + lowestValue + ")", 150, 35);
  text("   " + actualDifference, 150, 65);
  
  line(10, 45, 250, 45);

}
