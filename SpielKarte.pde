public class SpielKarte {

  public int WERT;
  public String FARBE;
  public String NAME;
  public String img;
  
  public int NUMMER;
  
  
  public SpielKarte(int NUMMER) {
    this.NUMMER = NUMMER +1;
    calcWert(this.NUMMER);
    calcFarbe(this.NUMMER);
    img = Integer.toString(NUMMER+1) + ".png";
    
    
  }
  
  public void calcWert(int Spielkarte) {
    int value = 0;
    for(int Zahl = 1;Zahl <=10;Zahl++) {
      int pruefung = (Spielkarte - Zahl);
      if(Spielkarte == Zahl ||  pruefung % 13 == 0 && pruefung > 0) {
        calcName(Zahl);
        value += Zahl;
      }
    }
    
    for(int Bild = 11;Bild <=13;Bild++) {
      int pruefung = (Spielkarte - Bild);
      if(Spielkarte == Bild && Bild > 10||  pruefung % 13 == 0 && pruefung > 0) {
        calcName(Bild);
        value += 10;
      }
    }
  this.WERT = value;
    
  }
  
  public void calcFarbe(int Spielkarte) {
    if(Spielkarte <= 13) {
      this.FARBE = "HERZ";
    }else if(Spielkarte <=26) {
      this.FARBE = "KARO";
    }else if(Spielkarte <= 39) {
      this.FARBE = "PICK";
    }else if(Spielkarte <= 52) {
      this.FARBE = "KREUZ";
    }
  }
  
  public void calcName(int WERT) {
    if(WERT == 1) {
      this.NAME = "ASS";
    }else if(WERT == 11) {
      this.NAME = "BUBE";
    }else if(WERT == 12) {
      this.NAME = "DAME";
    }else if(WERT == 13) {
      this.NAME = "KOENIG";
    }else {
      this.NAME = Integer.toString(WERT);
    }
  }
  
  
  
}
