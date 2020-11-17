final int N_QUEENS = 8;
final int N_SOLUTIONS = 92;
final int N_CLASHES = 28;
final int BOARD_SIZE = 8;
final int BOARD_WIDTH = 400;
final int BOARD_HEIGHT = 400;

Board b;
Queen q;
Population p;

void setup() {
  size (1200,400);
  b = new Board(BOARD_SIZE);
  q = new Queen();
  p = new Population(20, 0.01);
}


void draw() {
  background(125);
  b.draw();
  p.draw();
  p.run();
}
