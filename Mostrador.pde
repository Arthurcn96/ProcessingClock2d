// Parte frontal do relógio - Ponteiros e Cronometros
class Mostrador {

  int h;
  int m;
  int s;
  int dist;

  color primary = #000000;
  color secondary = #000000;
  color tertirary = #000000;

  Mostrador(int translate){

    dist = translate;

  }

  void show(){

    h = hour();
    m = minute();
    s = second();


    pushMatrix();

      translate(0,0,dist);
      rotate(radians(-50));

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



    popMatrix();

  }
}
