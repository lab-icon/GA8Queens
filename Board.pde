class Board {
  int BLOCKX, BLOCKY;
  int size;
  Board(int boardSize) {
    BLOCKX = BOARD_WIDTH / boardSize;
    BLOCKY = BOARD_HEIGHT / boardSize;
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
        rect(i * BLOCKX, j * BLOCKY, BLOCKX, BLOCKY);
      }
    }
  }
}
