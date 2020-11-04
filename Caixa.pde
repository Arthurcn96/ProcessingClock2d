// Corpo do relógio onde as peças são montadas
int w = 0;
int h = 0;
color primary;
color secondary;


class Caixa{


  Caixa(){

    w = 380;
    h = 380;

    primary = #000000;
    secondary = #000000;

  }

  Caixa(color primeira, color segunda){

    w = 500;
    h = 380;

    primary = primeira;
    secondary = segunda;

  }

  void show(){

  pushMatrix();
      translate(-w/2, -h/2,-50);
        //fill(primary);
       // strokeWeight(10);
      //  stroke(secondary);
      rect(0, 0, w, h, 75);
      popMatrix();

  }
}
