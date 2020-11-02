// Parte frontal do relógio - Ponteiros e Cronometros
class Mostrador {

  int h;
  int m;
  int s;
  int dist;

  color primary = #DEB46B;
  color secondary = #FF0000;
  color tertirary = #FF0000;

  Mostrador(int translate){

    dist = translate;

  }

  void show(){

    h = hour();
    m = minute();
    s = second();

    pushMatrix();
      digital();
      ponteiros();
      marcadores();
    popMatrix();
  }

  void digital(){
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

  void centro(){
    noFill();
    strokeWeight(5);
    stroke(secondary);
    circle(0,0,10);
  }

    void marcadores(){
      translate(0,0,-20);
      for(int grau = 0; grau<360; grau += 30){
        ponteiro(false, true, 8, #E3E3E3, 75, 105, grau);
      }
    }

    void ponteiro(boolean haste,boolean redondo, int grossuraPonteiro, color cor, int inicio, int comprimento, float rotacao){
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

    void ponteiros(){
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
      ponteiro(true, true, 10, secondary, 15, 108, end1);

      //Hora
      float end2 = map(h % 12, 0, 12, 0, 360);
      ponteiro(true, true, 10, tertirary, 15, 55, end2);

    }
  }
