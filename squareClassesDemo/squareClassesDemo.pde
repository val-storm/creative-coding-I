Square[] Squares = new Square[10000];

void setup() {
  fullScreen(P3D);
  
   for(int i = 0; i < Squares.length; i++){
     Squares[i] = new Square();
   }
}

void draw () {
  
  background(0);
  
  for(int i = 0; i < Squares.length; i++){
    
    Squares[i].update();
    Squares[i].display();
    //Squares[i].checkEdges();
    if(Squares[i].isOutThere())
      Squares[i] = new Square();
    
  }
  
}
