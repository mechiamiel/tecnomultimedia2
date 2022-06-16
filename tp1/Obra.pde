OscP5 osc;
//-- CALIBRACIÓN DE SONIDO
boolean monitor = false;

float minimaIntensidad = 50;
float maximaIntensidad = 100;

float minimaAltura = 45;
float maximaAltura = 70;

GestorSenial intensidad;
GestorSenial altura;

float amp = 0;
float pitch = 0;

//--ESTADOS SONIDO
boolean antesHabiaSonido = false;

class Obra {

  Capa [] capa;
  Capa [] capaCirculo;

  String estado, estadoFINAL;
  int cantidad = 11;
  int cantidadC = 4;
  int variacionCantidadGeneral = int(random(2, 8));
  int variacionCantidadGeneralC = int(random(5, 7));
  int variacionCantidadConjunto;
  //
  PImage firma;
  int ancImg = 100;
  int altImg = 70;
  int xImg = width/2;
  int yImg = height-100;
  //
  PImage [] imagenCirculo;
  int tipoCirculo;
  //tiempo de espera entre dibujos, asi se dibujan completos
  int esperar1 = 0;
  int tiempoCambio = 45;
  int tiempoCambioCorto = 15;
  int esperarFINAL = 0;
  int tiempoFINAL = 600;
  // REINICIAR
  boolean volverAEmpezar = false;
  boolean iniciar;
  boolean reiniciar = false;
  // PALETA
  Paleta [] p;
  int cambioColor;

  Obra() {
    //set up
    cambioColor = int(random (0, 3));
    tipoCirculo = int(random (0, 1));
    //
    osc = new OscP5 (this, 12345);
    intensidad = new GestorSenial( minimaIntensidad, maximaIntensidad );
    altura = new GestorSenial( minimaAltura, maximaAltura );
    //
    p = new Paleta[4];
    p[0] = new Paleta("imagen01.png");
    p[1] = new Paleta("imagen02.png");
    p[2] = new Paleta("imagen03.png");
    p[3] = new Paleta("imagen04.png");
    //
    imagenCirculo = new PImage[3];
    imagenCirculo[0] = loadImage("trazoCirculo1.png");
    imagenCirculo[1] = loadImage("trazoCirculo2.png");

    //
    firma = loadImage("firma.png");
    //
    capaCirculo = new Capa[cantidadC];
    for (int i=0; i<cantidadC; i++) {
      variacionCantidadConjunto = variacionCantidadGeneralC+(int(random(1, i)));
      capaCirculo[i] = new Capa (2+variacionCantidadConjunto, p[cambioColor], imagenCirculo[tipoCirculo]);
      println("cantidad circulos:"+variacionCantidadConjunto);
    }
    capa = new Capa[cantidad];
    for (int i=0; i<cantidad; i++) {
      variacionCantidadConjunto = variacionCantidadGeneralC-(i/2);
      capa[i] = new Capa (4+variacionCantidadConjunto, p[cambioColor]);
      println("cantidad lineas:"+variacionCantidadConjunto);
    }
    //estado inicial
    estado = "empezando";
    estadoFINAL = "estadoFINAL";
  }

  void actualizar() {

    println(estado);
    println(esperarFINAL);
    //SONIDO
    intensidad.actualizar( amp );
    altura.actualizar( pitch );
    boolean haySonido = intensidad.filtradoNorm() > 0.2;
    //eventos de inicio y fin del sonido
    boolean empezoElSonido = haySonido && !antesHabiaSonido;

    //Parametros para las lineas
    //(float dir_, float angulo_, int largo_, float ancho_, float anguloNoventa_)
    //dirreccion en 360 grados, angulo es el giro poner valores de 0 a 3 sino dobla mucho
    //el largo es la tercera variable y va de 0 a lo que sea, altura(ancho) y opaciodad estan normalizadas van de 0 a 1
    //el valor anguloNoventa es para que se genere la curva a 90 en el medio del trazo, si es 0 no se genera si es 3.5 si

    if (estado.equals("empezando")&& empezoElSonido) {
      background(255);
      pasarEstado("iniciar");
    }
    if (estado.equals("iniciar")) {
      pushStyle();
      colorMode(HSB);
      background(281, 18, int(map(intensidad.filtradoNorm(), 0, 1, 50, 120)));
      popStyle();
      pasarEstado("primerasLineas");
    }
    if (estado.equals("primerasLineas") && haySonido) {
      capa[0].dibujarLineas(275, 0, 70, altura.filtradoNorm(), 3.5);
      pasarEstado("segundasLineas");
    }
    if (estado.equals("segundasLineas") && haySonido) {
      capa[1].dibujarLineas(45, 0.5, 30, altura.filtradoNorm(), 0);
      pasarEstado("primerosCirculos");
    }
    if (estado.equals("primerosCirculos") && haySonido) {
      capaCirculo[0].dibujarCirculos(intensidad.filtradoNorm());
      pasarEstado("tercerasLineas");
    }
    if (estado.equals("tercerasLineas") && haySonido) {
      capa[2].dibujarLineas(90, 0, 30, altura.filtradoNorm(), 0);
      pasarEstado("cuartasLineas");
    }
    if (estado.equals("cuartasLineas") && haySonido) {
      capa[3].dibujarLineas(1, 2, 20, altura.filtradoNorm(), 0);
      pasarEstado("lineasCortas");
    }
    if (estado.equals("lineasCortas") && haySonido) {
      capa[4].dibujarLineas(25, 0, 15, altura.filtradoNorm(), 0);
      pasarEstadoCorto("segundosCirculos");
    }
    if (estado.equals("segundosCirculos") && haySonido) {
      capaCirculo[1].dibujarCirculos(intensidad.filtradoNorm());
      pasarEstado("primerasLineas2");
      estadoFINAL = "despuesDELprimerCICLO";
    }
    if (estado.equals("primerasLineas2") && haySonido) {
      capa[5].dibujarLineas(275, 2, 40, altura.filtradoNorm(), 0);
      pasarEstado("segundasLineas2");
    }
    if (estado.equals("segundasLineas2") && haySonido) {
      capa[6].dibujarLineas(1, 0, 15, altura.filtradoNorm(), 0);
      pasarEstado("tercerasLineas2");
    }
    if (estado.equals("tercerasLineas2") && haySonido) {
      capa[7].dibujarLineas(45, 2, 30, altura.filtradoNorm(), 0);
      pasarEstado("cuartasLineas2");
    }
    if (estado.equals("cuartasLineas2") && haySonido) {
      capa[8].dibujarLineas(1, 2, 30, altura.filtradoNorm(), 0);
      pasarEstado("lineasCortas2");
    }
    if (estado.equals("lineasCortas2") && haySonido) {
      capa[9].dibujarLineas(10, 0, 15, altura.filtradoNorm(), 0);
      pasarEstadoCorto("ultimasLineas");
    }
    if (estado.equals("ultimasLineas") && altura.filtradoNorm()>=0.5) {
      capa[10].dibujarLineas(45, 0, 60, 1, 3.5);
      pasarEstado("segundosCirculos2");
    } else if(estado.equals("ultimasLineas")) {
      estado = "segundosCirculos2";
    }

    if (estado.equals("segundosCirculos2") && haySonido) {
      capaCirculo[2].dibujarCirculos(intensidad.filtradoNorm());
      pasarEstado("firma");
    }
    if (estado.equals("firma") && haySonido) {
      image(firma, xImg, yImg, ancImg, altImg);
      pasarEstadoCorto("reiniciar");
    }
    if (estadoFINAL.equals("despuesDELprimerCICLO") && !haySonido) {
      if (esperarFINAL<tiempoFINAL) {
        esperarFINAL ++;
      } else {
        estado = "firma";
        esperarFINAL = 0;
      }
    }
  }

  void pasarEstado(String estado_) {
    if (esperar1<tiempoCambio) {
      esperar1 ++;
    } else {
      estado = estado_;
      esperar1 = 0;
    }
  }
  void pasarEstadoCorto(String estado_) {
    if (esperar1<tiempoCambioCorto) {
      esperar1 ++;
    } else {
      estado=estado_;
      esperar1=0;
    }
  }

  boolean reiniciar() {
    if (estado.equals("reiniciar")) {
      return true;
    } else {
      return false;
    }
  }

  void  oscEvent (OscMessage m) {
    if (m.addrPattern().equals("/amp")) {
      amp = m.get(0).floatValue();
    } else if (m.addrPattern().equals("/pitch")) {
      pitch = m.get(0).floatValue();
    }
  }
}
