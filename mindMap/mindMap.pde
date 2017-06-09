import controlP5.*;
import java.awt.*;
ControlP5 cp5;

ArrayList<TopicDisplay> subtops=new ArrayList<TopicDisplay>(10);
ArrayList<Topic> topiclist = new ArrayList<Topic>(10);
boolean setLabel = false;
int theChosenOne;
int theChosenOneSub = -1;
void setup() {
  size(750,400);
  
  for (int num = 0; num < subtops.size(); num++){
    subtops.add(num, new TopicDisplay(100,100,100));
    topiclist.add(num, new Topic(subtops.get(num).label));
  }
  
}

void draw() {
  background(250);
  showup();
}
  
void showup(){
  for (int num = 0; num < subtops.size(); num++){  
    subtops.get(num).toBeDrawn();
    println(num);
    if (subtops.get(num).subs.size() > 0){
      println("this topic has a subtopic"+subtops.get(num).subs.size());
      for (int num2 = 0; num2 < subtops.get(num).subs.size(); num2++){
        subtops.get(num).subs.get(num2).toBeDrawn();
      }
    }
  }
}



void mousePressed(){
  //loop to go through every single topic in the arraylist and see if this is the topic that was selected
  for (int num = 0; num < subtops.size(); num++){
    TopicDisplay check = subtops.get(num);
    for (int i = 0; i < subtops.get(num).subs.size(); i++){
      TopicDisplay check2 = subtops.get(num).subs.get(i);
        if (check2.len > dist (mouseX, mouseY, check2.x, check2.y)){
          subtops.get(num).selected = false;
          subtops.get(num).subs.get(i).selected = true;
          theChosenOneSub = i;
          theChosenOne = num;
          return;
        }
    }
    //determine if it was selected by comparing the x and y values with mouseX and mouseY and seeing if the distances are less than the length of the topic
    if (check.len > dist(mouseX, mouseY, check.x, check.y)){
      //if this was the selected topic, set the topic's selected boolean to be true
      subtops.get(num).selected = true;
      theChosenOne = num;
      println("something was selected!");
      return;
    }
  
  }
  
  
}
void keyPressed(){
  if (key == ENTER){
    setLabel = false;
    subtops.get(theChosenOne).selected = false;
    if (theChosenOneSub != -1){
      subtops.get(theChosenOne).subs.get(theChosenOneSub).selected = false;
    }
    println("no longer performing any action");
  }
  
  if (setLabel){
    String newLabel = "";
    //change the text of the selected topic
    newLabel += key;
    if (theChosenOneSub != -1){
      if (subtops.get(theChosenOne).subs.get(theChosenOneSub).selected = true){
        subtops.get(theChosenOne).subs.get(theChosenOneSub).label += newLabel;
       // topiclist.get(theChosenOne).subtopics.get(theChosenOneSub).modifyLabel(newLabel);
      }
    }
    else if(subtops.get(theChosenOne).selected = true){
      subtops.get(theChosenOne).label += newLabel;
      topiclist.get(theChosenOne).modifyLabel(newLabel);
    }
  }
  if (key == 'f'){
    Topic x=new Topic();
    println(topiclist.size());
    if(topiclist.size()==1){
      x.updateRoot();
      println(topiclist.size());
    }   
    subtops.add(new TopicDisplay());
    topiclist.add(x);
      //need a constructor that can take an x and y cor
      //subtops.add(new Topic(mouseX, mouseY))
   }
  else if (key == 's'){
    Topic x=new Topic();
    topiclist.get(theChosenOne).addSubtopic(x);
    println(topiclist.get(theChosenOne));
    //subtops.add(theChosenOne+1,new TopicDisplay(x.topLeftCorner()[0],x.topLeftCorner()[1],20));
    subtops.get(theChosenOne).subs.add(new TopicDisplay(topiclist.get(theChosenOne).topLeftCorner()[0], topiclist.get(theChosenOne).topLeftCorner()[1], 100));
    //subtops.get(theChosenOne).subs.add(new TopicDisplay(150, 150, 100));
    println("CRAZYYY");
    println(subtops.get(theChosenOne).subs);
    topiclist.add(theChosenOne+1,x);
    //subtopic
    //when adding a subtopic, what's happening is that a new topic is being added to an arraylist within the main topic
    
  }
  else if (key == 'z'){
    Topic x=new Topic();
    topiclist.get(theChosenOne).addSibling(x);
    subtops.add(theChosenOne+1,new TopicDisplay(x.topLeftCorner()[0],x.topLeftCorner()[1],20));
    topiclist.add(theChosenOne+1,x);
    //sibling
    /**
    subtops.add(theChosenOne+1, new TopicDisplay(
    topiclist.add(theChosenOne+1, new Topic( 
    **/
  }
  else if(key == 'w'){
     setLabel = true;
     println("change to writing mode");
  }
  
}
    
class TopicDisplay {
  String label =""; // label
  int x;      // top left corner x position
  int y;      // top left corner y position
  boolean selected;
  int len;
  
  ArrayList<TopicDisplay> subs=new ArrayList<TopicDisplay>();
  
  TopicDisplay(){
    x = 100;
    y = 100;
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
  
  void toBeDrawn() {
    if (!this.selected){
      strokeWeight(1);
    }
    else{
      strokeWeight(3);
    }
    
    //code to figure out how to position various other sibling or subtopics here
   fill(125);
   rect(this.x, this.y, len,1);
   println("something is being drawn");
   text(label,x,y);
   
  }
  
  void connect(){
    //if this is not a floating topic, draw two lines, to the right and above to connect to previous topic
  }
 
}