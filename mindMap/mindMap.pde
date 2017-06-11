import controlP5.*;
import java.awt.*;
ControlP5 cp5;

ArrayList<TopicDisplay> subtops=new ArrayList<TopicDisplay>(10);
ArrayList<Topic> topiclist = new ArrayList<Topic>(10);
boolean setLabel = false;
int theChosenOne;
void setup() {
  size(750,400);
  /**
  for (int num = 0; num < subtops.size(); num++){
    subtops.add(num, new TopicDisplay(100,100,100));
    topiclist.add(num, new Topic(subtops.get(num).label));
  }
  **/
  
}

void draw() {
  background(250);
  showup();
}
  
void showup(){
  String str = "KEY, hit:"+"\n"+"'f' to add a floating topic"+"\n"+"'w' to edit text"+"\n"+"'s' to add a subtopic to a SELECTED topic"+"\n"+"'z' to add a sibling topic to a SELECTED topic" +"\n"+"RETURN to unselect";
  fill(50);
  text(str, 10, 10, 300, 200);
  updateCors();
  for (int num = 0; num < subtops.size(); num++){  
    subtops.get(num).toBeDrawn();
    //println(num);
  }
  
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
    println(check);
    println("mouseX:"+mouseX+" mouseY:"+mouseY);
    //determine if it was selected by comparing the x and y values with mouseX and mouseY and seeing if the distances are less than the length of the topic
    if ( mouseX > check.x && mouseX < check.x + check.len && (mouseY >= check.y - 5 && mouseY 
<= check.y +5)){
      //if this was the selected topic, set the topic's selected boolean to be true
      subtops.get(num).selected = true;
      theChosenOne = num;
      println("something was selected! "+subtops.get(theChosenOne));
      return;
    }
  
  }
  
  
}
void keyPressed(){
  showup();
  if (key == ENTER){
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
  if (key == 'f'&&setLabel==false){
    Topic x=new Topic(mouseX,mouseY);
    println("mouseX: " +mouseX+" mouseY: "+mouseY);
    //println(topiclist.size());
    if(topiclist.size()==0){
      //println("ROOT");
      //x.updateRoot();
      //println(topiclist.size());
      subtops.add(new TopicDisplay(mouseX,mouseY,100));
    }   
    else{
      subtops.add(new TopicDisplay(mouseX, mouseY,100));
      println("X :"+mouseX+" Y"+mouseY);
      //x=new Topic(mouseX,mouseY);
    }
    topiclist.add(x);
    //println(subtops.get(theChosenOne));
    //subtops.add(new TopicDisplay()); //will be in same place everytime bc no new coordinates, always at 100,100
    //topiclist.add(x);
      //need a constructor that can take an x and y cor
      //subtops.add(new Topic(mouseX, mouseY))
   }
  else if (key == 's'&&setLabel==false){
    Topic x=new Topic();
    println(topiclist.get(theChosenOne));
    topiclist.get(theChosenOne).addSubtopic(x);
    subtops.add(new TopicDisplay(x.topLeftCorner()[0], x.topLeftCorner()[1], 100));
    topiclist.add(x);
    println(x.topLeftCorner()[0]+", "+ x.topLeftCorner()[1]);
    
  }
  else if (key == 'z'&&setLabel==false){
    Topic x=new Topic();
    topiclist.get(theChosenOne).addSibling(x);
    subtops.add(new TopicDisplay(x.topLeftCorner()[0],x.topLeftCorner()[1],100));
    println(subtops.get(subtops.size()-1));
    println("new sib coords:"+subtops.get(theChosenOne + 1));
    topiclist.add(x);
    println(topiclist.get(theChosenOne));
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
    
    //code to figure out how to position various other sibling or subtopics here
   fill(125);
   rect(this.x, this.y, len,2);
   //println("something is being drawn");
   text(label,x,y);
   
  }
  
  void connect(){
    //if this is not a floating topic, draw two lines, to the right and above to connect to previous topic
  }
 
}