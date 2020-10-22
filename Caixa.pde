// Corpo do relógio onde as peças são montadas
int w = 0;
int h = 0;
color primary;
color secondary;

class Caixa{


  Caixa(){

    w = 390;
    h = 390;

    primary = #FFFFFF;
    secondary = #d02323;

  }

  Caixa(color primeira, color segunda){

    w = 390;
    h = 390;
    
    primary = primeira;
    secondary = segunda;

  }

  void show(){

      pushMatrix();
        translate(-w/2, -h/2,-50);
        fill(primary);
        strokeWeight(10);
        stroke(secondary);
        rect(0, 0, w, h, 7);
      popMatrix();

  }
}
