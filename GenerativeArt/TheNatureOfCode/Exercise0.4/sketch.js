let slider;

function setup() {
  createCanvas(windowWidth, windowHeight);
  background(0);

  slider = createSlider(0, 1, 0.5, 0.1);
  slider.position(10, 10);
  slider.size(200, 20);
}

function draw() {
  let x = randomGaussian(windowWidth / 2, 100);
  let y = randomGaussian(windowHeight / 2, 100);
  let colorR = randomGaussian(150, 75);
  let colorG = randomGaussian(10, 5);
  let colorB = randomGaussian(100, 5);
  let colorA = randomGaussian(150, 25);

  fill(colorR, colorG, colorB, colorA);
  noStroke();
  strokeWeight(5);
  circle(x, y, 20);
}
