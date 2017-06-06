import controlP5.*;
import java.awt.*;
ControlP5 cp5;

String input = "";
//Button but;  // the button
boolean floatingclicked = false;
boolean siblingclicked = false;
boolean subtopicclicked = false;
int click = 1;       // number of times the button is clicked
int buttonvalue;
controlP5.Button floatingb;
controlP5.Button siblingb;
controlP5.Button subtopicb;

void setup() {

  size(750,400);
  cp5 = new ControlP5(this);
      
   //creating the buttons
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
      input = e.getStringValue();
      println("accessing string: "+e.getName()+" "+input);
      if (buttonvalue == 0){
        removeMain();
      }
      if (buttonvalue == 1){
        removeSib();
      }
      if (buttonvalue == 2){
        removeSub();
      }
      createText();
    }
  }

void draw() {
  //has to draw the buttons, check for clicked buttons
  background(0);
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
    buttonvalue = val;
    createMain();
  }
  
  public void sibling(int val){
    buttonvalue = val;
    println("clicked:" + val);
    siblingclicked = true;
    createSibling();
  }
  
  public void subtopic(int val){
    buttonvalue = val;
    println("clicked:" + val);
    subtopicclicked = true;
    createSubtopic();
  }

  void createMain(){
    PFont font = createFont("arial",20);
      cp5.addTextfield("main")
       .setPosition(50,100)
       .setSize(200,40)
       .setFont(font)
       .setFocus(true)
       .setColor(color(255, 0,0))
       
       ;
  }
  
  void removeMain(){
    cp5.get("main").remove();
  }
  
  void removeSib(){
    cp5.get("sib").remove();
  }
  
  void removeSub(){
    cp5.get("sub").remove();
  }
  
  void createSibling(){
      PFont font = createFont("arial",20);
      cp5.addTextfield("sib")
       .setPosition(50,200)
       .setSize(200,40)
       .setFont(font)
       .setFocus(true)
       .setColor(color(255, 0,0))
       ;
  }
  
  void createSubtopic(){
    PFont font = createFont("arial",20);
      cp5.addTextfield("sub")
       .setPosition(150,300)
       .setSize(200,40)
       .setFont(font)
       .setFocus(true)
       .setColor(color(255, 0,0))
       ;
  }
  
  void createText(){
    PFont font = createFont("arial",20);
      cp5.addTextarea("textinput")
       .setPosition(50,100)
       .setSize(200,40)
       .setFont(font)
       .setLineHeight(14)
       .setColor(color(128))
       .setColorBackground(color(255,100))
       .setColorForeground(color(255,100))
       .setText(input)
       ;
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