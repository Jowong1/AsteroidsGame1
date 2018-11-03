class Asteroid extends Floater{
  public void setX(int x){myCenterX = x;}
  public int getX() {return((int)myCenterX);}
  public void setY(int y) {myCenterY = y;}
  public int getY() {return((int)myCenterY);}
  public void setDirectionX(double x) {myDirectionX = x;}   
  public double getDirectionX() {return(myDirectionX);}
  public void setDirectionY(double y) {myDirectionY = y;}   
  public double getDirectionY() {return(myDirectionY);}   
  public void setPointDirection(int degrees) {myPointDirection = degrees;}   
  public double getPointDirection() {return(myPointDirection);}
  float dRadians = (float)(myPointDirection*(Math.PI/180));
  public Asteroid(){
    //myCenterX = ship.getX();
    //myCenterY = ship.getY();
    //myPointDirection = ship.getPointDirection();
    //double dRadians = myPointDirection * (Math.PI/180);
    myDirectionX = 10 * Math.cos(dRadians) + fighter.getDirectionX();
    myDirectionY = 10 * Math.sin(dRadians) + fighter.getDirectionY();
  }
  
  public void show(){
    translate((int)fighter.getX() - 400, (int)fighter.getY() - 250);
    rotate(dRadians);
    fill(255,0, 0, 175);
    rect(40, 0, 25, 3, 50);
    // Unrotate
    rotate(-1*dRadians);
    translate(-1*(int)fighter.getX(), -1*(int)fighter.getY());
  }
  
  public void move(){
    myCenterX += myDirectionX;    
    myCenterY += myDirectionY;
  }
}
