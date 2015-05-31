//EnemyDropping ED1;
//EnemyDropping ED2;
EnemyDropping[] Enemies = new EnemyDropping[5];
int frameRate = 0;

void setup(){
  size(600,500);
  Enemies[0] = new EnemyDropping(random(1)*500);
  //ED1 = new EnemyDropping(random(1)*500);
  //ED2 = new EnemyDropping(random(1)*500);
}

void draw(){
  background(255);
  frameRate++;
  fillUp();
  for (int i=0; i<Enemies.length; i++){
    if (Enemies[i]!=null){
      Enemies[i].Move((float)1);
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
        Enemies[i] = null;
      }
    }
  }
  //ED1.Move((float)1);
  //ED1.display();
  //ED2.Move((float)1);
  //ED2.display();
}

void fillUp(){ //selects whether or not a enemy will be added
  if (frameRate % 50 == 0){
    int i=6;
    for (int i2=0; i2<Enemies.length; i2++){
      if (Enemies[i2] == null){
        i=i2;}
    }
    if (i!=6){
      Enemies[i] = new EnemyDropping(random(1)*500);
    } else {
       frameRate -= 10;
    }
  }
}

