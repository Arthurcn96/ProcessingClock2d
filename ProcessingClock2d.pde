PImage down_img, up_img, clock;
Mostrador mostrador;
Display display;
Caixa caixa;
Botao botao;
float xmag, ymag = 0;
float newXmag, newYmag = 0;
int zoom = 0;
int mX, mY;

void setup() {
  size(800, 700, P3D);
  cursor(HAND);

  up_img = loadImage("up.png");
  down_img = loadImage("down.png");
  clock = loadImage("pulseira.png");

  int dim = 8 ;

  mostrador = new Mostrador(0);
  display = new Display(4);
  botao = new Botao(4);
  caixa = new Caixa();


  mX = (width / 2) + dim;
  mY = (height / 2);

  background(#FFFFFF);

  smooth(8);

}

void draw() {
  background(50);
  camera();

  pushMatrix();
    display.show();
    translate (0,0,50);
    mostrador.show();
    botao.show();
    // rect(0, 0, a, b, 15);
  popMatrix();

  pushMatrix();
    tint(255, 255);
    image(clock, -width/2,-height/2);
  popMatrix();
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
