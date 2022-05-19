//--------------------------------------
// Gestor de seniales (con enie)
// Emiliano Causa 2011-2012
//--------------------------------------
/*

 Constructores:
 ==============
 
 - GestorSenial( ) 
 
 - GestorSenial( float minimo_, float maximo_ ) 
 
 - GestorSenial( String etiqueta_, 
 float minimo_, float maximo_, //minimo y maximo del rango de entrada
 int tamanioMuestra_, //tamanio con el que visualiza la senial
 float factorAmortiguacion_, //factor con el que filtra 
 float amplitudMaxDerivada_, //rango en el que toma la derivada
 int maxMuestrasPromedio_, //cantidad de muestras para el promedio
 float amplitudMaxVarianza_ ) 
 
 Miembros de devolucion:
 =======================
 - float valorIn 
 - float filtrado
 - float derivada
 - float varianza
 - float promedio
 
 Funciones de devolucion:
 ========================
 - float filtradoNorm()
 - float derivadaNorm()
 - float varianzaNorm()
 
 Ejecutar en cada ciclo:
 =======================
 void actualizar( float valorIn_ ) 
 
 */
class GestorSenial {

  String etiqueta;
  float valorIn, filtrado;
  float minimo;
  float maximo;
  //float factor;

  float derivada;
  float promedio, varianza;  
  int cantDatos;

  int tamanioMuestra;
  float factorAmortiguacion;
  float amplitudMaxDerivada;
  int maxMuestrasPromedio;
  float amplitudMaxVarianza;

  GrafXvsTime grafica, graficaFilt, graficaDeriv, graficaPromedio, graficaVarianza;

  //-------------------------------------------

  GestorSenial( ) {
    this( "", 0, 100, 200, 0.1, 0.5, 50, 3 );
  }
  //-------------------------------------------
  GestorSenial( float minimo_, float maximo_ ) {
    this( "", minimo_, maximo_, 200, 0.1, 0.5, 50, 3 );
  }
  //-------------------------------------------

  GestorSenial( String etiqueta_, 
  float minimo_, float maximo_, //minimo y maximo del rango de entrada
  int tamanioMuestra_, //tamanio con el que visualiza la senial
  float factorAmortiguacion_, //factor con el que filtra 
  float amplitudMaxDerivada_, //rango en el que toma la derivada
  int maxMuestrasPromedio_, //cantidad de muestras para el promedio
  float amplitudMaxVarianza_ ) { //rango en el que toma la varianza

    etiqueta = etiqueta_;
    amplitudMaxVarianza = amplitudMaxVarianza_;
    cantDatos = 0;
    maxMuestrasPromedio = maxMuestrasPromedio_;
    factorAmortiguacion = factorAmortiguacion_;
    amplitudMaxDerivada = amplitudMaxDerivada_;
    minimo = minimo_;
    maximo = maximo_;
    tamanioMuestra = tamanioMuestra_;

    grafica = new GrafXvsTime( tamanioMuestra, minimo, maximo );
    graficaFilt = new GrafXvsTime( tamanioMuestra, minimo, maximo );
    graficaPromedio = new GrafXvsTime( tamanioMuestra, minimo, maximo );

    graficaDeriv = new GrafXvsTime( tamanioMuestra, -amplitudMaxDerivada, amplitudMaxDerivada );
    graficaVarianza = new GrafXvsTime( tamanioMuestra, -amplitudMaxVarianza, amplitudMaxVarianza );
  }
  //-------------------------------------------

  float filtradoNorm() {
    return constrain( map( filtrado, minimo, maximo, 0, 1 ), 0, 1);
  }  
  //-------------------------------------------

  float derivadaNorm() {
    return constrain( map( derivada, -amplitudMaxDerivada, amplitudMaxDerivada, -1, 1 ), -1, 1);
  }  
  //-------------------------------------------

  float varianzaNorm() {
    return constrain( map( varianza, -amplitudMaxVarianza, amplitudMaxVarianza, -1, 1 ), -1, 1);
  }  
  //-------------------------------------------

  void actualizar( float valorIn_ ) {

    valorIn = valorIn_;
    float anterior = filtrado;
    filtrado = valorIn * factorAmortiguacion + filtrado * (1-factorAmortiguacion);
    derivada = filtrado-anterior;
    varianza = filtrado-promedio;

    if ( cantDatos <= 0 ) {
      promedio = filtrado;
    }
    else {
      int maxDatos = min( cantDatos, maxMuestrasPromedio );
      float esteFactor = 1.0/maxDatos;
      promedio = filtrado * esteFactor + promedio * (1-esteFactor);
    }

    cantDatos ++;

    grafica.agregar( valorIn ); 
    graficaFilt.agregar( filtrado ); 
    graficaDeriv.agregar( derivada );
    graficaPromedio.agregar( promedio );
    graficaVarianza.agregar( varianza );
  }
  //-------------------------------------------

  void imprimir( float left, float top ) {
    imprimir( left, top, 500, 100, true, false, false, false );
  }
  //-------------------------------------------

  void imprimir( float left, float top, float ancho, float alto ) {
    imprimir( left, top, ancho, alto, true, false, false, false );
  }
  //-------------------------------------------

  void imprimir( float left, float top, float ancho, float alto, 
  boolean mostrarFiltrado, boolean mostrarDerivada, boolean mostrarPromedio, 
  boolean mostrarVarianza ) {
    
    pushStyle();

    fill( 0 );
    stroke( 255, 255, 255 );
    grafica.imprimir( left, top, ancho, alto, true );

    if ( mostrarVarianza || mostrarDerivada ) {
      stroke( 100 );
      line( left, top + alto*0.5, left+ancho, top + alto*0.5 );
    }

    if ( mostrarFiltrado ) {
      stroke( 0, 255, 0 );
      graficaFilt.imprimir( left, top, ancho, alto, false );
    }

    if ( mostrarDerivada ) {
      stroke( 255, 255, 0 );
      graficaDeriv.imprimir( left, top, ancho, alto, false );
    }

    if ( mostrarPromedio ) {
      stroke( 50, 50, 255 );
      graficaPromedio.imprimir( left, top, ancho, alto, false );
    }

    if ( mostrarVarianza ) {
      stroke( 150, 150, 255 );
      graficaVarianza.imprimir( left, top, ancho, alto, false );
    }
    
    popStyle();
  }
  //-------------------------------------------

  String generarXML() {
    String cadena = "";

    cadena += "< ";
    cadena += etiqueta;
    cadena += " minimo=\"" + minimo + "\" ";
    cadena += " maxmimo=\"" + maximo + "\" ";

    cadena += " tamanioMuestra=\"" + tamanioMuestra + "\" ";

    cadena += " factorAmortiguacion=\"" + factorAmortiguacion + "\" ";
    cadena += " amplitudMaxDerivada=\"" + amplitudMaxDerivada + "\" ";
    cadena += " maxMuestrasPromedio=\"" + maxMuestrasPromedio + "\" ";
    cadena += " amplitudMaxVarianza=\"" + amplitudMaxVarianza + "\" ";

    cadena += "/>";
    return cadena;
  }
}
// ------------------------------------------------------------------------------------------------------
// MARCA: Grafica X versus TIME - Grafica X versus TIME - Grafica X versus TIME - Grafica X versus TIME -
// ------------------------------------------------------------------------------------------------------
// Este objeto permite grafica evoluciones en el tiempo
// Emiliano Causa - Julio 2006
//
// GrafXvsTime(int cantPuntos_, float minimo_, float maximo_) - inicializa el objeto, definiendo la cantidad de puntos
//                                                              a monitorear, y los valores minimo y maximos
// void agregar( float dato ) - agrega puntos a la grÔøΩfica
// void imprimir( float left, float top, float ancho, float alto ) - imprime los datos en pantalla en la posiciÔøΩn y las
//                                                                   dimensiones indicadas
//
class GrafXvsTime {
  float minimo;
  float maximo;

  int cantPuntos;
  int cont;

  float datos[];

  GrafXvsTime(int cantPuntos_, float minimo_, float maximo_) {
    minimo = minimo_;
    maximo = maximo_;
    cantPuntos = cantPuntos_;
    datos = new float[cantPuntos];
    cont = 0;
  }

  void agregar( float dato ) {
    datos[cont] = dato;
    cont = (cont+1) % cantPuntos;
  }

  void imprimir( float left, float top, float ancho, float alto, boolean conFondo ) {

    if ( conFondo ) {
      rectMode(CORNER);
      rect(left, top, ancho, alto);
    }
    float paso = ancho/cantPuntos;
    for (int i=1 ; i<cantPuntos ; i++) {
      if (i != cont) {
        float valor1 = map( constrain( datos[i-1], minimo, maximo ), minimo, maximo, top+alto, top );
        float valor2 = map( constrain( datos[i], minimo, maximo ), minimo, maximo, top+alto, top);
        line( left + paso * (i-1), valor1, left + paso * i, valor2 );
      }
    }
  }
}
