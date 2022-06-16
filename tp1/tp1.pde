
import oscP5.*;

Obra obra;

void setup() {
  size(800, 600, P3D );
  obra = new Obra();
}

void draw () {
  obra.actualizar();

  if(obra.reiniciar()){
   obra = new Obra();
   }
}
