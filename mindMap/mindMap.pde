import controlP5.*;
import java.awt.*;
import java.io.*;
ControlP5 cp5;

ArrayList<TopicDisplay> subtops=new ArrayList<TopicDisplay>(10);
ArrayList<Topic> topiclist = new ArrayList<Topic>(10);
boolean setLabel = false;
int theChosenOne;
String filen = "default";
boolean typefilename = false;
void setup() {
  size(800,800);
  /**
  cp5 = new ControlP5(this);
 
  cp5.addButton("save")
    .setValue(0)
    .setPosition(10,100)
    .setSize(50,10)
    ;
  
  cp5.addTextfield("Filename")
    .setPosition(10,120)
    .setSize(100,20)
    .setFocus(false)
    .setColor(color(255,0,0))
    ;
   **/
 // TopicFileStream fs = new TopicFileStream();
 // fs.write(subtops, "test");
}

void controlEvent(ControlEvent e){
  typefilename = true;
  if (e.isAssignableFrom(Textfield.class)){
    filen = e.getStringValue();
    println(filen);
  }
}
  /**  
void save(int val){
  println(filen);
  TopicFileStream tfs = new TopicFileStream();
  tfs.write(subtops, filen);
}
**/

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
    println("drawing");
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
  if (key == ENTER&&typefilename==false){
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
  if (key == 'f'&&setLabel==false&&typefilename==false){
    Topic x=new Topic(mouseX,mouseY);
    println("mouseX: " +mouseX+" mouseY: "+mouseY);
    if(topiclist.size()==0){
      subtops.add(new TopicDisplay(mouseX,mouseY,100));
    }   
    else{
      subtops.add(new TopicDisplay(mouseX, mouseY,100));
      println("X :"+mouseX+" Y"+mouseY);
    }
    topiclist.add(x);
   }
  else if (key == 's'&&setLabel==false&&typefilename == false){
    Topic x=new Topic();
    println(topiclist.get(theChosenOne));
    topiclist.get(theChosenOne).addSubtopic(x);
    subtops.add(new TopicDisplay(x.topLeftCorner()[0], x.topLeftCorner()[1], 100));
    topiclist.add(x);
    println(x.topLeftCorner()[0]+", "+ x.topLeftCorner()[1]);
    
  }
  else if (key == 'z'&&setLabel==false&&typefilename == false){
    Topic x=new Topic();
    topiclist.get(theChosenOne).addSibling(x);
    subtops.add(new TopicDisplay(x.topLeftCorner()[0],x.topLeftCorner()[1],100));
    println(subtops.get(subtops.size()-1));
    println("new sib coords:"+subtops.get(theChosenOne + 1));
    topiclist.add(x);
    println(topiclist.get(theChosenOne));
    //sibling
  }
  else if(key == 'v'&&setLabel == false&&typefilename==false){
    saveFrame("createdMaps/"+filen);
    println("saved!");
    //TopicFileStream tfs = new TopicFileStream();
    //tfs.write(subtops, filen);
  }
  else if(key == 'w' && typefilename==false){
     setLabel = true;
     println("change to writing mode");
  }
  
}
    
class TopicDisplay implements Serializable{
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
    
   fill(125);
   rect(this.x, this.y, len,2);
   text(label,x,y);
   
  }
  
  void connect(){
    //if this is not a floating topic, draw two lines, to the right and above to connect to previous topic
  }
 
}

class TopicFileStream{
  void write(ArrayList<TopicDisplay> l, String filename){
    println("attempting to serialize");
    ObjectOutputStream out = null;
    println("stuff");
    FileOutputStream file=null;
    try{
      file=new FileOutputStream("default.ser");
      //file = new FileOutputStream("/createdMaps/"+filename+".ser");
      println("more stuff");
      out = new ObjectOutputStream(file);
      println("doing stuff");
      //out.writeObject(l);
      
      for( TopicDisplay t : l){
        println(t);
        out.writeObject(t);
      }
      
      
      //out.writeObject(l);
      out.close();
      println("done");
    }
   
    catch (IOException e){
      println("Error opening");
    }
    
    /**finally{
      try{
        if (out != null){
          out.close();
        }
      }
      catch(IOException e){
        println("Error closing");
      }
    }
    **/
  }
  
  ArrayList<TopicDisplay> read(String filename){
    ArrayList<TopicDisplay> l2 = new ArrayList<TopicDisplay>();
    ObjectInputStream in = null;
    try{
      //in = new ObjectInputStream(new FileInputStream("createdMaps/"+filename+".ser"));
      in = new ObjectInputStream(new FileInputStream("default.ser"));
      while(true){
        TopicDisplay t = (TopicDisplay) in.readObject();
        l2.add(t);
      }
    }
    catch(ClassNotFoundException e){
      println("fail");
    }
    catch(IOException e){
      println("Error opening");
    }
    finally{
      try{
        if (in != null){
          in.close();
        }
      }
      catch(IOException e){
        println("Error closing");
      }
    }
    return l2;
  }
}