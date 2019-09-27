int sizeX = 400;
int sizeY = 600;
color couleurPricipal = #797873 ;

void setup(){
  size(500,700);
  corp();
  visage();
  
}


private void visage(){
  int centerY = sizeX/2 - 35 ;
  int centerX = sizeX/2 + 50;
  noStroke();  
  fill(couleurPricipal);
  //cheveux
  circle(centerX , centerY - 55 , sizeX/2 +12 );
  //tete
  fill(#F5F3EB);
  circle(centerX ,centerY - 50 , sizeX/2);
  fill(couleurPricipal);
  //meche
  arc(centerX,  centerY - 145, 60, 15, radians(0), radians(360));
  fill(#EAA713);
  //nez
  ellipse(centerX, centerY - 40, 25, 20);
  fill(0);
  //yeux
  ellipse(centerX - 50 ,centerY - 70, 15, 20);
  ellipse(centerX + 50 ,centerY - 70, 15, 20);
  //bouche
  arc(centerX,  centerY, 60, 15, radians(0), radians(180));
  //sourcils
  arc(centerX - 70 ,centerY - 90, 60 , 8, radians(270), radians(360));
  arc(centerX + 40 ,centerY - 90, 60, 8, radians(270), radians(360));

}

private void corp(){
  //salopette
  //smooth();
  noStroke();
  fill(#E81A40);
  rect(sizeX/4, sizeX/2 - 35 + 100, 200  ,sizeY/2  - 50) ; 
  rect(sizeX/4, sizeX/2 - 35 +300, 80 ,sizeY/4) ; 
  rect(sizeX/2 + 20 , sizeX/2 - 35 +300, 80 ,sizeY/4) ;


}
