class Square {
  
  float x;
  float y;
  float z;
  float Xspeed;
  float Yspeed;
  color c;
  float h;
  float w;

  Square () {
    //x = random(width);
   // y = random(height);
    x = width/2;
    y = height/2;
    z = 0;
    Xspeed = random(-5.0, 5.0);
    Yspeed = random(-5.0, 5.0);
    c = color(random(255), random(255), random(255));
    h = random(50);
    w = h;
  }
  
  void update () {
    
    x = x + Xspeed;
    y = y + Yspeed;
    //c += #010101;
  }
  
  void display () {
    
    noFill();
    stroke(c);
    rectMode(CENTER);
    rect(x, y, w, h);
    
  }
  
  void checkEdges () {
    
    if(x < 0 || x > width){
      
      Xspeed = Xspeed * -1;
      
    }
    if(y < 0 || y > height){
      
      Yspeed = Yspeed * -1;
      
    }
  }
  
  boolean isOutThere() {
    
    
   if(x < 0 || x > width){
      return true;
    }
    else if(y < 0 || y > height){
      return true;
    } else {
      return false;
    }
  }
      
};
