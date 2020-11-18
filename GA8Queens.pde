//ALTERE OS VALORES AQUI:
//Tamanho da população:
final int POP_SIZE = 10;
//Taxa de Mutação:
final float MUTATION_RATE = 0.00;
//Tipo de Crossover (1 = aleatório, 2 = 50/50);
final int CROSSOVER = 1;


final int N_QUEENS = 8;
final int N_SOLUTIONS = 92;
final int N_CLASHES = 28;
final int BOARD_SIZE = 8;
final int BOARD_WIDTH = 400;
final int BOARD_HEIGHT = 400;

Board b;
Queen q;
Population p;
Graph g;

void setup() {
  size (800, 400, P2D);
  b = new Board(BOARD_SIZE);
  q = new Queen();
  p = new Population(POP_SIZE, MUTATION_RATE);
  g = new Graph();
  //noLoop();
}


void draw() {
  background(125);
  b.draw();
  p.run();
  g.update(p.getBestFitness(),p.getAverageFitness());
  g.plot();
    p.draw();
  if (p.getBestFitness()==1) {
    println(p.getBestSolution().dna.toString());
    noLoop();
  }
}
