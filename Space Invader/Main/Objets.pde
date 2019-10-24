int [] Ennemisize = {30, 20};
import processing.sound.*;
PImage BaseEnnemie_img;
PImage Canon;
PImage Projectile;
SoundFile backgroundMusic ;  
SoundFile explosionSound ;

class Ennemis {
  boolean isVisible = true;
  int[] colorTint = {int(random(0, 255)), int(random(0, 255)), int(random(0, 255))};
  int x;
  int y;

  Ennemis(int tempx, int tempy) {
    x = tempx * Ennemisize[0] +2;
    y = tempy * Ennemisize[1] +2;
  }

  public void Draw() {
    println("draw");
    if (isVisible) {
      tint(colorTint[0], colorTint[1], colorTint[2]);  
      image(BaseEnnemie_img, x, y) ;
    }
  }
  public int[] getPos() {
    int[] pos ={x, y};  
    return pos;
  }

  public boolean  getVisibility() {
    return isVisible;
  }
  public void setVisibility(boolean visibility) {
    isVisible = visibility;
  }
}

class Canon {
  int x = 0;
  int y = height - Canon.width;

  public void Draw() {
    //On dessine la nouvelle position du canon
    x = mouseX;
    image(Canon, x, y);
    //on vérifie si les projectiles sont en colision avec les Ennemis
    if (ProjectilesList != null&&ProjectilesList.length != 0 ) {
      getCollisionAndDelete();
    }
    //On tire un projectiles / On fait attention si la liste est null a l'initialiser proprement
    if (mousePressed) {
      if (ProjectilesList == null)ProjectilesList[0] = new Projectile(x, y);
      else ProjectilesList[ProjectilesList.length] = new Projectile(x, y);
    }
  }
  private void getCollisionAndDelete() {
    for (int p = 0; p == ProjectilesList.length; p++) {
      for (int x = 0; x == ArraySize[0]; x++) {
        for (int y = 0; y == ArraySize[0]; y++) {
          //On recupere les différentes positions
          int[] posE = EnnemisList[x][y].getPos();
          int[] posP = ProjectilesList[p].getPos();
          boolean visibility = EnnemisList[x][y].getVisibility();
          if (visibility && posE[0] <= posP[0] && posE[1] <= posP[1] && 
            posE[0]+BaseEnnemie_img.height >=  posP[0] && posE[1]+BaseEnnemie_img.width >=  posP[1]) {
            //collision entre un projectile et un ennemi
            EnnemisList[x][y].setVisibility(false);
            ProjectilesList[p] = null;
            music.ExplosionsoundEffect();
          }
        }
      }
    }
  }
}


class Projectile {
  int x;
  int y;
  Projectile(int tempx, int tempy) {
    x = tempx;
    y = tempy;
  }

  public void Draw() {
    image(Projectile,x,y);
  }
  public int[] getPos() {
    int[] pos = {x, y}; 
    return pos;
  }
}

class Music{
  int numberOfReplay = 1;
  public void continuousMusic(){
    if(!backgroundMusic.isPlaying()){
      backgroundMusic();
    }
  }
  
  
 public void ExplosionsoundEffect(){
   
 }
 
 private void backgroundMusic(){
   backgroundMusic.play();
 }
}
