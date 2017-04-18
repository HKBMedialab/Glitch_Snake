class SnakeBit {

  PVector position=new PVector(0, 0, 0);
  float rW=40;
  float rH=40;
  color myColor=color(255, 255, 255);
  color resetColor=color(255, 0, 255);
  float angle=0;
  PImage image = new PImage(); // Liste der Bilder aus Folder
  boolean bHasImage=false;
  boolean removeMe=false;

  int birthdate;

  SnakeBit() {
    birthdate=millis();
  }


  void update() {
    myColor=resetColor;
    bHasImage=false;

    // timer
    int now=millis();
    if (now-birthdate>AGE) {
      removeMe=true;
    }
  }


  void render() {
    fill(myColor);
    pushMatrix();
    translate(position.x, position.y);
    rotate(angle);
    if (bHasImage) {
      image(image, 0, 0, rW, rH);
    } else {
      rect(0, 0, rW, rH);
    }
    popMatrix();
  }

  void setPosition(PVector p) {
    position.set(p);
  }

  PVector getPosition() {
    return position;
  }

  PImage getImage() {
    return image;
  }

  boolean hasImage() {
    return bHasImage;
  }

  void setImage(PImage img) {
    image=img;
    bHasImage=true;
  }

  void setColor(color c) {
    myColor=c;
  }

  color getColor() {
    return myColor;
  }

  void setSize(int w, int h) {
    rW=w;
    rH=h;
  }
}