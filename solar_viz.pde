// Processing sketch for artistic solar radiation visualization
// Open this file in Processing IDE (https://processing.org/)

float[] G0 = {575.23, 687.15, 814.34, 934.69, 1002.40, 1026.65,
              1014.34, 959.27, 852.72, 713.18, 595.15, 541.45};
              
float[] h = {8.29, 8.47, 8.11, 6.95, 6.44, 4.23,
             3.94, 5.13, 5.28, 7.80, 8.73, 8.36};
             
float[] N = {9.82, 10.43, 11.13, 11.88, 12.46, 12.73,
             12.58, 12.07, 11.35, 10.60, 9.93, 9.62};
             
float[] W = {10.96, 11.30, 14.20, 17.33, 19.47, 22.08,
             22.48, 22.70, 22.10, 19.95, 15.60, 12.39};
             
float[] R = {70.67, 69.10, 66.10, 75.11, 81.70, 86.70,
             87.50, 85.50, 86.22, 82.30, 75.30, 73.90};

float[] G, D, B;
String[] months = {"Jan", "Feb", "Mar", "Apr", "May", "Jun",
                   "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"};

float animProgress = 0;
int currentView = 0;
float transitionTime = 0;

void setup() {
  size(1200, 800);
  smooth();
  
  // Calculate derived values
  G = new float[12];
  D = new float[12];
  B = new float[12];
  
  for (int i = 0; i < 12; i++) {
    G[i] = G0[i] * (0.394 + (0.364 * (h[i] / (N[i] * N[i])) * 0.0035 * W[i]));
    D[i] = G0[i] * (0.306 - (0.165 * (h[i] / (N[i] * N[i]))) + 0.0025 * W[i]);
    B[i] = G[i] - D[i];
  }
}

void draw() {
  background(20, 24, 35);
  
  animProgress += 0.01;
  if (animProgress > 1.0) animProgress = 1.0;
  
  // Title
  fill(255);
  textAlign(CENTER);
  textSize(32);
  text("☀️ Solar Radiation - Artistic Visualization", width/2, 50);
  
  textSize(16);
  fill(150, 200, 255);
  text("Press SPACE to switch views | Click to reset animation", width/2, 80);
  
  // Draw current view
  if (currentView == 0) {
    drawCircularView();
  } else if (currentView == 1) {
    drawWaveView();
  } else if (currentView == 2) {
    drawParticleView();
  } else {
    drawSpiralView();
  }
  
  // Legend
  drawLegend();
}

void drawCircularView() {
  pushMatrix();
  translate(width/2, height/2 + 50);
  
  float maxRadius = min(width, height) * 0.35;
  
  // Draw month labels and radiation circles
  for (int i = 0; i < 12; i++) {
    if (i > animProgress * 12) continue;
    
    float angle = TWO_PI * i / 12 - HALF_PI;
    float x = cos(angle) * (maxRadius + 80);
    float y = sin(angle) * (maxRadius + 80);
    
    // Month label
    fill(255);
    textAlign(CENTER, CENTER);
    textSize(14);
    text(months[i], x, y);
    
    // Radiation circle
    float radius = map(G[i], 0, max(G), 10, 80);
    
    // Glow effect
    for (int j = 3; j > 0; j--) {
      fill(231, 76, 60, 20);
      ellipse(x, y, radius * 2 + j*10, radius * 2 + j*10);
    }
    
    // Main circle
    fill(231, 76, 60, 200);
    ellipse(x, y, radius * 2, radius * 2);
    
    // Value text
    fill(255);
    textSize(10);
    text(nf(G[i], 0, 1), x, y + radius + 15);
  }
  
  // Center info
  fill(255, 200);
  textSize(20);
  text("Total Solar\nRadiation (G)", 0, 0);
  
  popMatrix();
}

void drawWaveView() {
  pushMatrix();
  translate(100, height/2);
  
  float waveWidth = width - 200;
  float waveHeight = 150;
  
  // Draw three waves for G, D, B
  drawWave(G, color(231, 76, 60), -waveHeight, waveWidth);
  drawWave(D, color(39, 174, 96), 0, waveWidth);
  drawWave(B, color(52, 152, 219), waveHeight, waveWidth);
  
  // Month labels
  for (int i = 0; i < 12; i++) {
    float x = map(i, 0, 11, 0, waveWidth);
    stroke(100);
    line(x, -waveHeight*2, x, waveHeight*2);
    
    fill(255);
    noStroke();
    textAlign(CENTER);
    textSize(12);
    text(months[i], x, waveHeight*2 + 20);
  }
  
  popMatrix();
}

void drawWave(float[] data, color col, float yOffset, float waveWidth) {
  noFill();
  stroke(col);
  strokeWeight(3);
  
  beginShape();
  for (int i = 0; i < 12; i++) {
    if (i > animProgress * 12) break;
    
    float x = map(i, 0, 11, 0, waveWidth);
    float y = map(data[i], 0, max(G), 50, -50) + yOffset;
    
    curveVertex(x, y);
    if (i == 0 || i == 11) curveVertex(x, y); // Duplicate endpoints for curve
  }
  endShape();
  
  // Draw points
  fill(col);
  noStroke();
  for (int i = 0; i < 12 && i <= animProgress * 12; i++) {
    float x = map(i, 0, 11, 0, waveWidth);
    float y = map(data[i], 0, max(G), 50, -50) + yOffset;
    ellipse(x, y, 8, 8);
  }
}

void drawParticleView() {
  pushMatrix();
  translate(width/2, height/2 + 50);
  
  for (int month = 0; month < 12; month++) {
    if (month > animProgress * 12) continue;
    
    float angle = TWO_PI * month / 12 - HALF_PI;
    int particleCount = int(G[month] / 5);
    
    for (int p = 0; p < particleCount; p++) {
      float radius = random(50, 250);
      float particleAngle = angle + random(-0.2, 0.2);
      
      float x = cos(particleAngle) * radius;
      float y = sin(particleAngle) * radius;
      
      float hue = map(G[month], min(G), max(G), 180, 0);
      colorMode(HSB, 360, 100, 100);
      fill(hue, 80, 90, 150);
      noStroke();
      ellipse(x, y, 4, 4);
      colorMode(RGB, 255);
    }
  }
  
  popMatrix();
}

void drawSpiralView() {
  pushMatrix();
  translate(width/2, height/2 + 50);
  
  float maxRadius = 300;
  
  for (int i = 0; i < 12; i++) {
    if (i > animProgress * 12) continue;
    
    float t = float(i) / 11;
    float angle = TWO_PI * 3 * t;
    float radius = maxRadius * t;
    
    float x = cos(angle) * radius;
    float y = sin(angle) * radius;
    
    // Line to previous point
    if (i > 0) {
      float prevT = float(i-1) / 11;
      float prevAngle = TWO_PI * 3 * prevT;
      float prevRadius = maxRadius * prevT;
      float prevX = cos(prevAngle) * prevRadius;
      float prevY = sin(prevAngle) * prevRadius;
      
      stroke(100, 150, 255, 100);
      strokeWeight(2);
      line(prevX, prevY, x, y);
    }
    
    // Data point
    float size = map(G[i], min(G), max(G), 20, 60);
    
    // Glow
    for (int j = 3; j > 0; j--) {
      fill(231, 76, 60, 30);
      noStroke();
      ellipse(x, y, size + j*8, size + j*8);
    }
    
    fill(231, 76, 60);
    ellipse(x, y, size, size);
    
    // Month label
    fill(255);
    textAlign(CENTER, CENTER);
    textSize(12);
    text(months[i], x, y);
  }
  
  popMatrix();
}

void drawLegend() {
  int yPos = height - 100;
  
  String[] viewNames = {"Circular", "Wave", "Particle", "Spiral"};
  
  fill(40, 50, 70, 200);
  rect(20, yPos - 30, 300, 80, 10);
  
  fill(255);
  textAlign(LEFT);
  textSize(14);
  text("Current View: " + viewNames[currentView], 40, yPos - 5);
  
  // Color legend
  fill(231, 76, 60);
  rect(40, yPos + 15, 20, 10);
  fill(255);
  text("G: Total", 70, yPos + 22);
  
  fill(39, 174, 96);
  rect(150, yPos + 15, 20, 10);
  fill(255);
  text("D: Diffuse", 180, yPos + 22);
  
  fill(52, 152, 219);
  rect(40, yPos + 35, 20, 10);
  fill(255);
  text("B: Direct", 70, yPos + 42);
}

void keyPressed() {
  if (key == ' ') {
    currentView = (currentView + 1) % 4;
    animProgress = 0;
  }
}

void mousePressed() {
  animProgress = 0;
}

