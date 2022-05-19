//esta clase dibujar lineas

//clase diagrama de estado 3

//aca, se van a dibujar las primeras lineas
//se dibujan el largo segun la duracion del sonido, y la curvatura segun el volumen
//y la direccion agudo y grave
//el color de la paleta y la opacidad usada es random

class Linea {

  float x, y;
  float antesX, antesY;
  float dir, vel, opacidad;
  color relleno;
  float variacionAngular;
  String estado;
  long marcaEnElTiempo, marcaEnElTiempo2;
  int tiempo;
  int tiempoEnEspera;
  int tiempoFinaliza;
  long ahora;
  int fin = 1;

  Linea(color relleno_, float x_, float y_) {
    x = x_;
    y = y_;
    relleno = relleno_;
    reiniciar();
  }

  void reiniciar() {
    estado = "avanza";
    marcaEnElTiempo = millis();
    marcaEnElTiempo2 = millis();
  }

  void actualizar(float dir_, float angulo_, int largo_, float amplitud_, float opacidad_) {
    opacidad = map(opacidad_, 0 , 1, 55 ,255);
    vel = amplitud_* 10;
    dir = dir_;
    variacionAngular = angulo_;
    tiempo = largo_;
    ahora = largo_;

    if ( estado.equals( "avanza" ) ) {
      mover();
      fin++;
      if ( ahora < fin ) {
        estado = "fin";
      }
    }
  }

  void dibujarLinea() {
    pushStyle();
    stroke( relleno , opacidad);
    strokeWeight(20);
    line( x, y, antesX, antesY );
    popStyle();
  }

  void mover() {

    antesX = x;
    antesY = y;

    dir = dir + variacionAngular;

    //transformación de polares a cartesianas
    float dx = vel * cos( dir );
    float dy = vel * sin( dir );

    //cartesianas
    x = x + dx;
    y = y + dy;

    //toroidal
    x = ( x>width ? x-width : x );
    x = ( x<0 ? x+width : x );
    y = ( y>height ? y-height : y );
    y = ( y<0 ? y+height : y );

    if ( dist( x, y, antesX, antesY ) > vel*2 ) {
      antesX = x;
      antesY = y;
    }
  }
}
