int tam;
color b1, b2, c1, c2;

class Botao{


  Botao(){

    tam = 55;

    b1 = color(255);
    b2 = color(0);
    c1 = color(204, 102, 0);
    c2 = color(0, 102, 153);

  }

  void show(){

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
