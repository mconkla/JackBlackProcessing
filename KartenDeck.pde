import java.util.ArrayList;
import java.util.List;



public class KartenDeck {

  public final int anzahlSpielkarten = 52; // Nicht veränderbare Anzahler Spielkarten für Blackjack

  // --------------
  //SpielKarte [] Spielkarten = new SpielKarte[anzahlSpielkarten]; // Array mit 52 Platzhaltern
  List<SpielKarte> Spielkarten = new ArrayList<SpielKarte>();
  
  
  // --------------

  public KartenDeck() {
    for (int Index = 0; Index < anzahlSpielkarten; Index++) {
      Spielkarten.add(new SpielKarte(Index));
    }
  }

  
  public void showDeck() {
    for (int Index = 0; Index < Spielkarten.size(); Index++) {
      System.out.printf("\n%s : %s\n",Spielkarten.get(Index).FARBE,Spielkarten.get(Index).NAME);
    }
  }
  
  


}
