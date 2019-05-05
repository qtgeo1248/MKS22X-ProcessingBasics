int levels;
color bg, fg;

void setup() {
  size(800, 600);
  levels = 1;
}

void gasket(int levels, float v1x, float v1y, float v2x, float v2y, float v3x, float v3y) {
  fill(0, 0, 0);
  triangle(v1x, v1y, v2x, v2y, v3x, v3y);
  if (levels >= 1) {
    fill(255, 255, 255);
    triangle(v1x / 2 + v2x / 2, v1y / 2 + v2y / 2, 
             v2x / 2 + v3x / 2, v2y / 2 + v3y / 2,
             v3x / 2 + v1x / 2, v3y / 2 + v1y / 2);
    gasket(levels - 1, v1x, v1y,
           v1x / 2 + v2x / 2, v1y / 2 + v2y / 2,
           v1x / 2 + v3x / 2, v1y / 2 + v3y / 2);
    gasket(levels - 1, v2x, v2y,
           v2x / 2 + v3x / 2, v2y / 2 + v3y / 2,
           v2x / 2 + v1x / 2, v2y / 2 + v1y / 2);
    gasket(levels - 1, v3x, v3y,
           v3x / 2 + v1x / 2, v3y / 2 + v1y / 2,
           v3x / 2 + v2x / 2, v3y / 2 + v2y / 2);
  }
}

void koch(int levels, float x1, float y1, float x2, float y2) {
  fill(255, 255, 255);
  line(x1, y1, x2, y2);
}

void draw() { 
  background(50);  

  fill(255);
  text("Click the mouse to increase levels, press a key to decrease levels", 20, 20);

  //gasket(levels, 0, height-10, width, height-10, width/2, 10);

  koch(levels, width - 10, height / 2, 10, height / 2); 
}

void mouseClicked() { 
  levels++;
}

void keyPressed() {
  levels--;
}
