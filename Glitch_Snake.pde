
/*================================


Glitch Snake
HKB Medialab 2017;
================================*/

// Snake
int snakeLenght=1200;
ArrayList<SnakeBit> snake = new ArrayList<SnakeBit>();

// animations
ArrayList<Animation> animations = new ArrayList<Animation>();

// images
PImage [] images = new PImage[40]; // Liste der Bilder aus Folder

// maxage of Snakebit in milliseconds. deconstruction routine
final int AGE = 60000; 


void settings(){
  size(1400, 500,P2D);
    smooth(8);
}

void setup() {
  frameRate(30);
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


  colorMode(HSB);
  background(0);
}





void draw() {
  background(0);

  // update Snake
  for (int i=0; i<snake.size(); i++) {
    SnakeBit sn=snake.get(i);
    sn.update();
    // check if we have to remove old bits
    if(sn.removeMe)snake.remove(i);
  }

  for (int i=0; i<animations.size(); i++) {
    Animation a=animations.get(i);
    a.update();
     // check if we have to remove the animation
    if (a.counter-a.animationlength>snake.size())animations.remove(i);
  }

// render the snake
  for (int i=0; i<snake.size(); i++) {
    SnakeBit sn=snake.get(i);
    sn.render();
  }
}



void keyPressed() {
  switch(key) {
  case 'a':
    animations.add(new Animation(false));
    break;
  case 'g':
    animations.add(new Animation(true));
    break;
  }
}


void mouseMoved() {
  SnakeBit sn=new SnakeBit();
  sn.setPosition(new PVector(mouseX, mouseY));
  snake.add(sn);
}