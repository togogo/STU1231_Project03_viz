class SpringCircle {

  PVector pos;//position of this SpringCircle
  ArrayList<SpringPoint> sp = new ArrayList<SpringPoint>();//dynamic array needed for this SpringCircle

  float r;//diameter of the SpringCircle
  int numSpringPoint;//number of SpringPoints to deploy

  float gravity = 0;
  float velocity = 1.0;

  color firstLayerColor = color(255, 0, 0);
  color secondLayerColor = color(0, 255, 0);
  color thirdLayerColor = color(0, 0, 255);


  SpringCircle() {
  }


  void setup(PVector _pos, float _r, int _num) {
    pos = _pos;//probably don't need to put pos here in the first place...
    r = _r;
    numSpringPoint = _num;
    setCircle();



    //set colors for SpringCircle
  }

  void setCircle() {

    //cout << "am I being called?" << endl;//for debudding purposes...this was called

    //iterate to place the cirlcles
    for (int i = 0; i<numSpringPoint; i++) {

      PVector tempPos = new PVector();
      SpringPoint tempSP = new SpringPoint();
      //println(tempSP.first.mass);
      //tempSP.setup();
      //cout << pos.x << endl;
      //instantiate the SpringPoints based on sin/cos functions, and r

      tempPos.x = pos.x + cos(TWO_PI / numSpringPoint * i) * r;
      tempPos.y = pos.y + sin(TWO_PI / numSpringPoint * i) * r;

      //        tempPos.x = ofGetMouseX() + cos(TWO_PI / numSpringPoint * i) * r;
      //        tempPos.y = ofGetMouseY() + sin(TWO_PI / numSpringPoint * i) * r;

      tempSP.setPos(tempPos);

      //instantiate and add SpringPoint to vector
      sp.add(tempSP);
    }
  }

  void update() {
    velocity *= gravity;
    for (int i = 0; i<sp.size(); i++) {
      PVector tempPos = new PVector();
      //        tempPos.x = ofGetMouseX() + cos(TWO_PI / numSpringPoint * i) * r;
      //        tempPos.y = ofGetMouseY() + sin(TWO_PI / numSpringPoint * i) * r;
      tempPos.x = pos.x + cos(TWO_PI / numSpringPoint * i) * r;
      tempPos.y = pos.y + sin(TWO_PI / numSpringPoint * i) * r;
      tempPos.y += velocity;

      /*this needs to be fixed*/
      //this is what I was doing initially...
      //sp[i].update(tempPos);//can't do this Java ArrayList...

      SpringPoint tempSP = new SpringPoint();
      //sp.set(i, tempPos);//nope, this doesn't work as well...
      tempSP = sp.get(i);
      tempSP.update(tempPos);
      sp.set(i, tempSP);//this is doing some harm to my code...
    }
  }

  void eraseMe() {
    if (pos.y > height + 200 || pos.x > width + 200) {
      //this is depricated
    }
  }

  void draw() {
    for (int i = 0; i<sp.size(); i++) {
      SpringPoint tempSP = new SpringPoint();
      tempSP = sp.get(i);
      tempSP.draw();
      //sp[i].draw();
    }
  }

  void drawSurface() {

    //ofEnableBlendMode(OF_BLENDMODE_ALPHA);
    //ofEnableBlendMode(OF_BLENDMODE_ADD);
    //ofEnableBlendMode(OF_BLENDMODE_MULTIPLY);

    //third layer
    //ofSetColor(100, 200, 100);//temporary color
    //ofSetColor(0, 160, 233);//temporary color, cyan
    fill(thirdLayerColor);
    //ofSetColor(myColorScheme.returnRandColorFromRandPalette());
    beginShape();
    //start the shape
    SpringPoint startSP = new SpringPoint();
    startSP = sp.get(0);
    SpringPoint secondSP = new SpringPoint();
    secondSP = sp.get(1);
    SpringPoint thirdSP = new SpringPoint();
    thirdSP = sp.get(2);
    
    
    curveVertex(startSP.third.x, startSP.third.y);
    for (int i = 0; i<sp.size(); i++) {

      SpringPoint tempSP = new SpringPoint();
      tempSP = sp.get(i);
      //curveVertex(sp[i].third.x, sp[i].third.y);//drawing the "third" SpringPoints
      curveVertex(tempSP.third.x, tempSP.third.y);//drawing the "third" SpringPoints
    }
    
    //close the circle
    SpringPoint endSP = new SpringPoint();
    endSP = sp.get(sp.size()-1);
    //curveVertex(endSP.third.x, endSP.third.y);
    curveVertex(startSP.third.x, startSP.third.y);
    curveVertex(secondSP.third.x, secondSP.third.y);
    curveVertex(thirdSP.third.x, thirdSP.third.y);
    endShape(CLOSE);

    //second layer
    //ofSetColor(200, 100, 200);//temporary color
    fill(secondLayerColor);
    //ofSetColor(myColorScheme.returnRandColorFromRandPalette());
    //ofSetColor(228, 0, 127);//temporary color, magenta
    beginShape();
    
    SpringPoint startSP2 = new SpringPoint();
    startSP2 = sp.get(0);
    
    SpringPoint secondSP2 = new SpringPoint();
    secondSP2 = sp.get(1);
    
    SpringPoint thirdSP2 = new SpringPoint();
    thirdSP2 = sp.get(2);
    for (int i = 0; i<sp.size(); i++) {



      SpringPoint tempSP = new SpringPoint();
      tempSP = sp.get(i);
      //curveVertex(sp[i].second.x, sp[i].second.y);//drawing the "second" SpringPoints
      curveVertex(tempSP.second.x, tempSP.second.y);//drawing the "third" SpringPoints
    }
    curveVertex(startSP2.second.x, startSP.second.y);
    curveVertex(secondSP2.second.x, secondSP.second.y);
    curveVertex(thirdSP2.second.x, thirdSP.second.y);
    endShape(CLOSE);

    //first layer
    //ofSetColor(200, 200, 100);//temporary color
    fill(firstLayerColor);
    //ofSetColor(myColorScheme.returnRandColorFromRandPalette());
    //ofSetColor(255, 241, 0);//temporary color, yellow
    beginShape();
    SpringPoint startSP3 = new SpringPoint();
    startSP3 = sp.get(0);
    
    SpringPoint secondSP3 = new SpringPoint();
    secondSP3 = sp.get(1);
    
    SpringPoint thirdSP3 = new SpringPoint();
    thirdSP3 = sp.get(2);
    for (int i = 0; i<sp.size(); i++) {


      SpringPoint tempSP = new SpringPoint();
      tempSP = sp.get(i);
      //curveVertex(sp[i].first.x, sp[i].first.y);//drawing the "first" SpringPoints
      curveVertex(tempSP.first.x, tempSP.first.y);//drawing the "third" SpringPoints
    }
    curveVertex(startSP3.first.x, startSP.first.y);
    curveVertex(secondSP3.first.x, secondSP.first.y);
    curveVertex(thirdSP3.first.x, thirdSP.first.y);
    endShape(CLOSE);
  }

  void setPos(PVector _pos) {
    pos = _pos;
  }

  void setThreeColors(color _color1, color _color2, color _color3) {
    firstLayerColor = _color1;
    secondLayerColor = _color2;
    thirdLayerColor = _color3;
  }

  void resetPhysics() {
    float gravity = 1.008;
    float velocity = 1.0;
  }
}
