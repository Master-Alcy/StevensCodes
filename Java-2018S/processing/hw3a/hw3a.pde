void  setup () {
  size(800,600);
  }
  
  void draw() {   
    for (int x = 0; x < width ; x += 75) {         //x += 75
      for (int y = 0; y<height ; y+=75){        
        line ( x , 0 , 0 , y);
      }
    }
  }