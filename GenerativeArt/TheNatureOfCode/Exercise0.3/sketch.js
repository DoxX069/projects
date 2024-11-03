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

    this.t = 0;
  }
  show() {
    let xoff = 0.0;
    let yoff = 0.0;

    let colorR = randomGaussian(150, 75);2
    let colorB = randomGaussian(10, 5);
    let colorG = randomGaussian(100, 5);

    strokeWeight(3);
    stroke(colorR, colorB, colorG, 50);
    noFill();
    circle(this.x, this.y, 10);

    xoff += 0.01;
    yoff += 0.01;
  }
  step() {
    let num = random(1); 
    let step = noise(this.t) * 30;

    if (num < 0.25) {
      if (this.x > width) {
         this.x += 0;
      }
      else {
        this.x += step;
      }
    }
    else if (num < 0.5) {
      if (this.x < 0) {
        this.x += 0;
      }
      else {
        this.x -= step;
      }
    }
    else if (num < 0.75) {
      if (this.y > height) {
        this.y += 0;
     }
     else {
       this.y += step;
     }
    } 
    else {
      if (this.y < 0) {
        this.y += 0;
     }
     else {
       this.y -= step;
     }
    }
    this.t += 0.02;
  }
}