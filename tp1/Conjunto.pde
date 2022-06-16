
class Conjunto {

  int cantidad;
  float x, y;
  float dir, angulo, ancho, anguloNoventa;
  int largo;
  PImage imagen;
  int cantidadC;
  float xC, yC;

  float tamC;
  float offset;
  color relleno;
  color rellenoC;

  ArrayList <Linea> lineas;
  ArrayList <Circulo> circulos;

  Conjunto(int cantidad_, color relleno_) {
    cantidad = cantidad_;
    relleno = relleno_;
    lineas = new ArrayList <Linea> ();
    for ( int i = 0; i<cantidad; i++) {
      for (int j = 0; j<cantidad; j++) {
        x = ((width/cantidad)*i);
        y = ((height/cantidad)*j);
        offset = random(-30, 30);
        lineas.add(new Linea (relleno, x+offset, y+offset));
      }
    }
  }

  Conjunto(int cantidad_, color rellenoC_, PImage imagen_) {
    cantidadC = cantidad_;
    rellenoC = rellenoC_;
    imagen = imagen_;
    circulos = new ArrayList <Circulo> ();
    for ( int i = 0; i<cantidadC; i++) {
      for (int j = 0; j<cantidadC; j++) {
        if (random(100)<25) {
          xC = ((width/cantidadC)*i);
          yC= ((width/cantidadC)*j);
          offset = random(-10, 10);
          circulos.add(new Circulo (imagen, xC+offset, yC+offset, rellenoC));
        }
      }
    }
  }

  void dibujarLinea(float dir_, float angulo_, int largo_, float ancho_, float anguloNoventa_) {
    dir = dir_;
    angulo = angulo_;
    largo = largo_;
    ancho = ancho_;
    anguloNoventa = anguloNoventa_;
    for (Linea l : lineas) {
      l.actualizar(dir, angulo, largo, ancho, anguloNoventa);
    }
    println("x="+x);
    println("y="+y);
    // println(lineas);
  }

  void dibujarCirculo(float tam_) {
    tamC = tam_;
    for (Circulo c : circulos) {
      c.dibujar(tamC);
    }
  }
}
