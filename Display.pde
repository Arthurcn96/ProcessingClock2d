// Corpo do relógio onde as peças são montadas
int a = 290;
int b = 330;
int aa = int(a*1.28);
int bb = int(b*1.3);

color color1 = color(120, 120, 120,1);
color color2 = #101010;

class Display{
  int strokeWeight;


  Display(int _strokeWeight){
    caixa = new Caixa();

    strokeWeight = _strokeWeight;
  }

  void show(){

    interno();
    externo();

  }

  void interno(){
    pushMatrix();
      translate(-a/2, -b/2,0.65);
      fill(color2);
      rect(0, 0, a, b, 15);
    popMatrix();
  }

  void externo(){

    pushMatrix();

      translate(-aa/2 , -bb/2,0.01);
      fill(color1);
      strokeWeight(strokeWeight);
      stroke(0);
      rect(0, 0, aa, bb, 50);


      for(int i = 0; i<10; i++){

        fill(10,10,10,20);
        noStroke();
        rect(0, (i*30)/2, aa, bb - (i*30), 50);

      }

    popMatrix();
  }



}
