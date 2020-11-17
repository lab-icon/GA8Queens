final int N_QUEENS = 8;
final int N_SOLUTIONS = 92;
final int N_CLASHES = 28;

Board b;

void setup() {
  size (400,400);
  b = new Board();
  noLoop();
}


void draw() {
  b.draw();
}
