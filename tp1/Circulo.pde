//En esta clase va a dibujar los circulos

class Circulo {
  PImage imagen;
  float x, y, tam;
  Paleta relleno;
  color rellenoFijo;

  Circulo(PImage imagen_, float x_, float y_, color rellenoFijo_) {
    imagen = imagen_;
    x = x_;
    y = y_;
    rellenoFijo= rellenoFijo_;
  }

  void dibujar(float tam_) {
    tam = tam_;
    tint(rellenoFijo);
    image(imagen, x, y, tam, tam);
  }
}
