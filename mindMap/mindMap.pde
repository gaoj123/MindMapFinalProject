import controlP5.*;
import java.awt.*;
ControlP5 cp5;

ArrayList<TopicDisplay> subtops=new ArrayList<TopicDisplay>(10);
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

  void keyPressed(){
    if (key == 'f'){
      subtops.add(new TopicDisplay());
      //need a constructor that can take an x and y cor
      //subtops.add(new Topic(mouseX, mouseY))
    }
  }
    
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
   fill(125);
   rect(this.x, this.y, 100,1);
  }
 
}