PImage cafe, almoco, trabalho, lazer, dormir;


// Parte frontal do relógio - Ponteiros e Cronometros
class Mostrador {

  PFont fonte = loadFont("YuGothic-Light-24.vlw");
  int day, year;
  String month;
  int h;
  int m;
  int s;
  int dist;

  color primary = #DEB46B;
  color secondary = #ffffff;
  color tertiary = #ffffff;
  color default_off = #1C1C1C;


  Mostrador(int translate){

    dist = translate;

    cafe = loadImage("cafe.png");
    trabalho = loadImage("trabalho.png");
    almoco = loadImage("almoco.png");
    lazer = loadImage("lazer.png");
    dormir = loadImage("dormir.png");

  }

////////////////////////////////////////////////////////////////////////
  void show(int mode_temp){

    day = day();
    year = year();
    h = hour() -1 ;
    m = minute();
    s = second();

    pushMatrix();
      data();
      digital();
      temperature(26, mode_temp);
      time_mode();
      ponteiros(primary, secondary, tertiary);
      marcadores();
    popMatrix();
  }

////////////////////////////////////////////////////////////////////////
  void off(){

    h = hour()-1;
    m = minute();
    s = second();
    pushMatrix();
      ponteiros(default_off,default_off,default_off);
      marcadores_off();
    popMatrix();
  }


////////////////////////////////////////////////////////////////////////
  void data(){
    int m = month();
    mes(m);
    String data = month + " " + str(day) + ", " + str(year);
    fill(secondary);
    textFont(fonte);
    text(data, -125, -125);

  }


////////////////////////////////////////////////////////////////////////
  void mes(int m){
     switch(m){
       case(1):
         month = "Jan";
       case(2):
         month = "Fev";
       case(3):
         month = "Mar";
       case(4):
         month = "Abr";
       case(5):
         month = "Mai";
       case(6):
         month = "Jun";
       case(7):
         month = "Jul";
       case(8):
         month = "Ago";
       case(9):
         month = "Set";
       case(10):
         month = "Out";
       case(11):
         month = "Nov";
       case(12):
         month = "Dez";
   }
  }

////////////////////////////////////////////////////////////////////////
  // entrada definida em celsius, e mode é a escala de temperatura
  void temperature(float temp_celsius,int mode){
    fill(secondary);

    textSize(24);
    // fahrenheit
    if(mode == 1){
      float F = ((temp_celsius * 9)/5) + 32;
      text(str(F)+"ºF", -125, 145);
    }
    // celsius
    if(mode == 2){
      text(str(temp_celsius)+"ºC", -125, 145);

    }
    // kelvin
    if(mode == 3){
      float K = temp_celsius + 273;
      text(str(K)+"ºK", -125, 145);
    }
  }


/////////////////////// mode dos horarios do dia ///////////////////////
  void mode(int mode){

    if(mode == 1){
      pushMatrix();
        tint(255, 150);
        image(cafe, 90, -150, 30, 30);
      popMatrix();
     }

    if(mode == 2){
      pushMatrix();
        tint(255, 150);
        image(trabalho, 90, -150, 30, 30);
      popMatrix();
    }

    if(mode == 3){
      pushMatrix();
        tint(255, 150);
        image(almoco, 90, -150, 30, 30);
      popMatrix();
    }

    if(mode == 4){
      pushMatrix();
        tint(255, 150);
        image(lazer, 90, -150, 30, 30);
      popMatrix();
    }

    if(mode == 5){
      pushMatrix();
        tint(255, 150);
        image(dormir, 90, -150, 30, 30);
      popMatrix();
    }
  }

////////////////////////////////////////////////////////////////////////
  //define o mode do dia de acordo com a hora
  void time_mode(){
    // hora do cafe
    if(h >= 5 && h <= 9){
      mode(1);
    }
    // trabalho
    if((h > 9 && h < 12) || (h >= 14 && h < 18)){
      mode(2);
    }
    // almoço
    if(h >= 12 && h < 14){
      mode(3);
    }
    // lazer
    if(h >= 18 && h < 23){
      mode(4);
    }
    // dormir
    if(h >= 0 && h < 5){
      mode(5);
    }
  }

////////////////////////////////////////////////////////////////////////
  void digital(){
    //salva em string pra mostrar correto
    String mn = str(m);
    String hr = str(h);


    // Hora Digital
    fill(secondary);

    textSize(24);

    // Coloca um 0 antes de minutos < 10
    if(m<10){
      mn = "0" + str(m);
    }
    if(h<10){
      hr = "0" + str(h);
    }

    text(hr+":"+mn, 65,145);
  }


////////////////////////////////////////////////////////////////////////
  //bolinha do centro do ponteiro
  void centro(color cor){

    noFill();
    strokeWeight(5);
    stroke(cor);
    circle(0,0,10);
  }

////////////////////////////////////////////////////////////////////////
    void marcadores(){
      translate(0,0,-20);
      for(int grau = 0; grau<360; grau += 30){
        ponteiro(false, true, 8, #E3E3E3, 75, 105, grau);
      }
    }

////////////////////////////////////////////////////////////////////////
    void marcadores_off(){
      translate(0,0,-20);
      for(int grau = 0; grau<360; grau += 30){
        ponteiro(false, true, 8, default_off, 75, 105, grau);
      }
    }

////////////////////////////////////////////////////////////////////////
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

////////////////////////////////////////////////////////////////////////
    void ponteiros(color primary, color secondary, color tertiary){
      translate(0,0,dist);
      rotate(radians(-90));

      centro(secondary);

      //Segundo
      float end = map(s, 0, 60, 0, 360);
      push();
        translate(0,0,-15);
        ponteiro(false, false, 2, primary, -25, 108, end);
      pop();

      //Minuto
      float end1 = map(m, 0, 60, 0, 360);
      ponteiro(true, true, 8, secondary, 15, 108, end1);

      //Hora
      float end2 = map(h % 12, 0, 12, 0, 360);
      ponteiro(true, true, 10, tertiary, 15, 55, end2);
    }
  }
