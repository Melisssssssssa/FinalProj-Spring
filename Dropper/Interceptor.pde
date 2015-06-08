public class Interceptor{
  PImage missile;
  float xcor = 250;
  float ycor = 600;
  EnemyDropping target;
  
  public Interceptor(EnemyDropping Enemy){
    target = Enemy;
    missile = loadImage("missile.png");
  } 
  public boolean hit(){
    return (sqrt((xcor-target.xcor)*(xcor-target.xcor)+
    (ycor-target.ycor)*(ycor-target.ycor))<15);
  }
  void move(int n){
    float frac = (xcor-target.xcor)/(abs(ycor-target.ycor));
    if (frac>.7){
      n=n+1;}
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
 
}
