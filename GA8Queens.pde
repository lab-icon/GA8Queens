final int N_QUEENS = 8;
final int N_SOLUTIONS = 92;
final int N_CLASHES = 28;
final int BOARD_SIZE = 8;
final int BOARD_WIDTH = 400;
final int BOARD_HEIGHT = 400;

Board b;
Queen q;

void setup() {
  size (800,400);
  b = new Board(BOARD_SIZE);
  q = new Queen(BOARD_SIZE);
  noLoop();
}


void draw() {
  background(125);
  b.draw();
  q.draw();
  println(q.dna.fitness());
}
