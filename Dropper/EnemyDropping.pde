class EnemyDropping{
  PImage img; 
  float xcor=0;
  float ycor;
  int NumLetter;//97 = a; 122 = z
  PFont f;
  char[] letters;
  char letter;
  char BigLetter;
  PImage explode;
  int size = 30;

EnemyDropping(float n, int size){
  xcor = n;
  letters = new char[size];
  img = loadImage("bomb2.png");
  //img = loadImage("ABomb.jpg");
  //img = loadImage("fireball.jpg");
  explode = loadImage("explosion.png");
  NumLetter = (int)random(26);
  String Big = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
  String Small = "abcdefghijklmnopqrstuvwxyz";
  BigLetter = Big.charAt(NumLetter);
  letter = Small.charAt(NumLetter);
}

void Move(float n){
  ycor = ycor + n;
}
void fillup(){
  for (int i=; i<letters.length;i++){
    letters[i]+= Small.charAt(random(26));
  }
void kill(char n){
  for (int i=0; i< letters.length; i++){
    if (letters[i] == n){
      letters[i] = '\u0000';
    }
  }
}
boolean empty(){
  for (int i=0; i< letters.length; i++){
    if (letters[i]!='\u0000'){
      return false;
    }
  }
  return true;
}

void display(){
  image(img, xcor, ycor, 30, 30); //x, y, width, height
  
  f = createFont("Arial",16,true); // Arial, 16 point, anti-aliasing on
  textAlign(CENTER);
  textFont(f,36); //the int changes the size
  fill(100); //changes the color
  String s;
  for (int i=0; i<letters.length; i++){
    if (letters[i]!='\u0000'){
      s+=letters[i];
    }
  }
  text(BigLetter,xcor+10,ycor); 
}
void DeadDisplay(){
  image(explode, xcor-size/4, ycor-size, size/2, size);
  if (size < 200){
    size++;
  }
}
}
