public class Reset{
  float X = 250;
  float Y = 350;
  
  public void Display(){
    //rect(xcor, ycor, width, height)
    rect(X,Y,100,50);
    textSize(32);
    textAlign(CENTER);
    text("Retry?", 300, 300); 
  }
  
}
