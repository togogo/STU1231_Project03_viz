class SpringPoint {



  /*
  void setup();
   //void update();//depricated
   void update(ofVec2f _pos);//set position of the SpringPoint
   void draw();
   void setPos(ofVec2f _pos);//set position of the SpringPoint
   */

  PVector pos;//position of the SpringPoint

  Spring2D first = new Spring2D();
  Spring2D second = new Spring2D();
  Spring2D third = new Spring2D();

  //just using this temporarily...
  float gravity;// = 0.0;//test value
  float mass;// = 3.0;//test value
  float stiffness;// = 0.2;//test value
  float damping;// = 0.8;//test value

  SpringPoint() {

    gravity = 0.0;//test value
    mass = random(2.0, 3.0);//test value
    stiffness = random(0.1, 0.2);//test value
    damping = random(0.4, 0.8);//test value

    first.setup(0.0, width / 2, mass, gravity, stiffness, damping);

    mass = random(2.0, 3.0);//test value
    stiffness = random(0.1, 0.2);//test value
    damping = random(0.4, 0.8);//test value

    second.setup(0.0, width / 2, mass, gravity, stiffness, damping);

    mass = random(2.0, 3.0);//test value
    stiffness = random(0.1, 0.2);//test value
    damping = random(0.4, 0.8);//test value

    third.setup(0.0, width / 2, mass, gravity, stiffness, damping);
  }

  void setup() {

    //define the physics value three times so that every SpringPoint's physics is randomized.
    //just a temporary solution...need to flesh out this in a cleaner manner...

    gravity = 0.0;//test value
    mass = random(2.0, 3.0);//test value
    stiffness = random(0.1, 0.2);//test value
    damping = random(0.4, 0.8);//test value

    first.setup(0.0, width / 2, mass, gravity, stiffness, damping);

    mass = random(2.0, 3.0);//test value
    stiffness = random(0.1, 0.2);//test value
    damping = random(0.4, 0.8);//test value

    second.setup(0.0, width / 2, mass, gravity, stiffness, damping);

    mass = random(2.0, 3.0);//test value
    stiffness = random(0.1, 0.2);//test value
    damping = random(0.4, 0.8);//test value

    third.setup(0.0, width / 2, mass, gravity, stiffness, damping);
  }

  //*depricated
  //void SpringPoint::update() {
  //    base.update(ofGetMouseX(), ofGetMouseY());//this part is kinda redundant...
  //    //base.update(pos.x, pos.y);
  //    extend.update(base.x, base.y);
  //}

  void update(PVector _pos) {
    setPos(_pos);
    first.update(pos.x, pos.y);
    second.update(first.x, first.y);
    third.update(second.x, second.y);
  }

  void draw() {
    first.display(pos.x, pos.y);//probably you don't need to put ofVec2f pos here in the first place...
    second.display(first.x, first.y);//probably you don't need to put ofVec2f pos here in the first place...
    third.display(second.x, second.y);//probably you don't need to put ofVec2f pos here in the first place...a
  }

  void setPos(PVector _pos) {
    pos = _pos;
  }
}
