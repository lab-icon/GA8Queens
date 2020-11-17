class Queen {
  DNA dna;
  PImage queen;
  int W, H; 

  Queen() {
    queen = loadImage("queen.png");
    W = BOARD_WIDTH / BOARD_SIZE;
    H = BOARD_HEIGHT / BOARD_SIZE;
    dna = new DNA();
  }
  
  Queen(DNA dna) {
    this();
    this.dna = dna;    
  }

  void draw() {
    text("DNA: " + dna.toString(), BOARD_WIDTH+10, BOARD_HEIGHT-40);
    text("Fitness: " + dna.fitness(), BOARD_WIDTH+10, BOARD_HEIGHT-20);
    for (int i = 0; i< dna.genes.length; i++) {
      fill(255,244,26,120);
      rect(i * W, (dna.genes[i]-1) * H, W, H);
      image(queen, i * W, (dna.genes[i]-1) * H, W, H);
    }
  }
  
  float getFitness() {
    return dna.fitness();
  }
}
