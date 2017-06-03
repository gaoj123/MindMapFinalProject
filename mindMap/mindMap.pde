import controlP5.*;
ControlP5 cp5;

String input = "";
Button but;  // the button
boolean butclicked = true;
int click = 1;       // number of times the button is clicked


void setup() {

  size(750,400);
  
  PFont font = createFont("arial",20);
  
  cp5 = new ControlP5(this);
   // create the button object
   but = new Button("Click Me", 20, 20, 100, 50);
   ButtonBar b = cp5.addButtonBar("bar")
     .setPosition(0, 0)
     .setSize(900, 20)
     ;
     /**
     .addItems(split("a b c"," "))
     ;
     println(b.getItem("a"));
  b.changeItem("a","text","floating");
  b.changeItem("b","text","sibling");
  b.changeItem("c","text","subtopic");
  **/

  cp5.addButton("floating")
    .setValue(0)
    .setPosition(0,0)
    .setSize(250,19)
    ;
  cp5.addButton("sibling")
    .setValue(1)
    .setPosition(250,0)
    .setSize(250,19)
    ;
  cp5.addButton("subtopic")
    .setValue(2)
    .setPosition(500,0)
    .setSize(250,19)
    ;

}
  
  public void controlEvent(ControlEvent e){
    println(e.getController().getName());
  }
  
  public void floating(int val){
    println("clicked:" +val);
  }
  
  public void sibling(int val){
    println("clicked:" + val);
  }
  
  public void subtopic(int val){
    println("clicked:" + val);
  }
<<<<<<< HEAD


void draw() {
  //has to draw the buttons, check for clicked buttons
    background(0);
  
  // draw the button in the window
  
  but.update();
}

// mouse button clicked



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
  void update(){
    if (MouseIsOver()){
      rect(100,400,200,100);
    }
 }
  boolean MouseIsOver() {
    if (mouseX > x && mouseX < (x + w) && mouseY > y && mouseY < (y + h)) {
      return true;
    }
    return false;
  }
}
