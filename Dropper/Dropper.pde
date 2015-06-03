EnemyDropping[] Enemies = new EnemyDropping[10];
int frameRate = 0;
int score = 0;
boolean Lose = false;


void setup(){
  size(600,500);
  Enemies[0] = new EnemyDropping(random(1)*500);
}

void draw(){
  background(255);

  if (Lose){
    textSize(64);
    textAlign(CENTER);
    text("You Lose!", 300, 200); 
    fill(random(255));
    textSize(64);
  text(score, 300, 270); 
  fill(0, 102, 153);
  }  else {
  frameRate++;
  fillUp();
  textSize(32);
  text(score, 10, 30); 
  fill(0, 102, 153);
  for (int i=0; i<Enemies.length; i++){
    if (Enemies[i]!=null){
      Enemies[i].Move((float)1+score/15.0);
    }
  }
  for (int i=0; i<Enemies.length; i++){
    if (Enemies[i]!=null){
      Enemies[i].display();
    }
  }
    for (int i=0; i<Enemies.length; i++){
    if (Enemies[i]!=null){
      if (Enemies[i].ycor > 400){
        //Enemies[i] = null;
        Lose = true;
      }
    }
  }
  }
}

void fillUp(){ //selects whether or not a enemy will be added
  if (frameRate % 50 == 0){
    int i=11;
    for (int i2=0; i2<Enemies.length; i2++){
      if (Enemies[i2] == null){
        i=i2;}
    }
    if (i!=11){
      Enemies[i] = new EnemyDropping(random(1)*500);
    } else {
       frameRate -= 10;
    }
  }
}
  void keyPressed(){
    for (int i=0; i<Enemies.length;i++){
      if (Enemies[i]!=null){
        if (Enemies[i].NumLetter==key){
          Enemies[i] = null;
          score++;
        }  
      }
    }
  }
    


