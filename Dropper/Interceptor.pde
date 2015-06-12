public class Interceptor{
  PImage missile;
  float xcor = 250;
  float ycor = 600;
  EnemyDropping target;
  char missileChar;
  
  public Interceptor(EnemyDropping Enemy, char c){
    target = Enemy;
    missileChar = c;
    missile = loadImage("missile.png");
  }
  public boolean hit(){
    return (sqrt((xcor-target.xcor)*(xcor-target.xcor)+
    (ycor-target.ycor)*(ycor-target.ycor))<20);
  }
  void move(int n){
    float frac = (xcor-target.xcor)/(abs(ycor-target.ycor));
    
    if (frac>10){
      frac = 10;
    }
    xcor -= n*frac;
    
    if (target.ycor > ycor){
      ycor += n*abs((1/frac));
    } else {
      ycor -= n*abs((1/frac));
    }
  }
  
  void display(){
    image(missile, xcor, ycor, 10, 30);
  }
  
  boolean Out(){
    return (xcor < 100 || xcor > 550 || ycor < 10 || ycor > 600);
  }
  void cheat(){
    xcor = target.xcor + 3;
    ycor = target.ycor + 2;
  }
}
