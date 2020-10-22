PImage down_img, up_img;
Mostrador mostrador;
Caixa caixa;
float xmag, ymag = 0;
float newXmag, newYmag = 0;
int zoom = 0;
int mX, mY;

void setup() {
  size(800, 700, P3D);
  cursor(HAND);

  up_img = loadImage("up.png");
  down_img = loadImage("down.png");

  int dim = 8 ;

  mostrador = new Mostrador(-10);
  caixa = new Caixa();
  
  mX = (width / 2) + dim;
  mY = (height / 2);

  smooth(8);

}

void draw() {
  background(101);
  camera();

  //x, y, tamanho_x, tamanho_y

    image(down_img, -135,185,275,150);
    image(up_img, -135,-330,275,150);

  pushMatrix();
    translate (0,0,50);
    mostrador.show();
    caixa.show();
  popMatrix();

  pushMatrix();
    stroke(#000000);
    sphere(10);
  popMatrix();

  pointLight(51, 102, 126, 35, 40, 36);

}


void mouseWheel(MouseEvent event) {
  float e = event.getCount();
  zoom += e*10;
}

/**
Rotacao da Camera
*/
void camera(){
  translate(mX, mY, zoom);
  rotateX(-ymag);
  rotateY(-xmag);
}
