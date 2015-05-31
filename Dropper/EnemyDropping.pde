class EnemyDropping{
PImage img; 
float xcor=0;
float ycor;

EnemyDropping(float n){
  xcor = n;
  img = loadImage("fireball.jpg");
}

void Move(float n){
  ycor = ycor + n;
}

void display(){
  image(img, xcor, ycor, 30, 30); //x, y, width, height
}
}
