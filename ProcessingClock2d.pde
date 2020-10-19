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

  mostrador = new Mostrador(0);
  caixa = new Caixa();
  mX = (width / 2) + dim;
  mY = (height / 2);

  smooth(8);

}

void draw() {
  background(101);
  camera();
  
  caixa.show();
  mostrador.show();
  //x, y, tamanho_x, tamanho_y
  image(down_img, -135,187,275,150);
  image(up_img, -135,187,275,150);
  
  pushMatrix();
  fill(#000000);
  sphere(20);
  popMatrix();

}

void mouseDragged() {

  if (mouseButton == LEFT) {
    newXmag = mouseX/float(width) * TWO_PI;
    newYmag = mouseY/float(height) * TWO_PI;

    float diff = xmag-newXmag;
    if (abs(diff) >  0.01) {
      xmag -= diff/4.0;
    }

    diff = ymag-newYmag;
    if (abs(diff) >  0.01) {
      ymag -= diff/4.0;
    }
  }
  if (mouseButton == RIGHT || mouseButton == CENTER) {
    mX = mouseX;
    mY = mouseY;
  }
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
