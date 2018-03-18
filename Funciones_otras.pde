void juego_creado() {
  dibujar_arcos();
  dibujar_nodos();
  num_lineas();
  ganar();
}

void dibujar_nodos() {
  fill(0);
  strokeWeight(2);
  stroke(250);
  for (int i = 0; i < posiciones_X.size(); i++) {
    ellipse(posiciones_X.get(i), posiciones_Y.get(i), 20, 20);
  }
}

void num_lineas() {
  nlineas = 0;
  for (int i = 0; i < posiciones_X.size(); i++) { 
    for (int j = 0; j < posiciones_Y.size(); j++) {
      if (matriz_XY[i][j] == 1) {
        nlineas += 1;
      }
    }
  }
  nlineas /= 2;
  print(nlineas);
}

void dibujar_arcos() {
  strokeWeight(2);
  stroke(250);
  for (int i = 0; i < posiciones_X.size(); i++) {
    for (int j = 0; j < posiciones_Y.size(); j++) {
      if (matriz_XY[i][j] == 1) {
        line(posiciones_X.get(i), posiciones_Y.get(i), posiciones_X.get(j), posiciones_Y.get(j));
      }
    }
  }
}

void ganar() {
  if (contador == nlineas) {
    for (int i = 0; i < posiciones_X.size(); i++) {
      for (int j = 0; j <posiciones_Y.size(); j++) {
        if (juego[i][j] != 1) {
          juego[i][j] = 0;
        }
      }
    }
    for (int i = 0; i < posiciones_X.size(); i++) {
      juego[i][i] = matriz_XY[i][i];
      for (int j = 0; j < posiciones_Y.size(); j++) {
        if (juego[i][j] != matriz_XY[i][j]) {
          ganar = 1;
        }
      }
    }
  }
  if ((contador == nlineas) && (ganar == 0)) {
    background(125);
    fill(0);
    noStroke();
    rect(0, 200, 600, 200);
    delay(200); 
    fill(255);
    textSize(100);
    String s1 = "¡GANASTE!";
    text(s1, 40, 240, 550, 550);
    aux2 = 0;
    contador = 0;
    ganar = 0;
    for (int i = 0; i < posiciones_X.size(); i++) {
      for (int j = 0; j < posiciones_Y.size(); j++) {
        juego[i][j] = 0;
      }
    }
    menu_aux ++;
  }
  if ((contador == nlineas) && (ganar == 1)) {
    background(125);
    fill(0);
    noStroke();
    rect(0, 200, 600, 200);
    delay(200);
    fill(255);
    textSize(100);
    String s1 = "PERDISTE :(";
    text(s1, 40, 240, 550, 550);
    aux2 = 0;
    contador = 0;
    ganar = 0;
    for (int i = 0; i < posiciones_X.size(); i++) {
      for (int j = 0; j < posiciones_Y.size(); j++) {
        juego[i][j] = 0;
      }
    }
    menu_aux ++;
  }
}