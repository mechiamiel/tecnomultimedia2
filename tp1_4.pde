//tp1 dibujar con la voz
import oscP5.*;

Obra obra;


void setup() {
  size (800, 800);
  obra = new Obra();
}

void draw () {
  obra.actulizar();
  if(obra.reiniciar()){
    background(200,20,20);
    obra.actulizar();
  }
}
