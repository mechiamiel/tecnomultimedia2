//
OscP5 osc;
//-- CONTROL DE SONIDO
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
// TRAZOS/CAMINANTES
ArrayList <Linea> linea0;
ArrayList <Linea> linea1;
ArrayList <Linea> linea2;
ArrayList <Linea> linea3;
ArrayList <Linea> linea4;
ArrayList <Linea> linea5;
ArrayList <Linea> linea6;
ArrayList <Linea> linea7;
ArrayList <Linea> linea8;
ArrayList <Linea> linea9;
ArrayList <Linea> linea10;
ArrayList <Linea> linea11;
ArrayList <Linea> linea12;
ArrayList <Linea> lineaC0;
ArrayList <Linea> lineaC1;
ArrayList <Linea> lineaC2;
ArrayList <Linea>[] lineas;
// VARIABLES DE CONTROL DE LINEAS
float dir = 0;
float angulo = 0;
int largo = 0;
String estado, estadoFINAL;
int cantidad = 20;
int cantidadA = 15;
int cantidadC = 10;
//tiempo de espera entre dibujos, asi se dibujan completos
int esperar1 = 0;
int tiempoCambio = 100;
int esperarCambio2 = 0;
int tiempoCambio2 = 60;
int esperarFINAL = 0;
int tiempoFINAL = 600;
// REINICIAR
boolean volverAEmpezar = false;
boolean iniciar;
boolean reiniciar = false;
// PALETA
Paleta [] p;
int cambioColor = int(random(0, 2));

class Obra {
  Obra() {
    // Reinicio
    iniciar = true;
    if (iniciar==true) {
      //set up
      lineas = new ArrayList[16];
      cambioColor = int(random (0, 2));
      //
      osc = new OscP5 (this, 12345);
      intensidad = new GestorSenial( minimaIntensidad, maximaIntensidad );
      altura = new GestorSenial( minimaAltura, maximaAltura );
      //
      p = new Paleta[3];
      p[0] = new Paleta("imagen01.jpeg");
      p[1] = new Paleta("imagen02.jpeg");
      p[2] = new Paleta("imagen03.jpeg");
      //declaraciones de las ARRAY
      linea0 = new ArrayList <Linea> ();
      linea1 = new ArrayList <Linea> ();
      linea2 = new ArrayList <Linea> ();
      linea3 = new ArrayList <Linea> ();
      linea4 = new ArrayList <Linea> ();
      linea5 = new ArrayList <Linea> ();
      linea6 = new ArrayList <Linea> ();
      linea7 = new ArrayList <Linea> ();
      linea8 = new ArrayList <Linea> ();
      linea9 = new ArrayList <Linea> ();
      linea10 = new ArrayList <Linea> ();
      linea11 = new ArrayList <Linea> ();
      linea12 = new ArrayList <Linea> ();
      lineaC0 = new ArrayList <Linea> ();
      lineaC1 = new ArrayList <Linea> ();
      lineaC2 = new ArrayList <Linea> ();
      //LINEAS
      for (int i=0; i<cantidadA; i++) {
        for (int j=0; j<cantidadA; j++) {
          float x = ((width/cantidadA)*i);
          float y = ((height/cantidadA)*j);
          if (random(100)<10) {
            float offSetX0  = random(-100, 100);
            float offSetX1  = random(-100, 100);
            float offSetX2  = random(-100, 100);
            float offSetX3  = random(-100, 100);
            float offSetX4  = random(-100, 100);
            float offSetX5  = random(-100, 100);
            float offSetX6  = random(-100, 100);
            float offSetX7  = random(-100, 100);
            float offSetX8  = random(-100, 100);
            float offSetX9  = random(-100, 100);
            float offSetX10 = random(-100, 100);
            float offSetX11 = random(-100, 100);
            float offSetX12 = random(-100, 100);
            float offSetY0  = random(-100, 100);
            float offSetY1  = random(-100, 100);
            float offSetY2  = random(-100, 100);
            float offSetY3  = random(-100, 100);
            float offSetY4  = random(-100, 100);
            float offSetY5  = random(-100, 100);
            float offSetY6  = random(-100, 100);
            float offSetY7  = random(-100, 100);
            float offSetY8  = random(-100, 100);
            float offSetY9  = random(-100, 100);
            float offSetY10 = random(-100, 100);
            float offSetY11 = random(-100, 100);
            float offSetY12 = random(-100, 100);
            linea0.add(new Linea(p[cambioColor].darUnColor(), x+offSetX0, y+offSetY0));
            linea1.add(new Linea(p[cambioColor].darUnColor(), x+offSetX1, y+offSetY1));
            linea2.add(new Linea(p[cambioColor].darUnColor(), x+offSetX2, y+offSetY2));
            linea3.add(new Linea(p[cambioColor].darUnColor(), x+offSetX3, y+offSetY3));
            linea4.add(new Linea(p[cambioColor].darUnColor(), x+offSetX4, y+offSetY4));
            linea5.add(new Linea(p[cambioColor].darUnColor(), x+offSetX5, y+offSetY5));
            linea6.add(new Linea(p[cambioColor].darUnColor(), x+offSetX6, y+offSetY6));
            linea7.add(new Linea(p[cambioColor].darUnColor(), x+offSetX7, y+offSetY7));
            linea8.add(new Linea(p[cambioColor].darUnColor(), x+offSetX8, y+offSetY8));
            linea9.add(new Linea(p[cambioColor].darUnColor(), x+offSetX9, y+offSetY9));
            linea10.add(new Linea(p[cambioColor].darUnColor(), x+offSetX10, y+offSetY10));
            linea11.add(new Linea(p[cambioColor].darUnColor(), x+offSetX11, y+offSetY11));
            linea12.add(new Linea(p[cambioColor].darUnColor(), x+offSetX12, y+offSetY12));
          }
        }
      }
      //CIRCULOS
      for (int i=0; i<cantidadA; i++) {
        for (int j=0; j<cantidadA; j++) {
          float x = ((width/cantidadA)*i);
          float y = ((height/cantidadA)*j);
          if (random(100)<5) {
            float offSetX1  = random(-100, 100);
            float offSetX2  = random(-100, 100);
            float offSetX3  = random(-100, 100);
            float offSetY1  = random(-100, 100);
            float offSetY2  = random(-100, 100);
            float offSetY3  = random(-100, 100);
            lineaC0.add(new Linea(p[cambioColor].darUnColor(), x+offSetX1, y+offSetY1));
            lineaC1.add(new Linea(p[cambioColor].darUnColor(), x+offSetX2, y+offSetY2));
            lineaC2.add(new Linea(p[cambioColor].darUnColor(), x+offSetX3, y+offSetY3));
          }
        }
      }
      //estado inicial
      estado = "empezando";
      estadoFINAL = "estadoFINAL";
    }
  }

  void actulizar() {
    //debugs
    println("estado: "+estado);
    println("estadoFINAL: "+estadoFINAL);
    println("esperarFINAL: "+esperarFINAL);
    //SONIDO
    intensidad.actualizar( amp );
    altura.actualizar( pitch );
    boolean haySonido = intensidad.filtradoNorm() > 0.2;
    //eventos de inicio y fin del sonido
    boolean empezoElSonido = haySonido && !antesHabiaSonido;
    boolean terminoElSonido = !haySonido && antesHabiaSonido;
    if ( monitor ) {
      //muestra la señal en pantalla
      intensidad.imprimir(100, 100 );
      altura.imprimir(100, 250, 500, 100, false, true, false, false);
    }

    if (estado.equals("empezando") && haySonido) {
      //fondo blanco y espera para pasar a dibujar fondo
      background(255);
      if (esperar1<tiempoCambio) {
        esperar1 ++;
      } else {
        estado = "iniciar";
        esperar1 = 0;
      }
    }
    //////////////////////////////////////////////////CAMBIO DE ESTADO//////////////////////////////////////////////////
    if (estado.equals("iniciar")) {
      //instrucciones de dibujo
      pushStyle();
      colorMode(HSB);
      background(281, 18, int(map(intensidad.filtradoNorm(), 0, 1, 40, 120)));
      popStyle();
      //cambio a espera1 antes de empezar a dibujar lineas
      estado = "espera1";
    }
    //////////////////////////////////////////////////CAMBIO DE ESTADO//////////////////////////////////////////////////
    if (estado.equals("espera1")) {
      //espera1 cambia a primeras lineas y pone un angulo random para las lineas
      angulo  = int(map(altura.filtradoNorm(), 0, 1, 40, 120));
      esperarCambio2 = 0;
      if (esperar1<tiempoCambio) {
        esperar1 ++;
      } else {
        estado = "primeraslineas";
        esperar1 = 0;
      }
    }
    //////////////////////////////////////////////////CAMBIO DE ESTADO//////////////////////////////////////////////////
    if (estado.equals("primeraslineas") && haySonido) {
      //instrucciones de dibujo, lineas largas
      largo=int (random(50, 100));
      dir = 0;
      for (Linea l0 : linea0) {
        l0.actualizar(radians(dir), radians(angulo), largo, intensidad.filtradoNorm(), altura.filtradoNorm());
        l0.dibujarLinea();
      }
      if (esperar1<tiempoCambio) {
        esperar1 ++;
      } else {
        estado = "espera2";
        esperar1 = 0;
      }
    }
    //////////////////////////////////////////////////CAMBIO DE ESTADO//////////////////////////////////////////////////
    if (estado.equals("espera2")) {
      //espera1 cambia a primeras lineas
      angulo  = int(map(altura.filtradoNorm(), 0, 1, 0, 40));
      esperarCambio2 = 0;
      if (esperar1<tiempoCambio) {
        esperar1 ++;
      } else {
        estado = "segundaslineas";
        esperar1 = 0;
      }
    }
    //////////////////////////////////////////////////CAMBIO DE ESTADO//////////////////////////////////////////////////
    if (estado.equals("segundaslineas") && haySonido) {
      //instrucciones de dibujo, lineas largas
      largo=int (random(50, 100));
      //CAMBIAR EL ANGULO A 45
      dir = 0;
      for (Linea l1 : linea1) {
        l1.actualizar(radians(dir), radians(angulo), largo, intensidad.filtradoNorm(), altura.filtradoNorm());
        l1.dibujarLinea();
      }
      if (esperar1<tiempoCambio) {
        esperar1 ++;
      } else {
        estado = "terceralineas";
        esperar1 = 0;
      }
    }
    //////////////////////////////////////////////////CAMBIO DE ESTADO//////////////////////////////////////////////////
    if (estado.equals("terceralineas") && haySonido) {
      //instrucciones de dibujo
      largo=int (random(30, 70));
      dir = dir + 1;
      angulo = 0;
      for (Linea l2 : linea2) {
        l2.actualizar(radians(dir), radians(angulo), largo, intensidad.filtradoNorm(), altura.filtradoNorm());
        l2.dibujarLinea();
      }
      if (esperar1<tiempoCambio) {
        esperar1 ++;
      } else {
        estado = "circulos";
        esperar1 = 0;
      }
    }
    //////////////////////////////////////////////////CAMBIO DE ESTADO//////////////////////////////////////////////////
    if (estado.equals("circulos") && haySonido) {
      //
      largo=int (random(140, 200));
      dir = dir + (random(4, 7));
      angulo = 0;

      for (Linea lC0 : lineaC0) {
        lC0.actualizar(radians(dir), radians(angulo), largo, intensidad.filtradoNorm(), altura.filtradoNorm());
        lC0.dibujarLinea();
      }
      if (esperar1<tiempoCambio) {
        esperar1 ++;
      } else {
        estado = "espera2";
        esperar1 = 0;
        angulo = 0;
      }
    }
    //////////////////////////////////////////////////CAMBIO DE ESTADO//////////////////////////////////////////////////
    if (estado.equals("espera2")) {
      angulo  = int(map(altura.filtradoNorm(), 0, 1, 40, 120));
      esperarCambio2 = 0;
      if (esperar1<tiempoCambio) {
        esperar1 ++;
      } else {
        estado = "cuartaslineas";
        esperar1 = 0;
      }
    }
    //////////////////////////////////////////////////CAMBIO DE ESTADO//////////////////////////////////////////////////
    if (estado.equals("cuartaslineas") && haySonido) {
      //instrucciones de dibujo, lineas largas
      largo=int (random(10, 20));
      dir = 0;
      for (Linea l4 : linea4) {
        l4.actualizar(radians(dir), radians(angulo), largo, intensidad.filtradoNorm(), altura.filtradoNorm());
        l4.dibujarLinea();
      }
      if (esperar1<tiempoCambio) {
        esperar1 ++;
      } else {
        estado = "primeraslineasSEGUNDO";
        esperar1 = 0;
        estadoFINAL = "despuesDELprimerCICLO";
      }
    }
    //////////////////////////////////////////////////CAMBIO DE ESTADO//////////////////////////////////////////////////
    //////////////////////////////////////////////////SEGUNDO CICLO/////////////////////////////////////////////////////
    //////////////////////////////////////////////////CAMBIO DE ESTADO//////////////////////////////////////////////////
    if (estado.equals("primeraslineasSEGUNDO") && haySonido) {
      //instrucciones de dibujo, lineas largas
      largo=int (random(50, 100));
      dir = 0;
      for (Linea l5 : linea5) {
        l5.actualizar(radians(dir), radians(angulo), largo, intensidad.filtradoNorm(), altura.filtradoNorm());
        l5.dibujarLinea();
      }
      if (esperar1<tiempoCambio) {
        esperar1 ++;
      } else {
        estado = "espera2SEGUNDO";
        esperar1 = 0;
      }
    }
    //////////////////////////////////////////////////CAMBIO DE ESTADO//////////////////////////////////////////////////
    if (estado.equals("espera2SEGUNDO")) {
      //espera1 cambia a primeras lineas
      angulo  = int(map(altura.filtradoNorm(), 0, 1, 0, 40));
      esperarCambio2 = 0;
      if (esperar1<tiempoCambio) {
        esperar1 ++;
      } else {
        estado = "segundaslineasSEGUNDO";
        esperar1 = 0;
      }
    }
    //////////////////////////////////////////////////CAMBIO DE ESTADO//////////////////////////////////////////////////
    if (estado.equals("segundaslineasSEGUNDO") && haySonido) {
      //instrucciones de dibujo, lineas largas
      largo=int (random(50, 100));
      //CAMBIAR EL ANGULO A 45
      dir = 0;
      for (Linea l6 : linea6) {
        l6.actualizar(radians(dir), radians(angulo), largo, intensidad.filtradoNorm(), altura.filtradoNorm());
        l6.dibujarLinea();
      }
      if (esperar1<tiempoCambio) {
        esperar1 ++;
      } else {
        estado = "terceralineasSEGUNDO";
        esperar1 = 0;
      }
    }
    //////////////////////////////////////////////////CAMBIO DE ESTADO//////////////////////////////////////////////////
    if (estado.equals("terceralineasSEGUNDO") && haySonido) {
      //instrucciones de dibujo
      largo=int (random(30, 70));
      dir = dir + 1;
      angulo = 0;
      for (Linea l7 : linea7) {
        l7.actualizar(radians(dir), radians(angulo), largo, intensidad.filtradoNorm(), altura.filtradoNorm());
        l7.dibujarLinea();
      }
      if (esperar1<tiempoCambio) {
        esperar1 ++;
      } else {
        estado = "circulosSEGUNDO";
        esperar1 = 0;
      }
    }
    //////////////////////////////////////////////////CAMBIO DE ESTADO//////////////////////////////////////////////////
    if (estado.equals("circulosSEGUNDO") && haySonido) {
      //
      largo=int (random(140, 200));
      dir = dir + (random(4, 7));
      angulo = 0;
      for (Linea lC1 : lineaC1) {
        lC1.actualizar(radians(dir), radians(angulo), largo, intensidad.filtradoNorm(), altura.filtradoNorm());
        lC1.dibujarLinea();
      }
      if (esperar1<tiempoCambio) {
        esperar1 ++;
      } else {
        estado = "espera2SEGUNDO";
        esperar1 = 0;
        angulo = 0;
      }
    }
    //////////////////////////////////////////////////CAMBIO DE ESTADO//////////////////////////////////////////////////
    if (estado.equals("espera2SEGUNDO")) {
      angulo  = int(map(altura.filtradoNorm(), 0, 1, 40, 120));
      esperarCambio2 = 0;
      if (esperar1<tiempoCambio) {
        esperar1 ++;
      } else {
        estado = "cuartaslineasSEGUNDO";
        esperar1 = 0;
      }
    }
    //////////////////////////////////////////////////CAMBIO DE ESTADO//////////////////////////////////////////////////
    if (estado.equals("cuartaslineasSEGUNDO") && haySonido) {
      //instrucciones de dibujo, lineas largas
      largo=int (random(10, 20));
      dir = 0;
      for (Linea l8 : linea8) {
        l8.actualizar(radians(dir), radians(angulo), largo, intensidad.filtradoNorm(), altura.filtradoNorm());
        l8.dibujarLinea();
      }
      if (esperar1<tiempoCambio) {
        esperar1 ++;
      } else {
        estado = "firma";
        esperar1 = 0;
      }
    }
    //////////////////////////////////////////////////CAMBIO DE ESTADO//////////////////////////////////////////////////
    //////////////////////////////////////////////////TERCER CICLO/////////////////////////////////////////////////////
    //////////////////////////////////////////////////CAMBIO DE ESTADO//////////////////////////////////////////////////
    if (estado.equals("primeraslineasTERCER") && haySonido) {
      //instrucciones de dibujo, lineas largas
      largo=int (random(50, 100));
      dir = 0;
      for (Linea l9 : linea9) {
        l9.actualizar(radians(dir), radians(angulo), largo, intensidad.filtradoNorm(), altura.filtradoNorm());
        l9.dibujarLinea();
      }
      if (esperar1<tiempoCambio) {
        esperar1 ++;
      } else {
        estado = "espera2TERCER";
        esperar1 = 0;
      }
    }
    //////////////////////////////////////////////////CAMBIO DE ESTADO//////////////////////////////////////////////////
    if (estado.equals("espera2TERCER")) {
      //espera1 cambia a primeras lineas
      angulo  = int(map(altura.filtradoNorm(), 0, 1, 0, 40));
      esperarCambio2 = 0;
      if (esperar1<tiempoCambio) {
        esperar1 ++;
      } else {
        estado = "segundaslineasTERCER";
        esperar1 = 0;
      }
    }
    //////////////////////////////////////////////////CAMBIO DE ESTADO//////////////////////////////////////////////////
    if (estado.equals("segundaslineasTERCER") && haySonido) {
      //instrucciones de dibujo, lineas largas
      largo=int (random(50, 100));
      //CAMBIAR EL ANGULO A 45
      dir = 0;
      for (Linea l10 : linea10) {
        l10.actualizar(radians(dir), radians(angulo), largo, intensidad.filtradoNorm(), altura.filtradoNorm());
        l10.dibujarLinea();
      }
      if (esperar1<tiempoCambio) {
        esperar1 ++;
      } else {
        estado = "terceralineasTERCER";
        esperar1 = 0;
      }
    }
    //////////////////////////////////////////////////CAMBIO DE ESTADO//////////////////////////////////////////////////
    if (estado.equals("terceralineasTERCER") && haySonido) {
      //instrucciones de dibujo
      largo=int (random(30, 70));
      dir = dir + 1;
      angulo = 0;
      for (Linea l11 : linea11) {
        l11.actualizar(radians(dir), radians(angulo), largo, intensidad.filtradoNorm(), altura.filtradoNorm());
        l11.dibujarLinea();
      }
      if (esperar1<tiempoCambio) {
        esperar1 ++;
      } else {
        estado = "circulosTERCER";
        esperar1 = 0;
      }
    }
    //////////////////////////////////////////////////CAMBIO DE ESTADO//////////////////////////////////////////////////
    if (estado.equals("circulosTERCER") && haySonido) {
      //
      largo=int (random(140, 200));
      dir = dir + (random(4, 7));
      angulo = 0;
      for (Linea lC2 : lineaC2) {
        lC2.actualizar(radians(dir), radians(angulo), largo, intensidad.filtradoNorm(), altura.filtradoNorm());
        lC2.dibujarLinea();
      }
      if (esperar1<tiempoCambio) {
        esperar1 ++;
      } else {
        estado = "espera2TERCER";
        esperar1 = 0;
        angulo = 0;
      }
    }
    //////////////////////////////////////////////////CAMBIO DE ESTADO//////////////////////////////////////////////////
    if (estado.equals("espera2TERCER")) {
      angulo  = int(map(altura.filtradoNorm(), 0, 1, 40, 120));
      esperarCambio2 = 0;
      if (esperar1<tiempoCambio) {
        esperar1 ++;
      } else {
        estado = "cuartaslineasTERCER";
        esperar1 = 0;
      }
    }
    //////////////////////////////////////////////////CAMBIO DE ESTADO//////////////////////////////////////////////////
    if (estado.equals("cuartaslineasTERCER") && haySonido) {
      //instrucciones de dibujo, lineas largas
      largo=int (random(10, 20));
      dir = 0;
      for (Linea l12 : linea12) {
        l12.actualizar(radians(dir), radians(angulo), largo, intensidad.filtradoNorm(), altura.filtradoNorm());
        l12.dibujarLinea();
      }
      if (esperar1<tiempoCambio) {
        esperar1 ++;
      } else {
        estado = "firma";
        esperar1 = 0;
      }
    }
    //////////////////////////////////////////////////CAMBIO DE ESTADO//////////////////////////////////////////////////
    if (estado.equals("firma") && !haySonido) {
      //si se cumple la condicion para terminar el cuadro aparece la firma
      //esa condicion puede ser no movimiento del mouse o el silencio, por x tiempo
      //si esto no se cumple va a estado primeraslineas
      textSize(100);
      strokeWeight(30);
      fill(255, 10, 10);
      text("FIRMA", width/2, height/2);
      if (esperar1<tiempoCambio) {
        esperar1 ++;
      } else {
        esperar1 = 0;
        estado = "reiniciar";
      }
    }
    //////////////////////////////////////////////////CONTADOR GENERAL PARA TERMINAR LA OBRA/////////////////////////////
    if (estadoFINAL.equals("despuesDELprimerCICLO") && !haySonido) {
      if (esperarFINAL<tiempoFINAL) {
        esperarFINAL ++;
      } else {
        estado = "firma";
        esperarFINAL = 0;
      }
    }
    
    cambiarestado();
    
  }

  void  oscEvent (OscMessage m) {
    if (m.addrPattern().equals("/amp")) {
      amp = m.get(0).floatValue();
    } else if (m.addrPattern().equals("/pitch")) {
      pitch = m.get(0).floatValue();
    }
  }

  boolean reiniciar() {
    if (estado.equals("reiniciar")) {
      return true;
    } else {
      return false;
    }
  }

  void cambiarestado() {
    if (reiniciar()) {
      estado = "iniciar";
      estadoFINAL = "estadoFINAL";
    }
  }
}
