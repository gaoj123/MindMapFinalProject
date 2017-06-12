import controlP5.*;
import java.awt.*;
import java.io.*;
ControlP5 cp5;

ArrayList<TopicDisplay> subtops=new ArrayList<TopicDisplay>(10);
ArrayList<Topic> topiclist = new ArrayList<Topic>(10);
boolean setLabel = false;
int theChosenOne;
String filen = "default";
DropdownList d1;
Textfield tf;
void setup() {
  size(800,800);
  
  cp5 = new ControlP5(this);

  d1 = cp5.addDropdownList("myList-d1")
          .setPosition(10, 200)
          ;
           customize(d1); 
  tf = cp5.addTextfield("Filename")
    .setValue(10.0)
    .setPosition(10,300)
    .setSize(100,20)
    .setFocus(false)
    .setColor(color(255,0,0))
    ;
  tf.getCaptionLabel().setColor(color(255,0,0));
}
void customize(DropdownList ddl) {
  // a convenience function to customize a DropdownList
  ddl.setBackgroundColor(color(190));
  ddl.setItemHeight(20);
  ddl.setBarHeight(15);
  ddl.getCaptionLabel().set("Font");
  ddl.addItem("Calibri",1);
  ddl.addItem("Cambria",2);
  ddl.addItem("Century Gothic",3);
  ddl.addItem("Comic Sans",4);
  ddl.addItem("Courier New",5);
  ddl.addItem("Georgia",6);
  ddl.addItem("Papyrus",7);
  //ddl.addItem("Script",8);
  //ddl.addItem("Times New Roman",9);
  //ddl.addItem("Verdana",10);

  ddl.setColorBackground(color(60));
  ddl.setColorActive(color(255, 128));
}
void controlEvent(ControlEvent e){
  if (e.isGroup()) {
    // check if the Event was triggered from a ControlGroup
    println("event from group : "+e.getGroup().getValue()+" from "+e.getGroup());
  } 
  else if (e.isController()) {
    println("event from controller : "+e.getController().getValue()+" from "+e.getController());
    if(e.getController().getValue()==0.0){
      PFont calib=loadFont("Calibri-48.vlw");
      textFont(calib,15);
    }
    else if(e.getController().getValue()==1.0){
        PFont cambria=loadFont("Cambria-48.vlw");
      textFont(cambria,15);
    }
    else if(e.getController().getValue()==2.0){
        PFont cen=loadFont("CenturyGothic-48.vlw");
      textFont(cen,15);
    }
       else if(e.getController().getValue()==3.0){
       PFont comicSan=loadFont("ComicSansMS-48.vlw");
      textFont(comicSan,15);
       }
    else if(e.getController().getValue()==4.0){
        PFont cour=loadFont("CourierNewPSMT-48.vlw");
      textFont(cour,15);
    }
        else if(e.getController().getValue()==5.0){
       PFont georgia=loadFont("Georgia-48.vlw");
      textFont(georgia,15);
    }
    else if(e.getController().getValue()==6.0){
        PFont pap=loadFont("Papyrus-48.vlw");
      textFont(pap,15);
    }
    /**
    else if(e.getController().getValue()==7.0){
        PFont scr=loadFont("ScriptC-48.vlw");
      textFont(scr,15);
    }
    
     else if(e.getController().getValue()==8.0){
       PFont tnr=loadFont("TimesNewRomanPSMT-48.vlw");
      textFont(tnr,15);
    }
    
    else if(e.getController().getValue()==9.0){
       PFont ver=loadFont("Verdana-48.vlw");
      textFont(ver,15);
    }
    **/
  }
  if (e.isAssignableFrom(Textfield.class)){
    filen = e.getStringValue();
  }
}

void draw() {
  background(250);
  showup();
}

void showup(){
  String str = "KEY, hit:"+"\n"+"'f' to add a floating topic"+"\n"+"'w' to edit text"+"\n"+"'s' to add a subtopic to a SELECTED topic"+"\n"+"'z' to add a sibling topic to a SELECTED topic" +"\n"+"RETURN to deselect"+"\n"+"'v' to save a screenshot";
  fill(50);
  text(str, 10, 10, 300, 200);
  updateCors();
  for (int num = 0; num < subtops.size(); num++){  
    subtops.get(num).toBeDrawn();
    if(topiclist.get(num).parent.isParPar()&&!topiclist.get(num).isRoot()){
      draw2(topiclist.get(num));
    }
    else{
      drawLines(topiclist.get(num));
    }
  }
  
}
void drawLines(Topic x){
  if(!x.isRoot()&&!x.isParPar()&&!x.parent.isParPar()){
    //println("drawing");
    line(x.vertLine()[0],x.vertLine()[1],x.vertLine()[2],x.vertLine()[3]);
    line(x.horLine()[0],x.horLine()[1],x.horLine()[2],x.horLine()[3]);
  }
}
void draw2(Topic x){
    line(x.vertLine()[0],x.vertLine()[1],x.vertLine()[2],x.vertLine()[3]);
  line(x.horLine()[0],x.horLine()[1],x.horLine()[2],x.horLine()[3]);
  line(x.horLine2()[0],x.horLine2()[1],x.horLine2()[2],x.horLine2()[3]);
}
void updateCors(){
  for(int i=0;i<topiclist.size();i++){
    Topic now=topiclist.get(i);
    int a=now.topLeftCorner()[0];
    int b=now.topLeftCorner()[1];
    subtops.get(i).update(a,b);
  }
}
void mousePressed(){
  //loop to go through every single topic in the arraylist and see if this is the topic that was selected
  for (int num = 0; num < subtops.size(); num++){
    TopicDisplay check = subtops.get(num);
    
    //determine if it was selected by comparing the x and y values with mouseX and mouseY and seeing if the distances are less than the length of the topic
    if ( mouseX > check.x && mouseX < check.x + check.len && (mouseY >= check.y - 5 && mouseY 
<= check.y +5)){
      //if this was the selected topic, set the topic's selected boolean to be true
      subtops.get(num).selected = true;
      theChosenOne = num;
      
      return;
    }
  
  }
  
  
}

void keyPressed(){
  showup();
  if (key == ENTER&& tf.isFocus() == false){
    setLabel = false;
    subtops.get(theChosenOne).selected = false;
    println("no longer performing any action");
  }
  
  if (setLabel){
    String newLabel = "";
    //change the text of the selected topic
    if (key == BACKSPACE){
      if(subtops.get(theChosenOne).selected == true){
        if (subtops.get(theChosenOne).label.length() > 0){
          newLabel = subtops.get(theChosenOne).label.substring(0,subtops.get
(theChosenOne).label.length()-1);
          subtops.get(theChosenOne).label = newLabel;
          topiclist.get(theChosenOne).mod(newLabel);
          return;
        }
      }
    }
    if (key >= ' ' && key <= '?' || key >= 'A' && key <= 'z'){
       newLabel += key;
       if(subtops.get(theChosenOne).selected == true){
          subtops.get(theChosenOne).label += newLabel;
          topiclist.get(theChosenOne).mod(newLabel);
        }
    }
  
    println(newLabel);
  }
  if (key == 'f'&&setLabel==false&&tf.isFocus()==false){
    Topic x=new Topic(mouseX,mouseY);
    if(topiclist.size()==0){
      subtops.add(new TopicDisplay(mouseX,mouseY,100));
    }   
    else{
      subtops.add(new TopicDisplay(mouseX, mouseY,100));
    }
    topiclist.add(x);
   }
  else if (key == 's' && setLabel==false && tf.isFocus() == false){
    Topic x=new Topic();
    println(topiclist.get(theChosenOne));
    topiclist.get(theChosenOne).addSubtopic(x);
    subtops.add(new TopicDisplay(x.topLeftCorner()[0], x.topLeftCorner()[1], 100));
    topiclist.add(x);
    
  }
  else if (key == 'z'&&setLabel==false&& tf.isFocus() == false){
    Topic x=new Topic();
    topiclist.get(theChosenOne).addSibling(x);
    subtops.add(new TopicDisplay(x.topLeftCorner()[0],x.topLeftCorner()[1],100));
    topiclist.add(x);
    //sibling
  }
  else if(key == 'v'&&setLabel == false&& tf.isFocus()==false){
    saveFrame("createdMaps/"+filen);
    //TopicFileStream tfs = new TopicFileStream();
    //tfs.write(subtops, filen);
  }
  else if(key == 'w' && tf.isFocus() ==false){
     setLabel = true;
    // println("change to writing mode");
  }
  
}
    
class TopicDisplay{
  String label =""; // label
  int x;      // top left corner x position
  int y;      // top left corner y position
  boolean selected;
  int len;
  color c;
  
  ArrayList<TopicDisplay> subs=new ArrayList<TopicDisplay>();
  
  TopicDisplay(){
    x = 300;
    y = 300;
    len = 100;
    selected = false;
  }
  // constructor
  TopicDisplay(int xcor, int ycor, int size) {
    x = xcor;
    y = ycor;
    len = size;
    selected = false;
  }
  void update(int one, int two){
    x=one;
    y=two;
  }
  int compareTo(TopicDisplay other){
    if(this.y<other.y){
      return -1;
  }
  else if(this.y==other.y){
      return 0;
  }
  else{
      return 1;
  }
  }
  String toString(){
    return x+", "+y;
  }
  void toBeDrawn() {
    if (!this.selected){
      strokeWeight(1);
    }
    else{
      strokeWeight(3);
    }
    
   fill(125);
   rect(this.x, this.y, len,2);
   text(label,x,y);
   
  }
  
 
}