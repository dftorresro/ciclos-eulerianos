void keyPressed() {
  if (menu == 0) {
    if (keyPressed == true && (key == '1')) {
      menu = 1;
      background(125);
    }
    if (keyPressed == true && (key == '2')) {
      menu = 2;
      background(125);
    }  
  } else if (menu == 1) {
    menu = 0;
  } else if (menu == 2) {

    if (state == 3) {
      for (int i = 0; i < posiciones_X.size(); i++) {
        for (int j = 0; j < posiciones_Y.size(); j++) {
          matriz_xy.print(matriz_XY[i][j]);
        }
        matriz_xy.println( );
      }
      matriz_xy.flush(); 
      matriz_xy.close();
      menu = 0;
    }

    if (state == 2) {
      state ++;
    }

    if (state == 1) {
      coordenadas_xy.flush(); 
      coordenadas_xy.close(); 
      state ++;
    }
  }
}