void mousePressed() {
  mX = mouseX;
  mY = mouseY;
  if (menu == 1) {
  } else if (menu == 2) {

    if (state == 1) {
      nodo = new Nodos(mX, mY); // objeto = constructor (Parámetros)
      nodo.dibujo_nodo();
      coordenadas_xy.println(mouseX + "," + mouseY); // Escribe las coordenadas
      posiciones_X.append(mX);
      posiciones_Y.append(mY);
      cont2 ++;
      println(cont2);
    }

    if (state == 2) {

      for (int i = 0; i < posiciones_X.size(); i++) {
        int j = 0;
        if ((mX >= posiciones_X.get(i)-10 && mX <= posiciones_X.get(i)+10) && (mY >= posiciones_Y.get(i)-10 && mY <= posiciones_Y.get(i)+10)) {
          if (aux >= 1) {
            lineasXY[0] = lineasXY[2];
            lineasXY[1] = lineasXY[3];
            aux ++;
          }
          lineasXY[2] = posiciones_X.get(i);
          lineasXY[3] = posiciones_Y.get(i);
          aux ++;
        }
      }

      if (aux >= 2) {
            line(lineasXY[0], lineasXY[1], lineasXY[2], lineasXY[3]);
      }
      for (int i = 0; i < posiciones_X.size(); i++) {
        matriz_XY[i][i] = 8;
        if ((lineasXY[0] >= posiciones_X.get(i)-10 && lineasXY[0] <= posiciones_X.get(i)+10) && (lineasXY[1] >= posiciones_Y.get(i)-10 && lineasXY[1] <= posiciones_Y.get(i)+10)) {
          printArray(lineasXY);
          print(i);
          for (int j = 0; j < posiciones_X.size(); j++) {
            if ((lineasXY[2] >= posiciones_X.get(j)-10 && lineasXY[2] <= posiciones_X.get(j)+10) && (lineasXY[3] >= posiciones_Y.get(j)-10 && lineasXY[3] <= posiciones_Y.get(j)+10)) {
              println(j);
              matriz_XY[i][j] = 1;
              matriz_XY[j][i] = 1;
            }
          }
        }
      }

      for (int i = 0; i < posiciones_X.size(); i++) {
        for (int j = 0; j < posiciones_Y.size(); j++) {
          print(matriz_XY[i][j]);
        }
        println( );
      }
    }
  }
}

void mouseClicked() {
  if (menu == 1) {
    arcos();
  }
}