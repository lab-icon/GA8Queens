final int N_QUEENS = 8;
final int N_SOLUTIONS = 92;
final int N_CLASHES = 28;
final int BOARD_SIZE = 8;

Board b;
Queen q;

void setup() {
  size (400,400);
  b = new Board(BOARD_SIZE);
  q = new Queen(BOARD_SIZE);
  noLoop();
}


void draw() {
  b.draw();
  q.draw();
}
