
Dealer Spiebeginn = new Dealer();
ButtonHandler Button = new ButtonHandler();
boolean buttonover,restartButton,giveButton = false;
void setup(){
  size(800,800);
  //colorMode(HSB,255);
  
  Button.restart = loadImage("restart.png");
   Button.check = loadImage("check.png");
   Button.plus = loadImage("plus.png");
  
 
}

void draw(){
    
    background(unhex("427643"));
    Button.show();
    update(mouseX,mouseY);

    Spiebeginn.showDealerHand();
    
    
    Spiebeginn.Spieler.showPlayerHand();
    
    gameFinish();
    
    
  
}
void update(int x, int y) {

  if (x >= Button.x && y >= Button.y && x <= Button.x + 50 && y <= Button.y + 70 ) {
    buttonover = true;
    Button.fill = 190;
  } 
  else{
    buttonover = false;
    Button.fill = 210;
  }
  
  if (x >= Button.x2 && y >= Button.y2 && x <= Button.x2 + 50 && y <= Button.y2 + 70 ) {
    restartButton = true;
    Button.fill2 = 190;
  } 
  else{
    restartButton = false;
    Button.fill2 = 210;
  }
   if (x >= Button.x3 && y >= Button.y3 && x <= Button.x3 + 50 && y <= Button.y3 + 70 ) {
     giveButton = true;
    Button.fill3 = 190;
  } 
  else{
     giveButton = false;
    Button.fill3 = 210;
  }
}



//-------------------------------------
void mousePressed() {
  if (buttonover) {
    Spiebeginn.karteGeben();
    Button.fill = 60;
  }
  else{
    buttonover = false;
}
 if (restartButton) {
    
    restart();
    Button.fill2 = 60;
  }
  else{
    restartButton = false;
}
if (giveButton) {
    Spiebeginn.notTurn = true;
    Spiebeginn.SpielerFertig();
    Button.fill3 = 60;
  }
  else{
    Spiebeginn.notTurn = false;
}
}
//--------------------------------------

void gameFinish(){
  
  
  if(Spiebeginn.handWert > 21 || Spiebeginn.Spieler.handWert > 21){
    
    if(Spiebeginn.handWert > 21){
      fill(255);
    textSize(50);
    text("YOU WIN",(width/2)-140,height/2 + 30);
    }
    else if(Spiebeginn.Spieler.handWert > 21){
      fill(255);
    textSize(50);
    text("YOU LOSE",(width/2)-140,height/2 + 30);
    }
    
  }else if(Spiebeginn.handWert == 21 && Spiebeginn.Spieler.handWert == 21){
    Spiebeginn.notTurn = true;
      Spiebeginn.SpielerFertig();
     fill(255);
      textSize(50);
      text("DRAW",(width/2)-140,height/2 + 30);
  }
  else if(Spiebeginn.handWert == 21 || Spiebeginn.Spieler.handWert == 21){
    if(Spiebeginn.handWert == 21){
      fill(255);
      textSize(50);
      text("DEALER WINS",(width/2)-140,height/2 + 30);
    }
    if(Spiebeginn.Spieler.handWert == 21){
      Spiebeginn.notTurn = true;
      Spiebeginn.SpielerFertig();
    }
    
  }
  
}
//-----------------------------------------
void restart(){
 
  
    for(int cards = Spiebeginn.Spieler.Hand.size()-1; cards >= 0 ;cards--){
      Spiebeginn.usedDeck.Spielkarten.add(Spiebeginn.Spieler.Hand.get(cards));
      Spiebeginn.Spieler.Hand.remove(cards);
    }
    
     for(int cards = Spiebeginn.Hand.size() -1; cards >= 0;cards--){
      Spiebeginn.usedDeck.Spielkarten.add(Spiebeginn.Hand.get(cards));
      Spiebeginn.Hand.remove(cards);
    } 
    Spiebeginn.mischen();
    Spiebeginn.kartenAusteilen();
    Spiebeginn.kartenAusteilen();
}
