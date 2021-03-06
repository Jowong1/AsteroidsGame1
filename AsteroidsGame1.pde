/*TO DO LIST
-map perimeter
-bullets
-enemies
-asteroids
-collsion
-upgrades
-instructions manual
-pick fighter? maybe?
*/

Spaceship fighter;
Star[] stars = new Star[2000];
Perimeter border;
ArrayList <Bullet> projectile = new ArrayList<Bullet>();
ArrayList <Asteroid> asteroids = new ArrayList<Asteroid>();
Base home;
//Bullet projectile;
boolean accelerating, decelerating, leftTurn, rightTurn, shoot;
boolean releasedKey = false;
boolean clicked = false;
int accelerateCount = 0;
int decelerateCount = 0;
double ex;
boolean movingMouse = false;
int notMovingMouse;
// UPGRADES
int uSpeed;
// CURRENCY
int nova;
boolean deceleratingDown;
boolean away;
//int counter;

public void setup(){
  size(1000,650);
  frameRate(40);
  strokeJoin(ROUND);
  fighter = new Spaceship();
  border = new Perimeter();
  nova = 4000;
  home = new Base();
        //projectile = new Bullet();
  //stars[i].setX((int)random(width));
  //stars.setY(random(height));
  //stars.setR(10);
  for(int i = 0; i < stars.length; i++){
    //stars[i].setX((int)random(width));
    //stars[i].setY((int)random(height));
    //stars[i].setR(10);
    //stars[i] = new Star((int)stars[i].getX(), (int)stars[i].getY(), (int)stars[i].getR());
    //println(stars[i].getX());
    stars[i] = new Star();
  }
}

public void draw(){
  background(0);
  border.show();
  if(movingMouse == false){
    notMovingMouse++;
  }else{
    cursor(CROSS);
    notMovingMouse = 0;
    movingMouse = false;
  }
  if(notMovingMouse > 100){
    noCursor();
  }
  for(int i = 0; i < stars.length; i++){
    stars[i].show();
  }
  home.show();
  /*
  you get from the point you released rotate 2) find the difference
  (point1 vs point2 // point1 - point2) and accelerate(opposite) or (towards point 1)
  */
  translate(width/2 - (int)fighter.getX(), height/2 - (int)fighter.getY());
  pushMatrix();
  //translate(width/2 - (int)fighter.myCenterX, height/2 - (int)fighter.myCenterY);
  fighter.show();
  fighter.move();
  fighter.deceleratee();
  for(int nI = 0;nI < projectile.size(); nI ++){
    fill(255, 0, 0, 150);
    noStroke();
    projectile.get(nI).show();
    projectile.get(nI).move();
  }
  for(int t = 0; t < asteroids.size(); t ++){
    for(int j = 0; j < projectile.size(); j++){
      if(dist(projectile.get(j).getX(),projectile.get(j).getY(), projectile.get(t).getX(), projectile.get(t).getY()) < 10){
        projectile.remove(j);
        asteroids.remove(t);
        break;
      }
    }
  }
  //counter ++;
  if(shoot == true && frameCount % 10 == 0){ // counter
      //shoot = false;
      projectile.add(new Bullet(fighter));
  }
  
  popMatrix();
  fill(255);
  textAlign(CENTER);
  //if(accelerating == false && deceleratingDown == false){
  text("Nova: $" + nova, (int)fighter.getX() - 400 , (int)fighter.getY() - 250);
  //}
  float distFromBaseXz = (900- (float)fighter.getX())-(width/2);
  float distFromBaseYz = (725- (float)fighter.getY())-(height/2);
  textSize(15);
  int di = ((int)((dist(width/2, height/2, distFromBaseXz + width/2, distFromBaseYz + height/2))/10)*10);
  if(away == true){
    text("Distance from Base: " + di + "m", (int)fighter.getX() - 400 , (int)fighter.getY() - 230);
  }
  /*
  pushMatrix();
  translate(0,0);
    float distFromBaseXy = (900- (float)fighter.myCenterX)-(width/2);
  float distFromBaseYy = (725- (float)fighter.myCenterY)-(height/2);
  int diy = ((int)((dist(width/2, height/2, distFromBaseXz + width/2, distFromBaseYz + height/2))/10)*10);

  text("Distance from Base: " + diy + "m", 50, 50);
  popMatrix();
  */
  if(accelerating == true){// && maxSpdCtAcc <= 100){ // && leftTurn == false && rightTurn == false
    fighter.accelerate(0.5); //fighter.constantVel(5); //fighter.accelerate(0.1);
  }
  if(decelerating == true){// && maxSpdCtAcc >= -100){ // && leftTurn == false && rightTurn == false
    fighter.acceleratee(-0.2); //fighter.constantVel(-5); //fighter.accelerate(-0.1);
  }
  if(leftTurn == true){
    fighter.turn(-2);
  }
  if(rightTurn == true){
    fighter.turn(2);
  }
  //if(accelerateCount > 0 && releasedKey == true){
  //  accelerateCount = accelerateCount - 1;
  //  fighter.accelerate(-0.1);
  //}
  //////////println(accelerateCount);
  //fighter.myCenterX = lerp((int)fighter.myCenterX, (int)ex, 0.01);
}
public void mouseMoved(){
  movingMouse = true;
}
public void mousePressed(){
  clicked = true;
}
//public void mouseReleased(){
//  //clicked = false;
//}
public void keyPressed(){
  releasedKey = false;
  if(key == 'w'){accelerating = true;}
  if(key == 's'){decelerating = true;}
  if(key == 'a'){leftTurn = true;}
  if(key == 'd'){rightTurn = true;}
  if(keyCode == UP){shoot = true;}
}

public void keyReleased(){
  releasedKey = true;
  if(key == 'w'){accelerating = false;}
  if(key == 's'){decelerating = false;}
  if(key == 'a'){leftTurn = false;}
  if(key == 'd'){rightTurn = false;}
  if(keyCode == UP){shoot = false;}
}
