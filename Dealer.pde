import java.util.ArrayList;
import java.util.List;

PImage imageDealer;
PImage backDealer;

boolean noTurn = true;


public class Dealer {
  
  
  KartenDeck usedDeck = new KartenDeck();
  Player Spieler = new Player();
  
  public boolean notTurn = false;
  public int handWert;
  public List<SpielKarte> Hand = new ArrayList<SpielKarte>();
  public int breite = 110;
  public int hoehe = 120;
  
  public Dealer() {
    mischen();
    kartenAusteilen();
    kartenAusteilen();
  }
  
  public void mischen() { // Vertauscht 100 mal zwei Stellen im Array
    for (int mischen = 0; mischen < 1000; mischen++) {
      einmalmisch();
    }
    
  }
  

  private void einmalmisch() { // Vertauscht zwei Stellen im Array
    int firstRandom = randomizer();
    int secondRandom = randomizer();

    SpielKarte safe = usedDeck.Spielkarten.get(firstRandom);
    usedDeck.Spielkarten.set(firstRandom,usedDeck.Spielkarten.get(secondRandom));
    usedDeck.Spielkarten.set(secondRandom,safe);
  }

  private int randomizer() { // generiert eine Karten an der Stelle zwischen 1 und 52
    int random = (int) (Math.random() * 100);
    if (random > 51) {
      return random - 51;
    } else {
      return random;
    }
  }
  
  public void kartenAusteilen() {
      
    int topCard = usedDeck.Spielkarten.size()-1;
    int secondCard = usedDeck.Spielkarten.size()-2;
    
    Spieler.Hand.add(usedDeck.Spielkarten.get(topCard));//Spieler kriegt oberste Karte
    usedDeck.Spielkarten.remove(topCard);
    

    this.Hand.add(usedDeck.Spielkarten.get(secondCard));//Spieler kriegt oberste Karte
    usedDeck.Spielkarten.remove(secondCard);
    
  }
  
  public void karteGeben() {
    int topCard = usedDeck.Spielkarten.size()-1;
    Spieler.Hand.add(usedDeck.Spielkarten.get(topCard));//Spieler kriegt oberste Karte
    usedDeck.Spielkarten.remove(topCard);
    //TODO einzelne Karten ausgeben
  }
  
  public void showDealerHand() {
    int gap = 20;
    this.handWert = 0;
    int x = width/2 - (((this.Hand.size()) * breite + (gap * (-1 + this.Hand.size())))/2);
    for (int Index = 0; Index < this.Hand.size(); Index++) {
      this.handWert += this.Hand.get(Index).WERT;
      imageDealer = loadImage(Hand.get(Index).img);
      backDealer = loadImage("back.jpg");
      
      
      fill(255);
      image(imageDealer,(x + Index * breite + Index * gap),height*1/5,breite,hoehe);
      if(Index == 1 && !notTurn){
        noTurn = true;
      }
      else{
        noTurn = false;
      }
      if(noTurn){
        image(backDealer,(x + Index * breite + Index * gap),height*1/5,breite,hoehe);
      }
      //rect(width/2,10,1,400);
      
      
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

void SpielerFertig(){
  noTurn = false;
  while(handWert <= 16){
    int topCard = (usedDeck.Spielkarten.size()-1);
    print(topCard);
    Hand.add(usedDeck.Spielkarten.get(topCard));//Spieler kriegt oberste Karte
    usedDeck.Spielkarten.remove(topCard);
    showDealerHand();
    }
}

  
}
