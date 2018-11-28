import controlP5.*;

/*

1. Maybe introduce controlP5 to alter some of the designs?
  -
2.Introduce the debugDraw mode in SpringCircle


*/


SpringCircle main = new SpringCircle();

void setup(){
  size(900 , 900);
  ellipseMode(CENTER); 
  blendMode(ADD);
  
  PVector initPos = new PVector(width/2, height/2);
  main.setup(initPos, 400, 10);
}


void draw(){
  background(0);  
  
  PVector mouse = new PVector(mouseX, mouseY);

  
  main.setPos(mouse);
  main.drawSurface();
  //test.draw();
  main.update();
  
  //println(test.sp.size());
  
  //ellipse(mouse.x, mouse.y, 30, 30);//for debugging purposes.
  
}
