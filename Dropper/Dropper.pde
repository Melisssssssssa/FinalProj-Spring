EnemyDropping[] Enemies = new EnemyDropping[10];
Interceptor[] Interceptors = new Interceptor[10];
int frameRate = 0;
int score = 0;
boolean Lose = false;
PImage ground;
EnemyDropping Killer = null;
boolean pause = false;
Reset RButton;

void setup(){
  size(600,700);
  Enemies[0] = new EnemyDropping(random(1)*500);
  ground = loadImage("Ground.png");
  RButton = new Reset();
}

void draw(){
  if (pause){
    textSize(64);
    textAlign(CENTER);
    text("Pause", 300, 300); 
  } else {
    background(255);
    image(ground, 0, 600, 600, 98);
  if (Lose){ //losing scene
    textSize(64);
    textAlign(CENTER);
    text("You Lose!", 300, 300); 
    fill(52);
    textSize(64);
    text(score, 300, 370); 
    Killer.DeadDisplay();
    RButton.Display();
    
  }  else { //playing 
    
    frameRate++;
    fillUp();
    textSize(32);
    textAlign(LEFT);
    text(score, 10, 30); 
    fill(0, 102, 153);
    for (int i=0; i<Enemies.length; i++){
      if (Enemies[i]!=null){
        Enemies[i].Move((float)10+score/15.0);
        Enemies[i].display();
      }
    }
    for (int i=0; i<Interceptors.length; i++){
      if (Interceptors[i]!=null){
        Interceptors[i].move(1);
        Interceptors[i].display();
        if (Interceptors[i].hit()){
          Enemies[i] = null;
          Interceptors[i]=null;
          score++;
        }
      }
    }
    for (int i=0; i<Enemies.length; i++){
      if (Enemies[i]!=null){
        if (Enemies[i].ycor > 600){//400
          //Enemies[i] = null;
          Lose = true;
          Killer = Enemies[i];
          for (int i2=0; i2<Enemies.length; i2++){
            Enemies[i2] = null;
          }
        }
      }
    }//for 
  }//last else; after the if lose
  }//no pause
}

void fillUp(){ //selects whether or not a enemy will be added
  if (frameRate % 100 == 0){
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
          //Enemies[i] = null;
          //score++;
          if (Interceptors[i]==null){
            Interceptors[i] = new Interceptor(Enemies[i]);
          }
        }  
      }
    }
    if (key==80){
      pause = !pause;
    }
  }
    


