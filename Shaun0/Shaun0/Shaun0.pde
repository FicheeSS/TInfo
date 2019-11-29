// variables liées à l'animation de Shaun //<>//
PImage shaun;          // l'image de Shaun
float shaunX, shaunY;  // la position de Shaun
ArrayList<ArrayList<PImage>> ShaunImg = new ArrayList<ArrayList<PImage>>(2);
int shuanidR = 0;
int shuanidL = 0;
PImage Background;
boolean right = true;
int speed = 5;
int[] imageSize = {300,300};

////////////////////////////////////////////////////////
//
// Procédure d'initialisation
//
////////////////////////////////////////////////////////
void setup() {
  Background = loadImage("FermeShaun.jpg");
  size(1200, 1200);
  Background.resize(width, height);
  // la taille de la fenêtre
  background(Background);
  imageMode(CENTER);
  // la vitesse d'animation 
  frameRate(10);

  // chargement de l'image de Shaun 
  shaun = loadImage("ShaunR0.png");
  // initialisation de la position de l'oiseau
  shaunX = width / 2;
  shaunY = height - shaun.height - 20;
  ShaunImg.add(0,loadImages("ShaunL", 16));
  ShaunImg.add(1,loadImages("ShaunR", 16));
  frameRate(16);
}

////////////////////////////////////////////////////////
//
// Boucle d'animation
//
////////////////////////////////////////////////////////
void draw() {
  // repeint la fenêtre en blanc
  background(Background);

  // Affiche Shaun
  displayShaun();
  moveshaun();
}

////////////////////////////////////////////////////////
//
// Affiche Shaun
//
////////////////////////////////////////////////////////
void displayShaun() {

  if (right) {
    image(ShaunImg.get(1).get(shuanidR), shaunX, shaunY);
    if (shuanidR < 15) {
      shuanidR++;
    } else {
      shuanidR = 0 ;
    }
  } else {
    image(ShaunImg.get(0).get(shuanidL), shaunX, shaunY);
    if (shuanidL < 15) {
      shuanidL++;
    } else {
      shuanidL = 0 ;
    }
  }
}
ArrayList<PImage> loadImages(String shaun, int n) {
  ArrayList<PImage> output = new ArrayList<PImage>(n);
  if (shaun=="ShaunR") {
    for (int i = 0; i<n; i++) {
      PImage p = loadImage("ShaunR"+i+".png");
      p.resize(imageSize[0],imageSize[1]);
      output.add(i,p);
    }
  } else {
    for (int i = 0; i<n; i++) {
      PImage p = loadImage("ShaunL"+i+".png");
      p.resize(imageSize[0],imageSize[1]);
      output.add(i, p);
    }
  }
  return output ;
}

void moveshaun() {
  if (mouseX < shaunX) {
    right = false;
    shaunX -= speed;
  } else {
    right = true;
    shaunX+= speed;
  }
}
