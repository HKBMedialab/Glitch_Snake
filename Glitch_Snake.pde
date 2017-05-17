
/*================================


Glitch Snake
HKB Medialab 2017;
================================*/

int snakeLenght=1200;
ArrayList<Animation> animations = new ArrayList<Animation>();
ArrayList<SnakeBit> snake = new ArrayList<SnakeBit>();
PImage [] images = new PImage[40]; // Liste der Bilder aus Folder

// Tablet
import codeanticode.tablet.*;
Tablet tablet;

void setup() {
  size(1920, 1080);
  tablet= new Tablet(this);
  int n;

  // Load all Images
  for (int i = 0; i < 40; i ++) {
    if (i <= 8) {
      n=i+1;
      String x = "picts/00"+n+".png";
      println (i+" = "+x);
      images[i]=loadImage(x);
    } else if (i >= 9) {
      n=i+1;
      String x = "picts/0"+n+".png";
      println (i+" = "+x);
      images[i]=loadImage(x);
    }
  }



  /*
  buffer=createGraphics(1400, 500);
   buffer.beginDraw();
   background(0, 255, 0);
   buffer.endDraw();*/

  smooth();
  colorMode(HSB);
  background(0);
}





void draw() {
  background(0);


  // update Snake
  for (int i=0; i<snake.size(); i++) {
    SnakeBit sn=snake.get(i);
    sn.update();
  }



  for (int i=0; i<animations.size(); i++) {
    Animation a=animations.get(i);
    a.update();
    if (a.counter-a.animationlength>snake.size())animations.remove(i);
  }

  for (int i=0; i<snake.size(); i++) {
    SnakeBit sn=snake.get(i);
    sn.render();
  }
  
  textSize(20);
text(str(frameRate), 10, 30); 
}



void keyPressed() {
  /* buffer.beginDraw();
   buffer.fill(255, 0, 0);
   buffer.endDraw();*/

  switch(key) {
  case 'a':
    animations.add(new Animation(false));
    break;

  case 'g':
    animations.add(new Animation(true));
    break;
  }
}


void penLevelEvent(Tablet t){
}


void mouseDragged() {
  SnakeBit sn=new SnakeBit();
  sn.setPosition(new PVector(mouseX, mouseY));
  snake.add(sn);
  if (snake.size()>snakeLenght) {
    snake.remove(0);
  }
}