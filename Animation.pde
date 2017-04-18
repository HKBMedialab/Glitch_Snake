class Animation {

  int counter=0;
  PVector pos=new PVector();
  color mycolor=color(random(255), random(255), random(150, 255));
  int animationlength=int(random(100));
  PImage image = new PImage(); 

  boolean hasImage;

  Animation(boolean _b) {
    hasImage=_b;
    if (hasImage) {
      int r=int(random(images.length));
      image=images[r];
    }
  }


  void update() {
    counter+=1;
    for (int i=0; i<animationlength; i++) {
      int arrayposition=counter-i;
      if (arrayposition>=0 && arrayposition<snake.size()) {
        SnakeBit sn=snake.get(arrayposition);
        if (hasImage) {
          sn.setImage(image);
        } else {
          sn.setColor(mycolor);
        }
      }
    }
  }
}