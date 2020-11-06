PImage pulseira;

Mostrador mostrador;
Display display;
Caixa caixa;
Botao botao;
int mX, mY;

boolean desligado;
boolean botaoCimaPressionado;
boolean botaoBaixoPressionado;
int temp;

void setup() {
  size(800, 700, P3D);
  cursor(HAND);

  //Texto com LEGENDA dos inputs
  inicio();

  pulseira = loadImage("pulseira.png");

  desligado = true;   // O Relógio desligado
  botaoCimaPressionado = false;
  botaoBaixoPressionado = false;
  temp = 1;

  mX = (width / 2) ;
  mY = (height / 2);

  background(#FFFFFF);

  smooth(8);

  mostrador = new Mostrador(0);
  display = new Display(4);
  botao = new Botao(4);
  caixa = new Caixa();

  mostrador.off();

}

void inicio(){
  String texto = "Funcionalidades:\n 'Botão Direito' - Alterna entre as escalas de temperatura \n 'Botão Esquerdo' - Desliga/liga o display do relógio";
  javax.swing.JOptionPane.showMessageDialog ( null, texto, "Imagem Salva", javax.swing.JOptionPane.INFORMATION_MESSAGE  );
}

void draw() {
  background(50);
  translate(mX, mY);

  pushMatrix();
    display.show();
    translate (0,0,50);
    if(desligado == true){
      mostrador.off();
    }else{
      mostrador.show(temp);
    }
    botao.show(botaoCimaPressionado, botaoBaixoPressionado);
  popMatrix();

  pushMatrix();
    tint(255);
    image(pulseira, -width/2,-height/2);
  popMatrix();
}

void mousePressed() {
  if (mouseButton == RIGHT) {

    temp++;
    if(temp > 3) temp = 1;
    botaoBaixoPressionado = true;

  } else if (mouseButton == LEFT) {

    desligado = !desligado;
    botaoCimaPressionado = true;

  }
}

void mouseReleased() {
  if (mouseButton == RIGHT) {

    botaoBaixoPressionado = false;

  } else if (mouseButton == LEFT) {

    botaoCimaPressionado = false;

  }
}
