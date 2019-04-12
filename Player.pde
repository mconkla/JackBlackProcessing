import java.util.ArrayList;
import java.util.List;
int breite = 110;
int hoehe = 120;
PImage image;

public class Player {

  public List<SpielKarte> Hand = new ArrayList<SpielKarte>();
  public int WERT;
  public int handWert;
  
  public Player() {
    
  }
  
  public void showPlayerHand(){
    int gap = 20;
    this.handWert = 0;
    int x = width/2 - (((this.Hand.size()) * breite + (gap * (-1 + this.Hand.size())))/2);
    for (int Index = 0; Index < this.Hand.size(); Index++) {
      this.handWert += this.Hand.get(Index).WERT;
       fill(255);
      //rect(x + Index * breite + Index * gap,height*4/5,breite,hoehe);
      image = loadImage(Hand.get(Index).img);
      image(image,(x + Index * breite + Index * gap),height*4/5,breite,hoehe);
    
    
      
     
    }
    assCheck();
  }
  
  void assCheck(){
 for(int check = 0 ; check < Hand.size(); check++ ) {
      if(Hand.get(check).NAME == "ASS") {
         if(handWert + 10 <= 21) {
           handWert +=10;
         }
       }
    } 
}

  
  
}
