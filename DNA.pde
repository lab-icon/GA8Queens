class DNA {

  int[] genes;
  float fitness;

  //Gerar DNA aleatório.
  DNA() {
    genes = new int[N_QUEENS];
    for (int i = 0; i < genes.length; i++) {
      genes[i] = (int) Math.floor(random(1, 9));
    }

    // solução com 7 erros
    //genes = new int[]{4, 6, 7, 1, 8, 8, 7, 4};

    // solução com 0 erros
    //genes = new int[]{1, 6, 2, 5, 7, 4, 0, 3};
  }
  
  //Calcular função de fitness.
  float fitness() {
    int clashes = 0;
    //calcular os ataques em colunas e linhas
    //contar quais indices são únicos e subtrair do total de indices
    // [1,1,1,2,2,2] - [1,2] => 4 ataques
    int row_col_clashes = abs(genes.length) - countDistinct(genes);
    clashes += row_col_clashes;

    // calculando as colisões na diagonal
    for (int i = 0; i< genes.length; i++) {
      for (int j = i; j< genes.length; j++)
        if ( i != j) {
          int dx = abs(i-j);
          int dy = abs(genes[i] - genes[j]);
          if (dx == dy) {
            clashes += 1;
          }
        }
    }

    return (N_CLASHES - clashes)/(N_CLASHES*1.0);
  }

  //Crossover
  DNA crossover(DNA partner) {
    DNA child = new DNA();
    //Ponto de recombinação aletório
    //int midpoint = int(random(genes.length));

    //Ponto de recombinação no meio
    int midpoint = int(genes.length/2);

    for (int i = 0; i < genes.length; i++) {
      if (i < midpoint) child.genes[i] = genes[i];
      else              child.genes[i] = partner.genes[i];
    }
    return child;
  }

  //Mutation
  void mutate(float mutationRate) {
    for (int i = 0; i < genes.length; i++) {
      if (random(1) < mutationRate) {
        genes[i] = (char) random(32, 128);
      }
    }
  }

  String toString() {
    String text = "[";

    for (int i = 0; i < genes.length; i++) {
      text += genes[i] + ", ";
    }
    
    text+= "]";

    return text;
  }

  int countDistinct(int[] arr) 
  { 
    int res = 1; 

    // Varre o array 
    for (int i = 1; i < arr.length; i++)  
    { 
      int j = 0; 
      for (j = 0; j < i; j++) 
        if (arr[i] == arr[j]) 
          break; 

      // conta os iguais
      if (i == j) 
        res++;
    } 
    return res;
  }
}
