class EnemyDropping{
PImage img; 
float xcor=0;
float ycor;
int NumLetter;//97 = a; 122 = z
PFont f;
char letter;
PImage explode;
int size = 30;

EnemyDropping(float n){
  xcor = n;
  img = loadImage("bomb2.png");
  //img = loadImage("ABomb.jpg");
  //img = loadImage("fireball.jpg");
  explode = loadImage("explosion.png");
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
  textAlign(CENTER);
  textFont(f,36); //the int changes the size
  fill(100); //changes the color
  text(letter,xcor,ycor); 
}
void DeadDisplay(){
  image(explode, xcor-size/4, ycor-size, size/2, size);
  if (size < 200){
    size++;
  }
}
}
