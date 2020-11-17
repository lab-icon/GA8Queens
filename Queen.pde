class Queen {
  DNA dna;
  PImage queen;
  int W, H; 

  Queen(int boardSize) {
    queen = loadImage("queen.png");
    W = width / boardSize;
    H = height / boardSize;
    dna = new DNA();
  }


  void draw() {
    for (int i = 0; i< dna.genes.length; i++) {
      fill(120);
      rect(i * W, dna.genes[i] * H, W, H);
      image(queen, i * W, dna.genes[i] * H, W, H);
    }
  }
}
