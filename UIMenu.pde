class UIMenu {
  boolean state;
  PVector[] buttonPositions;
  String[] commonNamesLines = loadStrings("data/commonNames.txt");
  String[] IUPACNamesLines = loadStrings("data/IUPACNames.txt");
  String[] IUPACNamesDisplayLines = loadStrings("data/IUPACNamesDisplay.txt");
  int marginWidth = width / 40;
  int marginHeight = (height * 9 / 10) / 30;
  int rectWidth = width / 5;
  int rectHeight = (height * 9 / 10) * 8 / 30;

  UIMenu() {
    this.state = false;
    this.buttonPositions = new PVector[12];

    int index = 0;
    for (int i = 0; i < 4; i++) {
      for (int j = 0; j < 3; j++) {
        this.buttonPositions[index] = new PVector(i * width / 4, j * (height * 9 / 10) / 3 + (height / 10));
        index++;
      }
    }
  }

  void draw() {
    background(#FFFFFF);
    for (int i = 0; i < this.buttonPositions.length; i++) {
      fill(#FFFFFF);
      stroke(#1A1A1A);

      float x = this.buttonPositions[i].x + marginWidth;
      float y = this.buttonPositions[i].y + marginHeight;
      rect(x, y, this.rectWidth, this.rectHeight);
      
      IUPACNamesDisplayLines[i] = IUPACNamesDisplayLines[i].replace("\\n", "\n");

      fill(#666666);
      textSize(15);

      String commonName = commonNamesLines[i];
      if (commonName.equals(" ")) {
        float xIUPACName = x + this.rectWidth / 2;
        float yIUPACName = y + this.rectHeight * 2 / 4;
        text(IUPACNamesDisplayLines[i], xIUPACName, yIUPACName);
      }
      else {
        float xCommonName = x + this.rectWidth / 2;
        float yCommonName = y + this.rectHeight / 3;
        text(commonName, xCommonName, yCommonName);
        float xIUPACName = x + this.rectWidth / 2;
        float yIUPACName = y + this.rectHeight * 2 / 3;
        text("(" + IUPACNamesDisplayLines[i] + ")", xIUPACName, yIUPACName);
      }
    }
  }
}