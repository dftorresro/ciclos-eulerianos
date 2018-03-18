void menu() {
  background(125);
  textSize (42);
  fill(250);
  String s1 = "CAMINO - CICLO";
  text(s1, 120, 90, 435, 425);
  String s2 = "EULERIANO";
  text(s2, 180, 140, 435, 425); 
  if (col == 100) {
    col = 0;
  }
  col += 1;

  strokeWeight(2);
  stroke(0);
  fill(250);
  line(30, 30, 30, 570);
  line(30, 570, 570, 570);
  line(570, 570, 570, 30);
  line(570, 30, 30, 30);
  if (col < 50) {
    fill(250, 0, 0);
  } else {
    fill(0, 250, 0);
  }
  ellipse(30, 30, 20, 20);
  ellipse(30, 570, 20, 20);
  ellipse(570, 570, 20, 20);
  ellipse(570, 30, 20, 20);
  ellipse(300, 300, 190, 190);

  fill(0);
  textSize(20);
  String s3 = "Pulsa un número:";
  text(s3, 90, 410, 500, 325);
  String s5 = "1) Jugar nivel creado en (2).";
  text(s5, 90, 440, 500, 325);
  String s6 = "2) Crear nivel.";
  text(s6, 90, 470, 500, 325);
}

void arcos() {
  fill(0);
  BufferedReader reader = createReader("coordenadas.txt");
  String line = null;
  try {
    while ((line = reader.readLine()) != null) {
      String[] pieces = split(line, ',');
      int x = int(pieces[0]);
      int y = int(pieces[1]);
      fill(250);
      print (y);
    }
    reader.close();
  } 
  catch (IOException e) {
    e.printStackTrace();
  }
  if (aux2 == 0) {
    //   fill(0);
    for (int i = 0; i < posiciones_X.size(); i++) {
      if ((mouseX >= posiciones_X.get(i)-10 && mouseX <= posiciones_X.get(i)+10) && (mouseY >= posiciones_Y.get(i)-10 && mouseY <= posiciones_Y.get(i)+10)) {
        lineasXY[0] = posiciones_X.get(i);
        lineasXY[1] = posiciones_Y.get(i);
        j = i;
        aux2 ++;
      }
    }
  } else {
    strokeWeight(5);
    stroke(0, 255, 0);
    for (int i = 0; i < posiciones_X.size(); i++) {
      if ((mouseX >= posiciones_X.get(i)-10 && mouseX <= posiciones_X.get(i)+10) && (mouseY >= posiciones_Y.get(i)-10 && mouseY <= posiciones_Y.get(i)+10)) {
        lineasXY[2] = posiciones_X.get(i);
        lineasXY[3] = posiciones_Y.get(i);
        if (matriz_XY[j][i] == 1) {
          line(lineasXY[0], lineasXY[1], lineasXY[2], lineasXY[3]);
          lineasXY[0] = lineasXY[2];
          lineasXY[1] = lineasXY[3];
          juego[j][i] = 1;
          juego[i][j] = 1;
          j = i;
          contador ++;
        }
      }
    }
  }
}