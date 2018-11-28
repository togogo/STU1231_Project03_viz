import controlP5.*;

/*

 1. Maybe introduce controlP5 to alter some of the designs?
 -
 2.Introduce the debugDraw mode in SpringCircle
 3. Also introduce the separate screen library
 
 */


//p5GUI related stuff
ControlFrame cf;
ControlP5 cp5;
Slider2D mainPosSlider2D;


SpringCircle main = new SpringCircle();

float mainR = 200;
float mainRX;
float mainRY;

void settings() {
  size(900, 900);
}

void setup() {


  cf = new ControlFrame(this, 900, 400, "Controls");
  surface.setLocation(10, 10);
  ellipseMode(CENTER); 
  blendMode(ADD);

  PVector initPos = new PVector(width/2, height/2);
  main.setup(initPos, mainR, 10);
}


void draw() {
  background(0);  

  print();

  //float x = mainPosSlider2D.getArrayValue()[0];
  //float y = mainPosSlider2D.getArrayValue()[1];
  float x = 100;
  float y = 100;

  PVector mainPos = new PVector(mainRX, mainRY);


  main.setPos(mainPos);
  main.drawSurface();
  //test.draw();
  main.update();
  main.setR(mainR);

  //println(test.sp.size());
  //println(mainPosSlider2D.getArrayValue()[0]);
  //println(mainPosSlider2D.getCursorX());

  //ellipse(mouse.x, mouse.y, 30, 30);//for debugging purposes.
}

class ControlFrame extends PApplet {

  int w, h;
  PApplet parent;


  public ControlFrame(PApplet _parent, int _w, int _h, String _name) {
    super();   
    parent = _parent;
    w=_w;
    h=_h;
    PApplet.runSketch(new String[]{this.getClass().getName()}, this);
  }

  public void settings() {
    size(w, h);
  }

  public void setup() {
    surface.setLocation(10, 950);
    cp5 = new ControlP5(this);

    mainPosSlider2D = cp5.addSlider2D("Circle Pos")
      .setPosition(30, 40)
      .setSize(100, 100)
      .setMinMax(0, 0, parent.width, parent.height)
      .setValue(parent.width/2, parent.height/2)
      //.disableCrosshair()
      ;

    cp5.addSlider("circle radius")
      .plugTo(parent, "mainR")
      .setRange(100, 500)
      .setValue(200)
      .setPosition(10, 10)
      .setSize(200, 30);

    cp5.addSlider("# of people")
      .plugTo(parent, "auto")
      .setRange(3, 10)
      .setValue(10)
      .setPosition(10, 50)
      .setSize(200, 30);

    /*
    cp5.addToggle("auto")
     .plugTo(parent, "auto")
     .setPosition(10, 70)
     .setSize(50, 50)
     .setValue(true);
     
     cp5.addKnob("blend")
     .plugTo(parent, "c3")
     .setPosition(100, 300)
     .setSize(200, 200)
     .setRange(0, 255)
     .setValue(200);
     
     cp5.addNumberbox("color-red")
     .plugTo(parent, "c0")
     .setRange(0, 255)
     .setValue(255)
     .setPosition(100, 10)
     .setSize(100, 20);
     
     cp5.addNumberbox("color-green")
     .plugTo(parent, "c1")
     .setRange(0, 255)
     .setValue(128)
     .setPosition(100, 70)
     .setSize(100, 20);
     
     cp5.addNumberbox("color-blue")
     .plugTo(parent, "c2")
     .setRange(0, 255)
     .setValue(0)
     .setPosition(100, 130)
     .setSize(100, 20);
     
     cp5.addSlider("speed")
     .plugTo(parent, "speed")
     .setRange(0, 0.1)
     .setValue(0.01)
     .setPosition(100, 240)
     .setSize(200, 30);
     */
  }

  void draw() {
    background(0);
    
    mainRX = mainPosSlider2D.getArrayValue()[0];
    mainRY = mainPosSlider2D.getArrayValue()[1];
    
    //println(mainPosSlider2D.getArrayValue()[0]);
    
  }
}
