class Perimeter extends Base{
  public Perimeter(){
  }
  public void show(){
    bCX = baseCenterX - (int)fighter.myCenterX;
    bCY = baseCenterY - (int)fighter.myCenterY;
    rectMode(CENTER);
    noFill();
    stroke(255, 0, 0, 150);
    strokeWeight(1000);
    rect(bCX, bCY, 10000, 10000);
    if(bCY -fighter.myCenterY > bCY + 10000){
      println( false);
    }
  }
}
