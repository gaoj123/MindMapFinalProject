import controlP5.*;
import java.awt.*;
ControlP5 cp5;

ArrayList<TopicDisplay> subtops=new ArrayList<TopicDisplay>(10);
ArrayList<Topic> topiclist = new ArrayList<Topic>(10);
boolean setLabel = false;
int theChosenOne;
void setup() {
  size(750,400);
  
  for (int num = 0; num < subtops.size(); num++){
    subtops.add(num, new TopicDisplay(100,10,20));
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
  }
}



void mousePressed(){
  //loop to go through every single topic in the arraylist and see if this is the topic that was selected
  for (int num = 0; num < subtops.size(); num++){
    TopicDisplay check = subtops.get(num);
    
    //determine if it was selected by comparing the x and y values with mouseX and mouseY and seeing if the distances are less than the length of the topic
    if (check.len > dist(mouseX, mouseY, check.x, check.y)){
      //if this was the selected topic, set the topic's selected boolean to be true
      subtops.get(num).selected = true;
      theChosenOne = num;
      println("something was selected!");
    }
  }
  
  
}
void keyPressed(){
  if (key == ENTER){
    setLabel = false;
    subtops.get(theChosenOne).selected = false;
    println("no longer performing any action");
  }
  
  if (setLabel){
    String newLabel = "";
    //change the text of the selected topic
    newLabel += key;
    subtops.get(theChosenOne).label += newLabel;
  }
  if (key == 'f'){
    subtops.add(new TopicDisplay());
      //need a constructor that can take an x and y cor
      //subtops.add(new Topic(mouseX, mouseY))
   }
  else if (key == 's'){
    //subtopic
  }
  else if (key == 'z'){
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
   fill(125);
   rect(this.x, this.y, 100,1);
   text(label,x,y);
  }
  
  void connect(){
    //if this is not a floating topic, draw two lines, to the right and above to connect to previous topic
  }
 
}