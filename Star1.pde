class Star //note that this class does NOT extend Floater
{
  private int myX, myY, myR, myS;
  public Star(){
    int starRange = 10000;
    myX = (int)(Math.random()*starRange);
    myY = (int)(Math.random()*starRange);//random(height);
    myR = (int)(Math.random()*5)+10;
    myS = (int)(Math.random()*80)+30;
  }
  //public void setX(int x){
  //  myX = x;
  //}
  //public void setY(int y){
  //  myY = y;
  //}
  //public void setR(int r){
  //  myR = r;
  //}
  //public int getX(){
  //  return myX;
  //}
  //public int getY(){
  //  return myY;
  //}
  //public int getR(){
  //  return myR;
  //}
  public void show(){
    //noStroke();
    //translate(0,0);
    noStroke();
    fill(255, myS); //original 75 shade
    ellipse(myX - (int)fighter.myCenterX, myY -(int)fighter.myCenterY, myR, myR);
    //ellipse(0,0,50,50);
    //ellipse(mouseX, mouseY, 10, 10);
  }
}
