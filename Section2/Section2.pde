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

void koch(int levels, float x1, float y1, float x2, float y2) { //x1 and y1 is on the left
  fill(255, 255, 255);
  line(x1, y1, x2, y2);
  if (levels >= 1) {
    float leftX1 = 2 * x1 / 3 + x2 / 3;
    float leftY1 = 2 * y1 / 3 + y2 / 3;
    float rightX2 = x1 / 3 + 2 * x2 / 3;
    float rightY2 = y1 / 3 + 2 * y2 / 3;
    float middleX = (rightX2 - leftX1) / 2 + (rightY2 - leftY1) * sqrt(3) / 2 + leftX1;
    float middleY = (rightY2 - leftY1) / 2 - (rightX2 - leftX1) * sqrt(3) / 2 + leftY1;
    triangle(leftX1, leftY1, rightX2, rightY2, middleX, middleY);
  }
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
