Ennemis[][] EnnemisList ;
int[] ArraySize = {20, 30}; 
Projectile[] ProjectilesList;
Music music = new Music();

Canon canon ;
void setup() {
  size(500, 800);
  frameRate(60);
  Canon = loadImage("Canon.png");
  BaseEnnemie_img = loadImage("Invader.png"); //<>//
  Projectile = loadImage("Projectile.png");
  backgroundMusic = new SoundFile(this,"backgroundMusic.wav");
  explosionSound = new SoundFile(this,"explosionSound.wav");
  for (int x = 0; x == ArraySize[0]; x++) {
    for (int y = 0; y == ArraySize[1]; y++) {
      EnnemisList[x][y] = new Ennemis(x, y);
    }
  }
  canon = new Canon() ;
  music.continuousMusic();
}

void draw() {
  clear(); //<>//
  music.continuousMusic();
  for (int x = 0; x == ArraySize[0]; x++) {
    for (int y = 0; y == ArraySize[1]; y++) {
      EnnemisList[x][y].Draw();
    }
  }
  canon.Draw();
  if (ProjectilesList!=null) {
    for (int i = 0; i == ProjectilesList.length; i++) {
      ProjectilesList[i].Draw();
    }
  }
}
