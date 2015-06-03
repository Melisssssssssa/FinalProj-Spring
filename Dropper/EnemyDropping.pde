class EnemyDropping{
PImage img; 
float xcor=0;
float ycor;
int NumLetter;//97 = a; 122 = z
PFont f;
char letter;

EnemyDropping(float n){
  xcor = n;
  img = loadImage("fireball.jpg");
  NumLetter = (int)random(26)+97;
  String Alpha = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
  letter = Alpha.charAt(NumLetter-97);
}

void Move(float n){
  ycor = ycor + n;
}

void display(){
  image(img, xcor, ycor, 30, 30); //x, y, width, height
  
  f = createFont("Arial",16,true); // Arial, 16 point, anti-aliasing on
  textFont(f,36); //the int changes the size
  fill(100); //changes the color
  text(letter,xcor,ycor+50); 
  
}
}
