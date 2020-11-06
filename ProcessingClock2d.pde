PImage down_img, up_img, clock;


Mostrador mostrador;
Display display;
Caixa caixa;
Botao botao;
float xmag, ymag = 0;
float newXmag, newYmag = 0;
int zoom = 0 , i = 1;
int mX, mY;

boolean desligado;
boolean pressionadoCima;
boolean pressionadoBaixo;
int temp;

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

  desligado = true;
  pressionadoCima = false;
  pressionadoBaixo = false;
  temp = 1;



  mX = (width / 2) + dim;
  mY = (height / 2);

  background(#FFFFFF);

  smooth(8);

  inicio();

  mostrador.off();

}

void inicio(){
  String texto = "Funcionalidades:\n 'TECLA A' - Alterna entre as escalas de temperatura \n 'BOTÃO DIREITO' - Desliga/liga o display do relógio";
  javax.swing.JOptionPane.showMessageDialog ( null, texto, "Imagem Salva", javax.swing.JOptionPane.INFORMATION_MESSAGE  );
}

void keyPressed() {

  if(key == 'a' || key == 'A'){
    temp++;
    pressionadoBaixo = true;
    if(temp > 3) temp = 1;
  }

}
void keyReleased() {

  if(key == 'a' || key == 'A'){
    pressionadoBaixo = false;
  }

}

void mousePressed() {
  desligado = !desligado;
  pressionadoCima = true;
}

void mouseReleased() {
  pressionadoCima = false;
}

void draw() {
  int flag = 0;
  background(50);
  camera();

  pushMatrix();
    display.show();
    translate (0,0,50);

    if(desligado == true){
      mostrador.off();
    }else{
      mostrador.show(temp);
    }

    botao.show(pressionadoCima, pressionadoBaixo);
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
