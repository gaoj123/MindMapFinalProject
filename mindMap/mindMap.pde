import controlP5.*;
ControlP5 cp5;

String input = "";
void setup() {
  size(750,400);
  
  PFont font = createFont("arial",20);
  
  cp5 = new ControlP5(this);
  
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

  void draw(){
    background(0);
    
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