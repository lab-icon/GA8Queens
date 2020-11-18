final int N_QUEENS = 8;
final int N_SOLUTIONS = 92;
final int N_CLASHES = 28;
final int BOARD_SIZE = 8;
final int BOARD_WIDTH = 400;
final int BOARD_HEIGHT = 400;

final int POP_SIZE = 128;
final float MUTATION_RATE = 0.05;

Board b;
Queen q;
Population p;
Graph g;

void setup() {
  size (displayWidth, 400, P2D);
  b = new Board(BOARD_SIZE);
  q = new Queen();
  p = new Population(POP_SIZE, MUTATION_RATE);
  g = new Graph();
  //noLoop();
}


void draw() {
  background(125);
  b.draw();

  //p.solutions.get(0).draw();
  //p.createSelectionPool();

  //int p1 = int(random(p.selectionPool.size()));
  //int p2 = int(random(p.selectionPool.size()));
  
  //Queen parent1 = p.selectionPool.get(p1);
  //Queen parent2 = p.selectionPool.get(p2);

  //println("Pai A: " + parent1.dna.toString());
  //println("Pai B: " + parent2.dna.toString());
  
  //DNA child = parent1.dna.crossover(parent2.dna);
  //println("Filho: "+ child.toString());
  
  //child.mutate(0.1);
  //println("Filho: "+ child.toString());
  


  p.run();
  g.update(p.getBestFitness(),p.getAverageFitness());
  g.plot();
    p.draw();
  if (p.getBestFitness()==1) {
    println(p.getBestSolution().dna.toString());
    noLoop();
  }
}
