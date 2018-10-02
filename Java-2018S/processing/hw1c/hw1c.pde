//Jingxuan Ai 2018/1/28
void  setup () {
  size(800,600);
  }
  
  void draw() {
    final int n = 8;
    float x = float(width) / n;
    float y = float(height) / n;
    for ( float i = 0; i <= width; i = i + x){
      for (float j = 0; j <= height; j = j + y){
        line (i, 0 , i , height);
        line (0, j , width, j);
      }
    }
  }