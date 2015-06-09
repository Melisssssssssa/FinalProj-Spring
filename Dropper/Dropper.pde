EnemyDropping[] Enemies = new EnemyDropping[10];
Interceptor[] Interceptors = new Interceptor[10];
int frameRate = 0;
int score = 0;
boolean Lose = false;
PImage ground;
EnemyDropping Killer = null;
boolean pause = false;

void setup(){
  size(600,700);
  Enemies[0] = new EnemyDropping(random(1)*500);
  ground = loadImage("Ground.png");
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
    fill(0);
    textSize(64);
    textAlign(CENTER);
    text("You Lose!", 300, 250); 
    fill(52);
    textSize(64);
    text(score, 300, 320); 
    Killer.DeadDisplay();
    reset();
  }  else { //playing 
    
    frameRate++;
    fillUp();
    textSize(32);
    textAlign(LEFT);
    fill(0, 102, 153);
    text(score, 10, 30); 
    for (int i=0; i<Enemies.length; i++){
      if (Enemies[i]!=null){
        Enemies[i].Move((float)1+score/15.0);
        Enemies[i].display();
      }
    }
    for (int i=0; i<Interceptors.length; i++){
      if (Interceptors[i]!=null){
        Interceptors[i].move(2+score/10);
        Interceptors[i].display();
        if (Interceptors[i].hit()){
          Enemies[i] = null;
          Interceptors[i]=null;
          score++;
        } else {
          if (Interceptors[i].Out()){
            Interceptors[i].cheat();
            Enemies[i] = null;
            Interceptors[i] = null;
            score++;
          }
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
            Interceptors[i2] = null;
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
        if (Enemies[i].letter==key){
          //Enemies[i] = null;
          //score++;
          if (Interceptors[i]==null){
            Interceptors[i] = new Interceptor(Enemies[i]);
          }
        }  
      }
    }
    if (key=='P'){
      pause = !pause;
    }
  }
  
  void reset(){
    fill(255);
    rect(250,350,100,50);
    fill(0);
    textSize(32);
    textAlign(CENTER);
    text("Retry?", 300, 385); 
  }
  
  void mousePressed(){
    if (Lose){
      if (mouseX-250<100 && mouseY-350<50){
        Lose = false;
        score = 0;
        frameRate = 0;
        EnemyDropping Killer = null;
      }
    }
  }
  
  void HighScore(){
    String[] lines = loadStrings("file.txt");
    
        


