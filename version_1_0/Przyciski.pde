class Przycisk_menu { 
  color c;
  float pozx;
  float pozy;
  float w;      
  float h;     

Przycisk_menu (color tempC, float xpos, float ypos, float widthB, float heightB) { 
    c = tempC;
    pozx = xpos;
    pozy = ypos;
    w = widthB;
    h = heightB;
  }

  void rysuj() {
    stroke(0);
    fill(c);
    rectMode(CENTER);
    rect(pozx,pozy,w,h,5);
  } 
    boolean MouseIsOver() {
    if (mouseX > (pozx- 12)&& mouseX < ((pozx-12)+ h) && mouseY > (pozy- 12 )&& mouseY < ((pozy-12) + w)) {
      return true;
    }
    return false;
  }
}
