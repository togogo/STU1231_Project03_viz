class Spring2D {

  float vx, vy;
  PVector vpos;
  float x, y;
  PVector pos;//position of the Spring2D
  float gravity;
  float mass;
  float stiffness;
  float damping;


  /*
  void setup(float _x, float _y, float _mass, float _gravity, float _stiffness, float _damping);
  void setup(ofVec2f _pos, float _mass, float _gravity, float _stiffness, float _damping);
  void update(float targetX, float targetY);
  void display(float nx, float ny);
  void setDamping(float _damp);
  void setStiffness(float _stiff);
  void setColorScheme(ofColor _fill, ofColor _stroke);//change the color scheme
  */
  
  Spring2D(){
  }

  void setup(float _x, float _y, float _mass, float _gravity, float _stiffness, float _damping) {
    x = _x;
    y = _y;
    mass = _mass;
    gravity = _gravity;
    stiffness = _stiffness;
    damping = _damping;
  }

  
  void setup(PVector _pos, float _mass, float _gravity, float _stiffness, float _damping) {
    x = _pos.x;
    y = _pos.y;
    mass = _mass;
    gravity = _gravity;
    stiffness = _stiffness;
    damping = _damping;
  }
  

  void update(float targetX, float targetY) {
    float forceX = (targetX - x) * stiffness;
    float ax = forceX / mass;
    vx = damping * (vx + ax);
    x += vx;
    float forceY = (targetY - y) * stiffness;
    forceY += gravity;
    float ay = forceY / mass;
    vy = damping * (vy + ay);
    y += vy;
  }

  void display(float nx, float ny) {


    fill(20, 102, 102);
    ellipse(x, y, 20, 20);

    fill(20, 255, 102);
    ellipse(x, y, nx, ny);
  }

  void setDamping(float _damp) {
    damping = _damp;
  }

  void setStiffness(float _stiff) {
    stiffness = _stiff;
  }

  void Spring2DsetColorScheme(color _fill, color _stroke) {
  }
}
