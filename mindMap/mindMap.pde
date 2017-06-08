import controlP5.*;
import java.awt.*;
ControlP5 cp5;

String input = "";
//Button but;  // the button

/**
boolean floatingclicked = false;
boolean siblingclicked = false;
boolean subtopicclicked = false;
int click = 1;       // number of times the button is clicked
int buttonvalue;
int topicID = 0;
int xcor, ycor;
String name = "topic" + topicID;
ArrayList<Topic> subtops = new ArrayList<Topic>();
controlP5.Button floatingb;
controlP5.Button siblingb;
controlP5.Button subtopicb;
**/
/**
ArrayList<TopicDisplay> subtops = new ArrayList<TopicDisplay>();
TopicDisplay a = new TopicDisplay();
subtops.add(a);
**/

TopicDisplay[] subtops = new TopicDisplay[1];
void setup() {
  size(750,400);
  
  for (int num = 0; num < subtops.length; num++){
    subtops[num] = new TopicDisplay();
  }
  /**
  cp5 = new ControlP5(this);
      
   //creating the button
  floatingb = cp5.addButton("floating")
    .setBroadcast(false)
    .setValue(0)
    .setPosition(0,0)
    .setSize(250,19)
    ;
  /**
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
**/
}
 /** 
  public void controlEvent(ControlEvent e){
    println(e.getController().getName());
    if(e.isAssignableFrom(Textfield.class)){
      input = e.getStringValue();
      println("accessing string: "+e.getName()+" "+input);
      if (buttonvalue == 0){
        removeMain();
        subtops.get(0).modifyLabel(input);
        //println(subtops.get(0));
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
  **/

void draw() {
  background(250);
  
    //makes buttons clickable
    //floatingb.setBroadcast(true);
    //siblingb.setBroadcast(true);
    //subtopicb.setBroadcast(true);
}
  

  void keyPressed(){
    if (key == 'f'){
      subtops = (TopicDisplay[])append(subtops, new TopicDisplay());
      //need a constructor that can take an x and y cor
      //subtops.add(new Topic(mouseX, mouseY))
    }
  }
    
/**
// mouse button clicked
  public void floating(int val){
    println("clicked:" +val);
    floatingclicked = true;
    buttonvalue = val;
    Topic topica=new Topic();
    subtops.add(topica);
    println(topica);
    //set topic coordinates too
    createField();
    topicID++;
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
  
  void createField(){
    PFont font = createFont("arial",20);
      cp5.addTextfield(name)
        .setPosition(50,100)
        .setSize(200,40)
        .setFont(font)
        .setFocus(true)
        .setColor(color(255,0,0))
        ;
  }
  
  void removeMain(){
    cp5.get(name).remove();
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
      cp5.addTextarea(name)
       .setPosition(50,100)
       .setSize(200,40)
       .setFont(font)
       .setLineHeight(14)
       .setColor(color(128))
       .setColorBackground(color(255,100))
       .setColorForeground(color(255,100))
       .setText(input)
       .setValue(topicID)
       ;
      
  }
  
**/
// the Button class
class TopicDisplay {
  String label; // label
  int x;      // top left corner x position
  int y;      // top left corner y position
  boolean selected;
  int len;
  
  TopicDisplay(){
    x = 100;
    y = 100;
    len = 20;
    selected = false;
  }
  // constructor
  TopicDisplay(int xcor, int ycor, int size) {
    x = xcor;
    y = ycor;
    len = size;
    selected = false;
  }
  
  void toBeDrawn() {
    if (!this.selected){
      strokeWeight(1);
    }
    else{
      strokeWeight(3);
    }
    
    //code to figure out how to position various other sibling or subtopics here
    
   rect(this.x, this.y, 100,1);
  
  }
 
}