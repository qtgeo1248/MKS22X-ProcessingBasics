int MAX_VALUE = 100;
int MIN_VALUE = -100;
Visualizer v;

class Visualizer {
  float x, y;
  float[] values;
  float[] speeds;
  int w, h;
  Visualizer(float x, float y, int numElements, int w, int h) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    values = new float[numElements];
    speeds = new float[numElements];
    for (int i = 0; i < values.length; i++) {
      values[i] = random(-99, 99);
      speeds[i] = random(2);
    }
  }

  void display() {
    fill(255);
    rect(x, y, w, h);
    line(x, y + h / 2, x + w, y + h / 2);
    int barLength = w / values.length;
    for (int i = 0; i < values.length; i++) {
      if (values[i] >= 0) {
        fill(255 - values[i] * 255 / (h / 2), 255, 0);
      } else {
        fill(255, 255 + 255 * values[i] / (h / 2), 0);
      }
      rect(x + i * barLength, y + h / 2 - values[i], barLength, values[i]);
    }
  }
  void update() {
    for (int i = 0; i < values.length; i++) {
      values[i] += speeds[i];
      if (values[i] >= h / 2 || values[i] <= -1 * h / 2) {
        speeds[i] = -1 * speeds[i];
      }
    }
  }
}

void setup() {
  size(600, 500);
  v = new Visualizer(20, 20, 20, 400, 200);
}
void draw() {
  background(255);
  v.display();
  v.update();
}
