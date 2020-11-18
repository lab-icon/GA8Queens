class Graph{
  ArrayList<Float> avg;
  ArrayList<Float> best;
  int w, h;
  
  Graph() {
    best = new ArrayList<Float>();
    avg = new ArrayList<Float>();
    w = width-BOARD_WIDTH-1;
    h = BOARD_HEIGHT-200;
  }
  
  void update(float best, float avg) {
    this.best.add(best);
    this.avg.add(avg);
  }
  
  void plot() {
    pushMatrix();
    translate(BOARD_WIDTH, 120);
    fill(255);
    rect(0,0,w,h);
    fill(0);
    text(1, 0,12);
    text(0, 0,h);
    
    float xInc = (width-BOARD_WIDTH)/best.size();
    
    for (int i=0; i<best.size()-1; i++) {
      stroke(0,255,0);
      line(i*xInc,h-best.get(i)*h,(i+1)*xInc,h-best.get(i+1)*h);
      
      stroke(255,100,100);
      line(i*xInc,h-avg.get(i)*h,(i+1)*xInc,h-avg.get(i+1)*h);
      noStroke();
      
    }
    
    popMatrix();
  }
}
