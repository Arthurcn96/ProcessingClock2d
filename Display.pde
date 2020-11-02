// Corpo do relógio onde as peças são montadas
int a = 300;
int b = 300;
color color1 = #d02323;



class Display{

  Display(){
  }


  void show(){
    pushMatrix();
      translate(-a/2, -b/2, -50);
      strokeWeight(5);
      stroke(color1);
      rect(0, 0, a, b, 15);
    popMatrix();
  }

}
