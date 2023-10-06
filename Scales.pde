//Global Variables
int x = 500;
int y = 500;
int off = 1;
int rows, cols;
int mult = 100;
float wid = 80;
float hgt = 80;
float r, g, b, a;
float inc = 0.01;
boolean grow = true;
int max = 100;
int min = 50;
void setup() {
  size(1000, 500);  //feel free to change the size
  strokeWeight(5);
  rows = height/10;
  cols = width/10;
  g = ((int)(Math.random()*256));
  b = ((int)(Math.random()*256));
  //a = (int)Math.random()*256;
  r = (int)(Math.random()*256);
  a=255;
}
void draw() {
  background(255);
  for (int x = 0; x < cols; x++) {
    for (int y = 0; y < rows; y++) {
      fill(r, g, b, a);
      //ellipse(x, y, 50, 50);
      scale(x*mult+off, y*mult+off);
    }
    breathe();
  }
  if (wid >= max||wid <= min) {
    grow = !grow;
  }
}
void scale(int x, int y) {

  ellipse(x, y, wid, hgt);
  triangle(x, y-80, x+40, y, x-40, y);
  fill(r, g, b, a);
}

void breathe() {
  if (grow) {
    wid += inc;
    hgt += inc;
    a -= 255/(max-min)*inc;
  } else {
    wid -= inc;
    hgt -= inc;
    a += 255/(max-min)*inc;
  }
  if (wid <= min) {
    r = ((int)(Math.random()*256));
    b = ((int)(Math.random()*256));
    g = ((int)(Math.random()*256));
  }
}
