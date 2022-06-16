
class Capa {
  Conjunto conjuntoLineas;
  Conjunto conjuntoCirculos;

  int cantidad;
  Paleta paleta;
  color relleno;

  int cantidadC;
  Paleta paletaC;
  color rellenoC;
  PImage imagen;

  float dir, angulo, ancho, anguloNoventa;
  int largo;
  float tamC;

  Capa(int cantidad_, Paleta paleta_) {
    cantidad = cantidad_;
    paleta = paleta_;
    relleno = paleta.darUnColor();
    conjuntoLineas = new Conjunto(cantidad, relleno);
    //println("declaracion:"+conjuntoLineas);
  }

  Capa(int cantidadC_, Paleta paletaC_, PImage imagen_) {
    cantidadC = cantidadC_;
    paletaC = paletaC_;
    rellenoC = paletaC.darUnColor();
    imagen = imagen_;
    conjuntoCirculos = new Conjunto(cantidadC, rellenoC, imagen);
    //println("declaracionC:"+conjuntoCirculos);
  }

  void dibujarLineas(float dir_, float angulo_, int largo_, float ancho_, float anguloNoventa_) {
    dir = radians(dir_);
    angulo = radians(angulo_);
    largo = largo_;
    anguloNoventa = radians(anguloNoventa_);
    ancho = 15 + ( map(ancho_, 0, 1, 20, 1));
    //println(conjuntoLineas);
    conjuntoLineas.dibujarLinea(dir, angulo, largo, ancho, anguloNoventa);
  }

  void dibujarCirculos(float tam_) {
    tamC = map(tam_, 0, 1, 30, 80);
    conjuntoCirculos.dibujarCirculo(tamC);
  }
}
