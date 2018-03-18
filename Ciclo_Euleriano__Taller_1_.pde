PrintWriter coordenadas_xy;
BufferedReader reader;
PrintWriter matriz_xy;
IntList posiciones_X;
IntList posiciones_Y;
String punto_X, punto_Y;
int mX, mY, n, cont, cont2 = 0, contador, state = 1, aux = 0, aux1, aux2, menu = 0, menu_aux = 0, j, x, y, col, ganar, nlineas = 0;
int [] lineasXY = new int[4];
int [][] matriz_XY = new int [50][50];
int [][] juego = new int [50][50];
class Nodos {
  //  Atributos de posición
  int x, y;
  //  CONSTRUCTOR
  Nodos(int a, int b) {
    x = a;
    y = b;
  }
  //  METODO
  void dibujo_nodo() {
    ellipse(x, y, 20, 20);
  }
}

Nodos nodo; // Clase - Objeto (Declaración de un objeto tipo "Nodo")

void setup() {
  size (600, 600);
  background(125);
  coordenadas_xy = createWriter("coordenadas.txt");
  reader = createReader("coordenadas.txt");
  matriz_xy = createWriter("matriz.txt");
  reader = createReader("matriz.txt");
  posiciones_X = new IntList();
  posiciones_Y = new IntList();
}

void draw() {
  if (menu == 0) {
    menu ();
  }
  if (menu == 1 && menu_aux == 0) {

    textSize(30);
    fill(250);
    String s10 = "Intenta recorrer cada uno de los arcos para completar la figura (Sin repetir).";
    text(s10, 20, 20, 435, 425);
    noFill();
    rect(20, 170, 560, 390);
    juego_creado();
  } else if (menu == 2) {
    fill(250);
    textSize(12);
    String s1 = "MODO CREADOR";
    text(s1, 20, 20, 435, 425);
    noFill();
    stroke(250);
    strokeWeight(2);
    rect(15, 15, 110, 26);
    textSize(17);
    String s4 = "------Presiona una tecla despues de finalizar cada paso.------";
    text(s4, 30, 565, 580, 580);
    rect(20, 170, 560, 390);
    if (state == 1) {
      textSize(20);
      String s2 = "1) Haga click para colocar cada nodo.";
      text(s2, 50, 50, 435, 425);
      noFill();
    } else if (state == 2) {
      fill(250);
      textSize(20);
      String s3 = "2) Una aquellos nodos donde exista un arco.";
      text(s3, 50, 80, 435, 425);
      fill(0);
      for (int i = 0; i < posiciones_Y.size(); i++) {
        ellipse(posiciones_X.get(i), posiciones_Y.get(i), 20, 20);
      }
    } else if (state == 3) {
      textSize(20);
      String s3 = "3) ¡LISTO! Ingrese de nuevo al juego para intentar este nivel.";
      text(s3, 50, 110, 435, 425);
    }
  }
}