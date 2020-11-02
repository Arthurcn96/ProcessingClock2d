import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class ProcessingClock2d extends PApplet {

PImage down_img, up_img, clock;
Mostrador mostrador;
Caixa caixa;
Botao botao;
float xmag, ymag = 0;
float newXmag, newYmag = 0;
int zoom = 0;
int mX, mY;

public void setup() {
  
  cursor(HAND);

  up_img = loadImage("up.png");
  down_img = loadImage("down.png");
  clock = loadImage("clock.png");

  int dim = 8 ;

  mostrador = new Mostrador(-30);
  botao = new Botao();
  caixa = new Caixa();

  mX = (width / 2) + dim;
  mY = (height / 2);

  

}

public void draw() {
  background(50);

  camera();

  // x, y, tamanho_x, tamanho_y
  // tint(255, 255);
  // image(down_img, -135,185,275,150);
  // image(up_img, -135,-330,275,150);

  pushMatrix();
    translate (0,0,50);
    mostrador.show();
    botao.show();

    // caixa.show();
  popMatrix();

  pushMatrix();
    tint(255, 255);
    image(clock, -width/2,-height/2);
  popMatrix();
}


public void mouseWheel(MouseEvent event) {
  float e = event.getCount();
  zoom += e*10;
}

/**
Rotacao da Camera
*/
public void camera(){
  translate(mX, mY, zoom);
  rotateX(-ymag);
  rotateY(-xmag);
}
int tam;
int b1, b2, c1, c2;

class Botao{


  Botao(){

    tam = 55;

    b1 = color(255);
    b2 = color(0);
    c1 = color(204, 102, 0);
    c2 = color(0, 102, 153);

  }

  public void show(){

    fill(185, 185, 185, 20);
    rect(160, -110 , 30, 72, 60, 10, 10, 60);


    fill(185, 185, 185, 20);
    rect(165, 12, 10, 112, 10, 2, 2, 10);

    for(int i = 0; i<4; i++){

      noStroke();
      fill(185, 185, 185, 20);
      rect(160, - 110 + (i*8), 30, 72 - (i*8)*2, 60, 10, 10, 60);

    }

    for(int i = 0; i<4; i++){

      noStroke();
      fill(185, 185, 185, 20);
      rect(165, 12 + (i*8), 10, 112 - (i*8)*2, 10, 10, 10, 10);

    }


  }

}
// Corpo do relógio onde as peças são montadas
int w = 0;
int h = 0;
int primary;
int secondary;
Display display;

class Caixa{


  Caixa(){

    w = 380;
    h = 380;
    display = new Display();

    primary = 0xff000000;
    secondary = 0xffb8b8b8;

  }

  Caixa(int primeira, int segunda){

    w = 380;
    h = 380;

    primary = primeira;
    secondary = segunda;

  }

  public void show(){

      pushMatrix();
        display.show();
        translate(-w/2, -h/2,-50);
        fill(primary);
        strokeWeight(10);
        stroke(secondary);
        rect(0, 0, w, h, 75);
      popMatrix();

  }
}
// Corpo do relógio onde as peças são montadas
int a = 300;
int b = 300;
int color1 = 0xffd02323;



class Display{

  Display(){
  }


  public void show(){
    pushMatrix();
      translate(-a/2, -b/2, -50);
      strokeWeight(5);
      stroke(color1);
      rect(0, 0, a, b, 15);
    popMatrix();
  }

}
// Parte frontal do relógio - Ponteiros e Cronometros
class Mostrador {

  int h;
  int m;
  int s;
  int dist;

  int primary = 0xffDEB46B;
  int secondary = 0xffFFFFFF;
  int tertirary = 0xffFFFFFF;

  Mostrador(int translate){

    dist = translate;

  }

  public void show(){

    h = hour();
    m = minute();
    s = second();

    pushMatrix();
      digital();
      ponteiros();
      marcadores();
    popMatrix();
  }

  public void digital(){
    String mn = str(m);

    // Hora Digital
    fill(primary);
    noFill();
    textSize(24);

    // Coloca um 0 antes de minutos < 10
    if(m<10){
      mn = "0" + str(m);
    }

    text(h+":"+mn, 27,139);
  }

  public void centro(){
    fill(primary);
    strokeWeight(3);
    stroke(secondary);
    circle(0,0,10);
    stroke(0xff000000);
    circle(0,0,1);
  }

    public void marcadores(){
      translate(0,0,-20);
      for(int grau = 0; grau<360; grau += 30){
        ponteiro(false, true, 8, 0xffE3E3E3, 75, 105, grau);
      }
    }

    public void ponteiro(boolean haste,boolean redondo, int grossuraPonteiro, int cor, int inicio, int comprimento, float rotacao){
      push();
        strokeWeight(grossuraPonteiro);
        rotate(radians(rotacao));
        stroke(cor);
        line(inicio, 0, comprimento, 0);
        strokeWeight(grossuraPonteiro/2);
        if(haste){
          line(grossuraPonteiro/2, 0, 30, 0);
        }if (redondo){
          fill(cor);
          circle(inicio,0,grossuraPonteiro/2);
          fill(cor);
          circle(comprimento,0,grossuraPonteiro/2);
        }
      pop();
    }

    public void ponteiros(){
      translate(0,0,dist);
      rotate(radians(-90));

      centro();

      //Segundo
      float end = map(s, 0, 60, 0, 360);
      push();
        translate(0,0,-15);
        ponteiro(false, false, 2, primary, -25, 108, end);
      pop();

      //Minuto
      float end1 = map(m, 0, 60, 0, 360);
      ponteiro(true, true, 10, secondary, 20, 108, end1);

      //Hora
      float end2 = map(h % 12, 0, 12, 0, 360);
      ponteiro(true, true, 10, tertirary, 20, 55, end2);

    }
    
  }
  public void settings() {  size(800, 700, P3D);  smooth(8); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "ProcessingClock2d" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
