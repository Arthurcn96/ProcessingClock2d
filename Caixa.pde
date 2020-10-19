// Corpo do relógio onde as peças são montadas
PShape s;

class Caixa{

  Caixa(){
      s = createShape();

      s.beginShape();
        s.vertex( 0.000000, 5.000000, 0.672764);
        s.vertex( 2.500000, 4.330127, 0.672764);
        s.vertex( 4.330127, 2.500000, 0.672764);
        s.vertex( 5.000000 ,-0.000000, 0.672764);
        s.vertex( 4.330127 ,-2.500000, 0.672764);
        s.vertex( 2.500000 ,-4.330127, 0.672764);
        s.vertex( 0.000001 ,-5.000000, 0.672764);
        s.vertex( -2.499999 ,-4.330128, 0.672764);
        s.vertex( -4.330126 ,-2.500001, 0.672764);
        s.vertex( -5.000000 ,-0.000002, 0.672764);
        s.vertex( -4.330129, 2.499997, 0.672764);
        s.vertex( -2.500003, 4.330125, 0.672764);
        s.vertex( 0.000000, 5.000000, 0.672764);
      s.endShape();


        s.scale(40);
        s.setStroke(2);
  }

  void show(){
      push();
      translate(0,0,-50);
      shape(s, 0, 0);
      pop();
  }
}
