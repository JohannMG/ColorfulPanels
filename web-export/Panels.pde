ArrayList rects;
int columns;
int rows;
int panelCount;


void setup(){
  
  size(500, 500);
  frameRate(24);
  rows = 22;
  columns = 4; 
  panelCount = rows*columns; 
  rects = new ArrayList();
  
  float X_seperation = width/columns;
  float Y_seperation = height / rows; 
  
  if (frameCount % 10 == 0){ //fade them in
    for (int i = 0; i < rows ; i++){
      for (int j = 0; j < columns; j++){
        rects.add (new shapeGen( j * X_seperation , i * Y_seperation,
                                 X_seperation, Y_seperation));
                                 
        
      }
    }
  }
  
}


void draw(){
  background (255);
  for (int i = 0; i < rects.size(); i++) {
     shapeGen s  = (shapeGen) rects.get(i); 
     s.draw();
  }
  
}


void update(){
  
}
class shapeGen { 
  float ypos;
  float xpos;
  float xwidth;
  float ywidth;
  
  float H; //0-360
  float S; //0-100
  float B; //0-11
  
  
  shapeGen(float xpos, float ypos, float xwidth, float ywidth){
    colorMode(HSB, 360, 100, 100);
    this.xpos = xpos; 
    this.ypos = ypos;
    this.xwidth = xwidth;
    this.ywidth = ywidth;
    
    H = random(0, 255);  //random gives float or int?
    //S = random (05, 90);
    S = 70;
    B = 80.0f;
    
    
  }
  
  void update(){
    S-= log( random(200));
    
    if (mouseX > xpos && mouseX < xpos + xwidth   &&
        mouseY > ypos && mouseY < ypos + ywidth) {
        if  (mousePressed)
          H = (H + random(10, 340)) % 360;
          
        S = 95;  
   }////////End mouse IF

  
 }
 
 boolean hasPointer(){
   return ( mouseX > xpos && mouseX < xpos + xwidth   &&
           mouseY > ypos && mouseY < ypos + ywidth);
 }
  
  void draw(){
    fill(H,S,B,250);
    //noStroke();
    stroke(40, 100);
    rect(xpos,ypos, xwidth, ywidth);
    
    this.update();
  }
    
 float getWidth(){
   return this.ywidth;
 }
 float getHieght(){
   return this.xwidth;
 }
 float getXpos(){
   return this.xpos;
 }
 float getYpos(){
   return this.ypos;
 }
 
  
    
}


