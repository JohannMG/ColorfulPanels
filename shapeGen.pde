/*--------------------------  
||Draws a Square tile. Tile saturates when mouse is over and fade to grey once it leaves --currently at a LOG rate. 
||HSB color mode used. 
||
-----------------------------*/ 

class shapeGen { 
  float ypos;
  float xpos;
  float xwidth;
  float ywidth;
  
  float H; //0-360
  float S; //0-100
  float B; //0-11
  
  //Constructoe method
  shapeGen(float xpos, float ypos, float xwidth, float ywidth){
    colorMode(HSB, 360, 100, 100);  //Set to HSB

    //Take input position and widths
    this.xpos = xpos; 
    this.ypos = ypos;
    this.xwidth = xwidth;
    this.ywidth = ywidth;
    
    H = random(0, 255);  //random gives float or int?
    S = 70;    //Set saturation high so it Fades to s=0 at initialization
    B = 80.0f;  //chosen becuase it's a nice number
    
    
  }
  
  void update(){

    if (S < .1)
      S-= log( random(200));    //fades saturation to 0 at a random log rate
    
    //MOUSE CLICK
    if (mouseX > xpos && mouseX < xpos + xwidth   &&
        mouseY > ypos && mouseY < ypos + ywidth) {    //If mouse in rectangle
        if  (mousePressed)    //If mouse pressed
          H = (H + random(10, 340)) % 360;    //cycle colors randomly on mousepress
          
        S = 95;  //push Saturation back up
   }
   ////////End mouse IF

  
 }
 
 //quick boolean function to check if cursor is over tile
 public boolean hasPointer(){
   return ( mouseX > xpos && mouseX < xpos + xwidth   &&
           mouseY > ypos && mouseY < ypos + ywidth);
 }
  
  void draw(){
    //MAIN rectangle draw
    fill(H,S,B,250);  //H,S,B,alpha
    //noStroke();
    stroke(40, 100);  //B=40    100 = alpha
    rect(xpos,ypos, xwidth, ywidth); 
    
    this.update();    //update AFTER draw
  }
    
 float getWidth(){
   return this.ywidth;
 }
 float getHeight(){
   return this.xwidth;
 }
 float getXpos(){
   return this.xpos;
 }
 float getYpos(){
   return this.ypos;
 }
 
  
    
}

