class ButtonHandler{
  float x = 700;
  float y = 400;
  float x2 = 700;
  float y2 = 500;
  
  float x3 = 700;
  float y3 = 600;
  
  float fill = 210;
  float fill2 = 210;
  float fill3 = 210;
  PImage restart,check,plus;
  ButtonHandler(){
    
  }
 void show(){
   
   
   fill(fill,70);
   image(plus,x,y,50,70);
   rect(x,y,50,70);
  
    fill(fill2,70);
    image(restart,x2,y2,50,70);
    rect(x2,y2,50,70);
    
    fill(fill3,70);
    image(check,x3,y3,50,70);
    rect(x3,y3,50,70);
  
   
   
 }
  
}
