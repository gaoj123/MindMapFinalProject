import controlP5.*;
import java.awt.*;
ControlP5 cp5;

String input = "";
//Button but;  // the button
boolean floatingclicked = false;
boolean siblingclicked = false;
boolean subtopicclicked = false;
int click = 1;       // number of times the button is clicked

controlP5.Button floatingb;
controlP5.Button siblingb;
controlP5.Button subtopicb;

TextField text = new TextField("main",16);


void setup() {

  size(750,400);
  
  PFont font = createFont("arial",20);
  
  cp5 = new ControlP5(this);
 
  cp5.addTextfield("input")
       .setPosition(20,100)
       .setSize(200,40)
       .setFont(font)
       .setFocus(true)
       .setColor(color(255, 0,0))
       ;
      
   // create the button object
   /**
   but = new Button("Click Me", 20, 20, 100, 50);
   ButtonBar b = cp5.addButtonBar("bar")
     .setPosition(0, 0)
     .setSize(900, 20)
     ;
     **/

  floatingb = cp5.addButton("floating")
    .setBroadcast(false)
    .setValue(0)
    .setPosition(0,0)
    .setSize(250,19)
    ;
  siblingb = cp5.addButton("sibling")
    .setBroadcast(false)
    .setValue(1)
    .setPosition(250,0)
    .setSize(250,19)
    ;
  subtopicb = cp5.addButton("subtopic")
    .setBroadcast(false)
    .setValue(2)
    .setPosition(500,0)
    .setSize(250,19)
    ;

}
  
  public void controlEvent(ControlEvent e){
    println(e.getController().getName());
    if(e.isAssignableFrom(Textfield.class)){
      println("accessing string: "+e.getName()+" "+e.getStringValue());
      input = e.getStringValue();
    }
  }

void draw() {
  //has to draw the buttons, check for clicked buttons
  background(0);
     PFont font = createFont("arial",20);
    if (floatingclicked == true){
      println("floating was clicked");
      //will trigger a method that draws the stuff probably
      rect(100,90,180,90);
      text(input,100,90);
    }
    if(siblingclicked == true){
      rect(20, 90, 80, 90);
      floatingclicked = false;
    }
    if(subtopicclicked == true){
      rect(40,100, 90, 100);
    }
    
    floatingb.setBroadcast(true);
    siblingb.setBroadcast(true);
    subtopicb.setBroadcast(true);
  // draw the button in the window
 
}

  void mousePressed(){

  }
    

// mouse button clicked
  public void floating(int val){
    println("clicked:" +val);
    floatingclicked = true;
  }
  
  public void sibling(int val){
    println("clicked:" + val);
    siblingclicked = true;
  }
  
  public void subtopic(int val){
    println("clicked:" + val);
    subtopicclicked = true;
  }

// the Button class
class Button {
  String label; // button label
  float x;      // top left corner x position
  float y;      // top left corner y position
  float w;      // width of button
  float h;      // height of button
  
  // constructor
  Button(String labelB, float xpos, float ypos, float widthB, float heightB) {
    label = labelB;
    x = xpos;
    y = ypos;
    w = widthB;
    h = heightB;
  }
  
  void Draw() {
    fill(218);
    stroke(141);
    rect(x, y, w, h, 10);
    textAlign(CENTER, CENTER);
    fill(0);
    text(label, x + (w / 2), y + (h / 2));
  }
  
  boolean MouseIsOver() {
    if (mouseX > x && mouseX < (x + w) && mouseY > y && mouseY < (y + h)) {
      return true;
    }
    return false;
  }
}