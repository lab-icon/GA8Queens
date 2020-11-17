class Board {
  int BLOCKX, BLOCKY;
  int size;
  Board(int boardSize) {
    BLOCKX = width / boardSize;
    BLOCKY = height / boardSize;
    size = boardSize;
  }

  void draw() {
    for (int i = 0; i < size; i ++) {
      for (int j = 0; j < size; j ++) {
        if ((i + j + 1) % 2 == 0) {
          fill(255, 255, 255); // white
        } else {
          fill(0, 0, 0); // black
        }
        rect(i * BLOCKX, j * BLOCKY, (i + 1) * BLOCKX, (j + 1) * BLOCKY);
      }
    }
  }
}
