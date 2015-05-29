PImage fireball;// = loadImage("fireball.jpg"); 
float xcor = random(550)+50;
float ycor = 0;
String has = "A";
//PImage fireball;

void setuph() {
  fireball = loadImage("fireball.jpg"); 
}

void draw(){
  image(fireball, xcor, ycor, 30, 30); //x, y, fatness, tallness
  ycor = ycor + 1;
}
