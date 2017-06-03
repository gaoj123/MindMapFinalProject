import controlP5.*;
ControlP5 cp5;

String input = "";
void setup() {
  size(700,400);
  PFont font = createFont("arial",20);
  cp5 = new ControlP5(this);
   ButtonBar b = cp5.addButtonBar("bar")
     .setPosition(0, 0)
     .setSize(700, 20)
     .addItems(split("Floating topic,Subtopic",","))
     ;
    println(b.getItem("Floating topic"));

  b.onMove(new CallbackListener(){
    public void controlEvent(CallbackEvent ev) {
      ButtonBar bar = (ButtonBar)ev.getController();
      println("hello ",bar.hover());
    }
  });
}