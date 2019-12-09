/******************************************************
 
 DO NOT BE AFRAID! THERE ARE LOTS OF NEW THINGS HAPPENING!
 IT IS NOT NECESSARY YOU UNDRESTAND ALL OF THIS RIGHT NOW.
   *ESPECIALLY IF YOU MISSED CLASS!*
     hit me up if you did
 This sketch is an excercise in FORSHADOWING (Literally)
 Break it. Download it again. Break it. Download it again.
 
********************************************************/



float lightDirX = 0;
float angle = 0;
float lightDirY = 0;
PVector locations[];

void setup(){
  size(640,640,P3D);
  
  //standard array initialization
  //change "PVector" to whatever data type your array is
  locations = new PVector[60];
  
  //Because PVector is a special object we need to initialize
  //each one in particular. Imagine if this array was PImage type...
  //we would need a loadImage("theImageIWantToLoad.png") call for each item. This is
  //the PVector version of that protocol. We are using a for loop to automate this.
  for(int i = 0; i < locations.length; i++){
    locations[i] = new PVector(random(width),random(height));
  }
}

void draw () {
  
  //nothing new here!
  background(0);
  noStroke();
  fill(200);
  
  //directional light takes values between -1 and 1 for it's last
  //three arguments. If you were in class this shouldnt suprise you.
  //Here we take the sin and cos of an increasing "angle" to...
  //OSCILLATE between -1 and 1. Math is fun?
  lightDirX = sin(angle);
  lightDirY = cos(angle);
  
  //display our lights, use our above "unit vectors" to change
  //the direction of our blue and green lights.
  directionalLight(0, 0, 255, lightDirX, lightDirY, -1);
  directionalLight(0, 255, 0, -lightDirX, -lightDirY, -1);
  
  //update our locations where the spheres are drawn
  //this is where the movement is happening
  for(int i = 0; i < locations.length; i++){
    PVector direction = PVector.random2D(); //create a small amount of change
    direction.mult(random(10)); //scale the amount of change to a fraction of 10
    locations[i].add(direction); //this adds the above change to our previous location
  }

  //draw spheres at our new locations
  for(int i = 0; i < locations.length; i++){
    pushMatrix(); 
    translate(locations[i].x, locations[i].y);
    sphere(10);
    popMatrix();
  }
  
  //good practice to increase variables that change at the end of loop!
  angle += 0.01;
}
