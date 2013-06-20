/*-------------------------------------------------
||  Draws reactangles in the viewport. Row&COLUMNS determined in constructor
||  Tiles will saturate when hovered over, fade to grey otherwise
||  TODO: When rectangle 
--------------------------------------------------*/

ArrayList rects;
int COLUMNS;
int ROWS; 
int panelCount;

void setup(){
  
  //SET VARIABLES-------------------
  size(500, 500);
  frameRate(24);
  ROWS = 2;
  COLUMNS = 4; 
  panelCount = ROWS*COLUMNS; 
  rects = new ArrayList();
  //END VARIABLES-------------------
  
  float X_seperation = width/COLUMNS;
  float Y_seperation = height/ ROWS; 
  
  if (frameCount % 10 == 0) //fade them in
    for (int i = 0; i < ROWS ; i++)
      for (int j = 0; j < COLUMNS; j++)
        rects.add (new shapeGen( j * X_seperation , i * Y_seperation,
                                      X_seperation, Y_seperation));
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

void mousePressed() {
  // mouseEvent variable contains the current event information
  if (mouseButton == RIGHT)
  {
    for (int i = 0; i < rects.size(); i++) 
    {
       shapeGen s  = (shapeGen) rects.get(i); 
       if (s.hasPointer()){
          this.splitPanels(s);
          rects.remove(i);
        }
    }
  }
}

void splitPanels(shapeGen originalPanel){
  shapeGen panelDaughter1; 
  shapeGen panelDaughter2;

  float origWidth = originalPanel.getWidth();
  float origHeight = originalPanel.getHeight();
  float xposition = originalPanel.getXpos();
  float yposition = originalPanel.getYpos();

 }

