drop D1 = new drop();
drop D2 = new drop();

void setup(){
  size(500,700);
}

void draw(){
  D1.update();
  D2.update();
}



class drop{
//PImage img;
float xcor = random(600)+50;
float ycor = 0;
String has = "A";
PImage img = loadImage("fireball.jpg"); 

//void setup() {
  //size(500, 700);
  //img = loadImage("fireball.jpg"); 
//}
void update(){
  //background(255);
  image(img, xcor, ycor, 30, 30); //x, y, fatness, tallness
  ycor = ycor + 1;
}
}

