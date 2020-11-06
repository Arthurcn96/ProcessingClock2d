int tam;
color b1, b2, c1, c2;


class Botao{
  int strokeWeight;


  Botao(int _strokeWeight){

    tam = 55;

    b1 = color(255);
    b2 = color(0);
    c1 = color(204, 102, 0);
    c2 = color(0, 102, 153);
    strokeWeight = _strokeWeight;

  }

  void show(boolean pressionadoCima, boolean pressionadoBaixo){
    translate(8,0);

    stroke(0);
    botaoSuperior(pressionadoCima);

    stroke(0);
    botaoInferior(pressionadoBaixo);

  }


  void botaoSuperior(boolean pressionado){
    strokeWeight(strokeWeight);

    if (pressionado){

      fill(70, 70, 70, 20);
      rect(160, -110 , 10, 72, 60, 10, 10, 60);


      for(int i = 0; i<4; i++){

        noStroke();
        fill(10, 10, 10, 30);
        rect(160, - 110 + (i*8), 10, 72 - (i*8)*2, 60, 10, 10, 60);

      }


    }else{

      fill(70, 70, 70, 20);
      rect(160, -110 , 30, 72, 60, 10, 10, 60);


      for(int i = 0; i<4; i++){

        noStroke();
        fill(10, 10, 10, 30);
        rect(160, - 110 + (i*8), 30, 72 - (i*8)*2, 60, 10, 10, 60);

      }

    }
  }

  void botaoInferior(boolean pressionado){
    strokeWeight(strokeWeight);

    if (pressionado){

      fill(70, 70, 70, 20);
      rect(160, 12, 4, 112, 10, 2, 2, 10);



      for(int i = 0; i<4; i++){

        noStroke();
        fill(10, 10, 10, 30);
        rect(160, 12 + (i*8), 4, 112 - (i*8)*2, 10, 10, 10, 10);

      }

    }else{

      fill(70, 70, 70, 20);
      rect(160, 12, 10, 112, 10, 2, 2, 10);



      for(int i = 0; i<4; i++){

        noStroke();
        fill(10, 10, 10, 30);
        rect(160, 12 + (i*8), 10, 112 - (i*8)*2, 10, 10, 10, 10);

      }

    }


  }


}
