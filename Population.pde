class Population {
  int generation;
  int size;
  ArrayList<Queen> solutions; 
  ArrayList<Queen> selectionPool;
  float maxAllTime = 0;
  
  float mRate;
  
  Population(int size, float mRate) {
    this.size = size;
    this.mRate = mRate;
    this.generation = 0;

    solutions = new ArrayList<Queen>();
    for (int i=0; i< size; i++) {
      solutions.add(new Queen());
    }

    selectionPool = new ArrayList<Queen>();
  }

  void run() {
    createSelectionPool();
    reproduction();
  }

  void createSelectionPool() {
    selectionPool.clear();
    float bestFitness = getBestFitness();
    
    for (int i=0; i<solutions.size(); i++) {
      
      float fitness = solutions.get(i).getFitness();
      int qtd = (int) (fitness *100);
      for (int j=0; j<qtd; j++) {
        selectionPool.add(solutions.get(i));
      }
    }
  }
  
  void reproduction() {
    solutions.clear();
    for (int i =0; i<size; i++) {
      int p1 = int(random(selectionPool.size()));
      int p2 = int(random(selectionPool.size()));

      Queen parent1 = selectionPool.get(p1);
      Queen parent2 = selectionPool.get(p2);

      DNA child = parent1.dna.crossover(parent2.dna);
      child.mutate(mRate);
      solutions.add(new Queen(child));
    }
    generation++;
  }

  float getBestFitness() {
    float best = 0;

    for (Queen q : solutions) {
      best = q.getFitness()>best?q.getFitness():best;
    }
    
    maxAllTime = best>maxAllTime?best:maxAllTime;
    return best;
  }

  float getAverageFitness() {
    float average = 0;

    for (Queen q : solutions) {
      average+= q.getFitness();
    }
    return average/solutions.size();
  }
  
  Queen getBestSolution() {
    float best = 0;
    int bestPos = 0;

    for (int i=0; i< solutions.size(); i++) {
      float fitness = solutions.get(i).getFitness();
      if (fitness>best) {
        best = fitness;
        bestPos = i;
      }
    }
    return solutions.get(bestPos);
  }

  void draw() {
    text("MAX GERAL: " + maxAllTime, BOARD_WIDTH+10, 20);
    text("GEN: " + generation, BOARD_WIDTH+10, 60);
    text("MAX: " + getBestFitness(), BOARD_WIDTH+10, 80);
    text("AVG: " + getAverageFitness(), BOARD_WIDTH+10, 100);
    getBestSolution().draw();
  }
}
