int MAX_VALUE = 100;
int MIN_VALUE = -100;
Visualizer v;

/*You are simulating a visualizer of multiple values
 You need to create a display method first. 
 Then you can make a method that changes the values each time the update is called. 
 */
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
    //draw the bars equally spaced inside this box. 
    //You can assume 10, but it would be even better 
    //if you could modify it to be larger increments.
    fill(255);
    rect(x, y, w, h);
    //This is a 200x400 box.
    //The width of the visualizer is 400! This rect is the border

    //the line is the 0 y-value, the top is 100, the bottom is -100
    line(x, y + h / 2, x + w, y + h / 2);
    int barLength = w / values.length;

    //You need to use a loop. You need to make the HEIGHT of the bars 
    //the values in the array.
    //Negative values are red, and go below the line.
    //Positive values are green and go above the line.

    //???WRITE THIS METHOD FIRST!!!
    //THESE ARE WRONG: They just illustrate how they could look
    for (int i = 0; i < values.length; i++) {
      /*if (values[i] >= 50) {
        fill(0, 255, 0);
      } else if (values[i] >= 0) {
        fill(255, 255, 0);
      } else if (values[i] >= -50) {
        fill(255, 128, 0);
      } else {
        fill(255, 0, 0);
      }*/
      if (values[i] >= 0) {
        fill(255 - values[i] * 255 / (h / 2), 255, 0);
      } else {
        fill(255, 255 + 255 * values[i] / (h / 2), 0);
      }
      rect(x + i * barLength, y + h / 2 - values[i], barLength, values[i]);
    }


    //Width of the visualizer is 400!
  }
  void update() {
    //???WRITE THIS METHOD SECOND!!!
    for (int i = 0; i < values.length; i++) {
      values[i] += speeds[i]; //the speed updates the values. Do not touch this.
      //??? keep them values between max/min value so they stay in the box.
      if (values[i] >= h / 2 || values[i] <= -1 * h / 2) {
        speeds[i] = -1 * speeds[i];
      }
      //??? reverse the speeds so the bar oscillates up/down when it reaches max/min
    }
  }
}

void setup() {
  size(600, 500);
  v = new Visualizer(20, 20, 20, 400, 300);
}
void draw() {
  background(255);
  v.display();
  v.update();
}
