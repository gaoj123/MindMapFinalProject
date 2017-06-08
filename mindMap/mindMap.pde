import controlP5.*;
import java.awt.*;
ControlP5 cp5;

ArrayList<TopicDisplay> subtops=new ArrayList<TopicDisplay>(10);
boolean setLabel = false;
void setup() {
  size(750,400);
  
  for (int num = 0; num < subtops.size(); num++){
    subtops.add(num, new TopicDisplay(100,10,20));
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
  //determine if it was selected by comparing the x and y values with mouseX and mouseY and seeing if the distances are less than the length of the topic
  //if this was the selected topic, set the topic's selected boolean to be true
  
}
void keyPressed(){
  if (key == ENTER){
    setLabel = false;
  }
  
  if (setLabel){
    String newLabel = "";
    //change the text of the selected topic
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
  }
  else if(key == 'w'){
     setLabel = true;
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