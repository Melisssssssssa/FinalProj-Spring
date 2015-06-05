public class Interceptor{
  float xcor = 500;
  float ycor = 250;
  EnemyDropping target;
  
  public Interceptor(EnemyDropping Enemy){
    target = Enemy;
  } 
  public boolean hit(){
    return (sqrt((xcor-target.xcor)*(xcor-target.xcor)+
    (xcor-target.xcor)*(xcor-target.xcor))<5);
  }
  void move(int n){
    float frac = (xcor-target.xcor)/(ycor-target.ycor);
    xcor += n*frac;
    ycor += n*(1/frac);
  }
 
}
