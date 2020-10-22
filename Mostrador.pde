// Parte frontal do relógio - Ponteiros e Cronometros
class Mostrador {

  int h;
  int m;
  int s;
  int dist;

  color primary = #000000;
  color secondary = #000000;
  color tertirary = #000000;

  int cx, cy;
  float secondsRadius;
  float minutesRadius;
  float hoursRadius;
  float clockDiameter;

  Mostrador(int translate){

    dist = translate;

  }

  void show(){

    h = hour();
    m = minute();
    s = second();

    pushMatrix();

      translate(0,0,dist);
      rotate(radians(-90));

       //Segundo
      strokeWeight(5);
      stroke(primary);
      noFill();
      float end = map(s, 0, 60, 0, 360);
      arc(0, 0, 300, 300, 0, radians(end));

      push();
        rotate(radians(end));
        stroke(primary);
        line(0, 0, 100, 0);
      pop();

      //Minuto
      strokeWeight(10);
      stroke(secondary);
      float end1 = map(m, 0, 60, 0, 360);
      arc(0, 0, 280, 280, 0, radians(end1));

      push();
        rotate(radians(end1));
        stroke(secondary);
        line(0, 0, 80, 0);
      pop();

      //Hora
      strokeWeight(15);
      stroke(tertirary);
      float end2 = map(h % 12, 0, 12, 0, 360);
      arc(0, 0, 250, 250, 0, radians(end2));

      push();
        rotate(radians(end2));
        stroke(tertirary);
        line(0, 0, 60, 0);
      pop();

    int radius = min(width, height) / 4;
    secondsRadius = radius * 0.9;
    minutesRadius = radius * 0.10;
    hoursRadius = radius * 0.50;
    cx = 0;
    cy = 0;

    // Draw the minute ticks
    strokeWeight(3);
    beginShape(POINTS);

    pushMatrix();
    rotate(radians(90));
    stroke(#FFFFFF);
    for (int a = 0; a < 360; a+=5) {
      float angle = radians(a);
      float x = cx + cos(angle) * secondsRadius;
      float y = cy + sin(angle) * secondsRadius;
      if(a==0){
        fill(255,0,0);
        text("I", x+5,y+5);
      }else if(a==30){
        fill(255,0,0);
        text("II", x+5,y+8);
      }else if(a==60){
        fill(255,0,0);
        text("III", x,y+13);
      }else if(a==90){
        fill(255,0,0);
        text("IV", x-3,y+15);
      }else if(a==120){
        fill(255,0,0);
        text("V'", x-5,y+13);
      }else if(a==150){
        fill(255,0,0);
        text("VI", x-12,y+8);
      }else if(a==180){
        fill(255,0,0);
        text("VII", x-13,y+5);
      }else if(a==210){
        fill(255,0,0);
        text("VIII", x-18,y+2);
      }else if(a==240){
        fill(255,0,0);
        text("IX", x-11,y-5);
      }else if(a==270){
        fill(255,0,0);
        text("X", x-7,y-10);
      }else if(a==300){
        fill(255,0,0);
        text("XI", x,y-3);
      }else if(a==330){
        fill(255,0,0);
        text("XII", x+4,y+1);
      }
      vertex(x,y);
    }
    popMatrix();

    endShape();
    popMatrix();
  }
}
