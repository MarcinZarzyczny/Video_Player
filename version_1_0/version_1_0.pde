import peasy.*;
import processing.video.*;

Movie myMovie;

Przycisk_menu play;
Przycisk_menu stop;
Przycisk_menu pauza;



color tlo = color(102, 123, 1);
color tlo1 = color(1, 1, 1);
color tlo2 = color(255, 255, 255);


//zmienne do zippera
float x;
float pozE = 420;
float z1 = 15;
float rp= 15;
//Obsługa filmu 
float milisekundy = 0;
float sekundy = 0;
float strokeW = 2 ;
float zm= 0;
boolean pauze = false;
boolean stop1= false;

void setup() {
  size(600,480); 
  background(tlo);
  
  play = new Przycisk_menu(color(tlo2), 20, 460, 25, 25);
  pauza = new Przycisk_menu(color(tlo2), 50, 460, 25, 25);
  stop = new Przycisk_menu(color(tlo2), 80, 460, 25, 25);

  
  frameRate(30);
  myMovie = new Movie(this, "mm.mov");
  myMovie.loop ();

}

void draw() {  
  
  image(myMovie, 0, 0); 
 
  milisekundy = myMovie.time();
  print("!!!!!!!!!!"+  milisekundy + "!!!!!!!!!!");
  if(z1 > 600){
    zm= 0;
    z1 = 0;
  }else if (pauze == false && stop1== false){
  zm +=0.03336667;
  z1 +=1;
  }
  
  print("to z1 z latki "+ z1+ ". ");
        if (mouseY > 400) {             
            rysuj_zi ();
            pauza.rysuj();
            play.rysuj();
            stop.rysuj();
            fill(tlo1);
            triangle(12, 470, 30, 460, 12, 450);
            fill(tlo1);
            triangle(40, 470, 50, 460, 40, 450);
            rect(55, 460, 8, 18);
            rect(74, 460, 8, 18);
            rect(84, 460, 8, 18);
         }
 
  String sd = nf(milisekundy, 2, 2);
  char c1 = sd.charAt(0);
  char c2 = sd.charAt(1);
  char c3 = sd.charAt(3);
  char c4 = sd.charAt(4);
  
  sekundy = myMovie.duration();  
 
  fill(255, 255, 255);
  text( "/   "+c1+c2+":"+c3+c4, 540, 13);
  text (sekundy+" ", 490, 13);
  
}
//funkcja rysująca oraz obsługi zippera 
void rysuj_zi (){
  noStroke();
  rectMode(CENTER);
  fill(tlo1, 100);
  rect(300,440,600,80);
  stroke(255);
  fill(8);
  rectMode(CENTER);
  rect(300, pozE, 600, 10);
  if (mouseY > 410 && mouseY < 430  && pauze == false){
    fill(1);
    rectMode(CENTER);
    rect(mouseX, pozE, 20, 25,5);
    x= mouseX;
    print(x);
    print("to z1 "+ z1+ ". ");
    print("to z2 "+ pozE+ ". ");     
  }else{
    fill(1);
    rectMode(CENTER);
    rect(z1, pozE, 25, 25,5); 
  }
}
void mouseClicked() {
  if (mouseX> 1 && mouseX < 600 && mouseY > 410 && mouseY < 430){
    rp = mouseX;
    z1= rp;
    strokeW= rp;
    print("to click "+ z1+ ". ");
    myMovie.jump(strokeW/(myMovie.duration()));
  }else {
    //z1 = myMovie.time ()/100; 
  }
}
void movieEvent(Movie myMovie) {  
  myMovie.read();
}
void mousePressed(){
 if (pauza.MouseIsOver()) {
      print("Clicked: pauza");
      myMovie.pause();
      pauze= true;
 }   
 if (play.MouseIsOver()) {
      print("Clicked: play ");
      myMovie.play();
      pauze= false;
 }
  if (stop.MouseIsOver()) {
      print("Clicked: play ");
     stop1= true; 
     myMovie.stop(); 
     zm= 0;
     z1 = 0;
 }
}
    
