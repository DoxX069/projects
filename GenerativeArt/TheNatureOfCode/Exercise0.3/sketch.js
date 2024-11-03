let walker;

function setup() {
  createCanvas(windowWidth, windowHeight);
  walker = new Walker();
  background(0);
}

function draw() {
  walker.step();
  walker.show();
}

class Walker {
  constructor() {
    this.x = width / 2;
    this.y = height / 2;
  }
  show() {
    noStroke();
    fill(255, 100, 100, 255);
    circle(this.x, this.y, 2);
  }
  step() {
    let num = random(1);
    if (num < 0.6) {
      if (mouseX < this.x) {
        this.x -= 1;
      } 
      if (mouseX > this.x) {
        this.x += 1;
      }
      if (mouseY < this.y) {
        this.y -= 1;
      }
      if (mouseY > this.y) {
        this.y += 1;
      }
      else {
        this.x += 0;
        this.y += 0;
      }
    } 
    else if (num < 0.7) {
      this.x += 2;
    } else if (num < 0.8) {
      this.x -= 2;
    } else if (num < 0.9) {
      this.y += 2;
    } else {
      this.y -= 2;
    }
  }
}