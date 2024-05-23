int TRAIL_LEN = 200;
float SQUARE_SIZE = 100;
ArrayList<Position> buffer = new ArrayList<Position>();
float alpha;
float X, Y;

void setup(){
  frameRate(120);
  fullScreen();
  //size(600,600);
  background(50);
  noStroke();
  for(int i = 0; i < TRAIL_LEN; i++){
    buffer.add(new Position(0,0));
  }
}

void draw(){
  background(50);
  X = mouseX;
  Y = mouseY;
  alpha = 0;
  fill(245,208,42,alpha);
  
  for(int i = TRAIL_LEN - 2; i >= 0; i--){
    buffer.set(i + 1, buffer.get(i));
  }
  buffer.set(0, new Position(X, Y));
  
  for(int i = TRAIL_LEN - 1; i >= 0; i--){
    alpha += 255/ TRAIL_LEN;
    fill(245,208 -1.97 * i,42,alpha);
    rect(buffer.get(i).X - SQUARE_SIZE/2,
         buffer.get(i).Y - SQUARE_SIZE/2,
         SQUARE_SIZE - i * SQUARE_SIZE/TRAIL_LEN,
         SQUARE_SIZE - i * SQUARE_SIZE/TRAIL_LEN);
  }
}

class Position{
  public float X, Y;
  public Position(float x, float y){
    X = x;
    Y = y;
  }
}
