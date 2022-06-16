//esta clase dibujar lineas

class Linea {
  float x, y;
  float t = 10;
  float dir;
  float dire, vel, angulo, anguloNoventa, anguloNoventa1;
  float radio;
  PImage imagen;
  PImage mascara;
  int cantidadPorciones;
  int cualPorcion = 0;
  float xa, ya, xd, yd;
  boolean yaTengoCuatrosPuntos = false;
  color relleno;
  int numero = int(random(0, 7));
  float offset1 = random(-1, 1);
  int offset2 = int(random(-1, 1));
  float offsetC = random(0, 100);

  Linea(color relleno_, float x_, float y_) {
    String nombreTrazo ="trazo"+"0"+numero+".png";
    relleno = relleno_;
    x = x_;
    y = y_;
    String nombre2 = nombreTrazo;
    imagen = loadImage(nombreTrazo);
    imagen.mask(imagen);
    mascara = loadImage(nombre2);
    mascara.filter(INVERT);
    imagen.filter(INVERT);
    imagen.mask(mascara);
  }

  void actualizar(float dire_, float angulo_, int largo_, float ancho_, float anguloNoventa_) {
    dire = dire_*offset1;
    angulo = angulo_ + anguloNoventa1;
    cantidadPorciones = largo_+ offset2;
    radio = ancho_;
    anguloNoventa = anguloNoventa_;
    vel = 4;
    if (terminoDeDibujar()==false) {
      mover();
    }
    dibujarTrazo();
    curvaAnoventa(anguloNoventa);
  }

  void mover() {
    dir += angulo;
    float dx = vel * cos( dir + dire);
    float dy = vel * sin( dir + dire);
    x = x + dx;
    y = y + dy;
    if ( x>width || x<0 || y>height || y<0 ) {
      yaTengoCuatrosPuntos = false;
    }
  }

  void dibujarTrazo() {
    if (cualPorcion<cantidadPorciones-1) {
      cualPorcion = (cualPorcion+1) % cantidadPorciones;
    }
    float anchoNorm = 1.0/cantidadPorciones;
    float u1 = map(cualPorcion, 0, cantidadPorciones, 0, 1);
    float v1 = 0;
    float u2 = u1+anchoNorm;
    float v2 = 0;
    float u3 = u2;
    float v3 = 1;
    float u4 = u1;
    float v4 = 1;
    //EL RADIO MANEJA EL ANCHO
    float angulo = radians(-90)+ dir + dire;
    float xb = radio * cos(angulo) + x;
    float yb = radio * sin(angulo) + y;
    angulo = radians(90)+dir;
    float xc = radio * cos(angulo) + x;
    float yc = radio * sin(angulo) + y;
    //texturizar
    if (yaTengoCuatrosPuntos) {
      push();
      tint(relleno);
      noStroke();
      beginShape();
      textureMode(NORMAL);
      texture(imagen);
      vertex(xa, ya, u1, v1);
      vertex(xb, yb, u2, v2);
      vertex(xc, yc, u3, v3);
      vertex(xd, yd, u4, v4);
      endShape();
      pop();
    }
    xa = xb;
    ya = yb;
    xd = xc;
    yd = yc;
    yaTengoCuatrosPuntos = true;
  }
  boolean terminoDeDibujar() {
    if (cualPorcion==cantidadPorciones-1) {
      return true;
    } else {
      return false;
    }
  }
  
  void curvaAnoventa(float anguloNoventa_) {
    if (cualPorcion>(cantidadPorciones/3) && cualPorcion<(cantidadPorciones-cantidadPorciones/3)) {
      if (offsetC>50) {
        anguloNoventa1 = anguloNoventa_;
      } else {
        anguloNoventa1 = -anguloNoventa_;
      }
    } else {
      anguloNoventa1 = 0;
    }
  }
}
