import java.util.*;
public class Topic implements Comparable<Topic>{
    public int compareTo(Topic other){
  //in decreasing order of y-cor
  if(botSubCor()[1]<other.botSubCor()[1]){
      return -1;
  }
  else if(botSubCor()[1]==other.botSubCor()[1]){
      return 0;
  }
  else{
      return 1;
  }
    }
    ArrayList<Topic> subtopics=new ArrayList<Topic>();
    static ArrayList<Topic> allObjects=new ArrayList<Topic>();
    String text="";
    int fontSize;
    boolean isRoot=false;
    // static int topicId=0;
    // static int subtopicId=0;
    static int widthOfBox=2;
    int lengthOfBox=100;
    Topic parent;
    boolean isParPar=false;
    Topic siblingSelected;
    int[] fromParCor=new int[2]; //on left side of rectangle
    int[] toSubCor=new int[2]; //on botom side of rectangle
    //create object after getting x value from text field
    public Topic(){
  text="";
    }
    public Topic(String x){
  text=x;
    }
    public Topic(int xcor, int ycor){
  // this.topLeftCorner()[0]=xcor;
  // this.topLeftCorner()[1]=ycor;
  // System.out.println(xcor+", "+ycor);
  // System.out.println(topLeftCorner()[0]+topLeftCorner()[1]);
  updateLeftRightEtc(xcor,ycor);
  isRoot=true;
  parent=new Topic();
  parent.isRoot=true;
  parent.isParPar=true;
  this.parent=parent;
  parent.toSubCor[0]=fromParCor[0]-65;
  parent.toSubCor[1]=fromParCor[1]-25;
  parent.fromParCor[0]=parent.toSubCor[0]-lengthOfBox/2;
  parent.fromParCor[1]=parent.toSubCor[1]-widthOfBox/2; 
  //fromParCor[0]=100;
  //fromParCor[1]=101;
  //toSubCor[0]=100+lengthOfBox/2;
  //toSubCor[1]=101+widthOfBox/2;
  parent.subtopics.add(this);
  allObjects.add(this.parent);
  allObjects.add(this);
    }
    public void updateLeftRightEtc(int a,int b){
  fromParCor[0]=a;
  fromParCor[1]=b+widthOfBox/2;
  toSubCor[0]=leftParCor()[0]+lengthOfBox/2;
  toSubCor[1]=leftParCor()[1]+widthOfBox/2;
  System.out.println(fromParCor[0]+", "+fromParCor[1]+" & "+toSubCor[0]+", "+toSubCor[1]);
    }
    public int[] topLeftCorner(){
  int[] toRet=new int[2];
  toRet[0]=leftParCor()[0];
  toRet[1]=leftParCor()[1]-widthOfBox/2;
  return toRet;
    }
    public int[] vertLine(){
  //call from child
  int[] toRet=new int[4];
  toRet[0]=parent.botSubCor()[0];
  toRet[1]=parent.botSubCor()[1];
  toRet[2]=parent.botSubCor()[0];
  //toRet[3]=parent.botSubCor()[1]-100;
  toRet[3]=leftParCor()[1];
  return toRet;
    }
    public void mod(String x){
  text+=x;
    }
    public Topic getSub(int index){
  return subtopics.get(index);
    }
    public int[] horLine(){
  int[] toRet=new int[4];
  toRet[0]=vertLine()[2];
  toRet[1]=vertLine()[3];
  toRet[2]=leftParCor()[0];
  toRet[3]=leftParCor()[1];
  return toRet;
    }
    public void updateSiblingSelected(Topic sibChosen){
  //when user clicks "add sibling" after selecting a label, this method is called
  siblingSelected=sibChosen;
    }
    public void updateSubTopic(){
  //Arrays.sort(subtopics);
  Collections.sort(subtopics);
  //Collections.sort(subtopics,Collections.reverseOrder());
  //maintain order of subtopics in order from highest to lowest y-cor
  //use sort
    }
    public void updateAll(){
  //Arrays.sort(allObjects);
  Collections.sort(allObjects);
  //Collections.sort(allObjects,Collections.reverseOrder());
    }
    public void updateLeftCor(){
  //when adding children to parents
  fromParCor[0]=parent.corForSubtopic()[0];
  fromParCor[1]=parent.corForSubtopic()[1];
    }
    public void updateBotCor(){
  toSubCor[0]=leftParCor()[0]+lengthOfBox/2;
  toSubCor[1]=leftParCor()[1]+widthOfBox/2;
  //System.out.println(toSubCor[0]);
  //System.out.println(toSubCor[1]);
  
    }
    public String toString(){
  return text+" left : "+leftParCor()[0]+", "+leftParCor()[1]+" bottom: "+botSubCor()[0]+", "+botSubCor()[1];
    }
    public void updateRoot(){
  isRoot=true;
  parent=new Topic();
  parent.isRoot=true;
  parent.isParPar=true;
  this.parent=parent;
  parent.toSubCor[0]=fromParCor[0]-65;
  parent.toSubCor[1]=fromParCor[1]-25;
  parent.fromParCor[0]=parent.toSubCor[0]-lengthOfBox/2;
  parent.fromParCor[1]=parent.toSubCor[1]-widthOfBox/2; 
  //fromParCor[0]=100;
  //fromParCor[1]=101;
  //toSubCor[0]=100+lengthOfBox/2;
  //toSubCor[1]=101+widthOfBox/2;
  parent.subtopics.add(this);
  allObjects.add(this.parent);
  allObjects.add(this);
    }
    public boolean isRoot(){
  return isRoot;
    }
    public void subHelper(Topic x, boolean stop){
  if(x.isRoot()==true){
      stop=true;
  }
  Topic y=x.parent;
  int ind=y.subtopics.indexOf(x);
  for(int i=ind+1;i<y.subtopics.size();i++){
      y.getSub(i).shiftDown();
  }
  if(!stop){
      subHelper(y,false);
  }
    }
    public void updateSubtopic(){
  subHelper(this,false);
    }
    public void updateSib(){
  subHelper2(this,false);
    }
    public boolean isParPar(){
  return isParPar;
    }
    public void subHelper2(Topic one, boolean stop){
  Topic x=one.parent;
  if(x.isParPar()==true){
      stop=true;
  }
  int ind=x.subtopics.indexOf(one);
  // for(int i=0;i<x.subtopics.size();i++){
  //     if(x.getSub(i).leftParCor()[1]==one.leftParCor()[1]&&x.getSub(i)!=one){
  //     x.getSub(i).shiftDown();
  //     }
  // }
  for(int i=ind+1;i<x.subtopics.size();i++){
      x.getSub(i).shiftDown();
  }
  if(!stop){
      subHelper2(x,false);
  }
    }
    //accessor method returning fromParCor
    public int[] leftParCor(){
  return fromParCor;
    }
    public int[] botSubCor(){
  return toSubCor;
    }
    public void modifyLabel(String x){
  text=x;
    }
    public int look(Topic x, int minYNow){
  int toRet=loopThru(x,minYNow);
  //System.out.println("useless "+toRet);
  if(continueOrNot(x)){ //if last subtopic has subtopics
      System.out.println("yes "+x);
      ArrayList<Topic> sub=x.subtopics;
      Topic lastOfSub=sub.get(sub.size()-1);
      return look(lastOfSub,toRet);
  }
  System.out.println(toRet);
  System.out.println(toRet+25);
  return toRet+25;
    }
    public boolean continueOrNot(Topic x){
  boolean toRet=false;
  ArrayList<Topic> now=x.subtopics; //now refers to subtopics of given input topic
  // for(int i=0;i<now.size();i++){
  //     Topic sub=now.get(i);
  //     Topic subOfSub=sub.subtopics;
  //     if(subOfSub.size()!=0){
  //   toRet=true;
  //     }
  // }
  //System.out.println("x "+x);
  Topic sub=now.get(now.size()-1); //last subtopic
  //  System.out.println("sub "+sub);
  ArrayList<Topic> subOfSub=sub.subtopics;
  if(subOfSub.size()>0){
      //System.out.println("1 "+subOfSub.get(0));
      toRet=true;
  }
  return toRet;
    }
    public int loopThru(Topic x, int minYNow){
  int lowY=minYNow;
  ArrayList<Topic> now=x.subtopics; //now refers to subtopics of given input topic
  // for(int i=0;i<now.size();i++){
  //     Topic current=now.get(i);
  //     if(current.botSubCor[0]<minXNow){
  //   lowX=current.botSubCor[0];
  //     }
  // }
  //System.out.println("drinks subtopics "+now.size());
  Topic current=now.get(now.size()-1); //last subtopic
  System.out.println("last "+current);
  System.out.println("current "+current);
  System.out.println(current.leftParCor()[1]);
  lowY=current.leftParCor()[1];
  //lowY=current.botSubCor()[1];
  //returns lowest y-cor (which refers to y-cor of last subtopic)
  return lowY;
    }
    public String subCor(){
  return corForSubtopic()[0]+", "+corForSubtopic()[1];
    }
    public int[] corForSubtopic(){
  int lowestYCor=botSubCor()[1];
  int[] toRet=new int[2];
  //x-cor is just parent's x-cor shifted 100 to the right
  toRet[0]=toSubCor[0]+65;
  if(subtopics.size()>0){
      //System.out.println("no");
      //for(int i=0;i<subtopics.size();i++){
      lowestYCor=look(this,lowestYCor);
      //System.out.println("made it "+lowestYCor);
      //}
  }
  else{
      //System.out.println("yes");
      lowestYCor+=25;
  }
  toRet[1]=lowestYCor;
  return toRet;
    }
    public void updateLeftCorSibling(){
  fromParCor[0]=siblingSelected.corForSibling()[0];
  fromParCor[1]=siblingSelected.corForSibling()[1];
  //System.out.println(fromParCor[0]+" "+fromParCor[1]);
    }
    public int[] corForSibling(){
  int[] toRet=new int[2];
  //x-cor is just the same as the sibling's  x-cor
  toRet[0]=this.leftParCor()[0];
  int lowestYCor=this.botSubCor()[1];
  if(this.subtopics.size()>0){
      //System.out.println("no");
      //for(int i=0;i<subtopics.size();i++){
      lowestYCor=look(this,lowestYCor);
      //System.out.println(lowestYCor+"DONE");
      //System.out.println(this);
      //}
  }
  else{
      //System.out.println("yes");
      // lowestYCor=this.leftParCor()[1]-100;
      //Topic par=this.parent;
      //Topic last=par.getSub(par.subtopics.size()-1);
      //lowestYCor=last.leftParCor()[1]+25;
      lowestYCor=this.leftParCor()[1]+25;
  }
  toRet[1]=lowestYCor;
  //toRet[1]=this.leftParCor()[1]-100;
  //System.out.println("eh");
  return toRet;
    }
    public void addSubInd(int ind, Topic children){
  subtopics.add(ind,children);
    }
    public void addSibling(Topic sibling){
  //"this" refers to sibling selected. call like this: siblingSelected.addSibling(Topic sibling) so siblingSelected and sibling will be on same level
        sibling.parent=this.parent;
  sibling.updateSiblingSelected(this);
  sibling.updateLeftCorSibling();
  sibling.updateBotCor();
  //System.out.println(parent);
  //System.out.println(sibling);
  int index=this.parent.subtopics.indexOf(this);
  this.parent.addSubInd(index+1,sibling);
  //this.parent.addSubPlain(sibling);
  allObjects.add(sibling);
  sibling.updateSib();
  Collections.sort(this.parent.subtopics);
  Collections.sort(allObjects);
  //  updateAll();
  //updateRestOfDiag(sibling.leftParCor()[1],sibling);
  //System.out.println("parent "+parent+" child"+sibling);
    }
    public void addSubPlain(Topic children){
  subtopics.add(children);
    }
    public void addSubtopic(Topic children){
  //subtopics.add(children);
  children.parent=this;
  children.updateLeftCor();
  children.updateBotCor();
  subtopics.add(children);
  allObjects.add(children);
  this.updateSubtopic();
  //System.out.println("parent "+this+" child"+children);
  //updateAll();
        Collections.sort(allObjects);
  Collections.sort(subtopics);
  System.out.println("LOOK "+children+children.leftParCor()[1]);
  //this.updateSubtopic();
  //updateRestOfDiag(children.leftParCor()[1],children);
  // if(child==null){
  //     Subtopic a=new Subtopic(children);
  //     child=a;
  //     return a;
  // }
  // else{
  //     return child.addChild(children);
  // }
    }
    public void shiftDown(){
  leftParCor()[1]+=25;
  botSubCor()[1]+=25;
  if(this.subtopics.size()!=0){
      for(int i=0;i<subtopics.size();i++){
    subtopics.get(i).shiftDown();
      }
  }
    }
    // public void updateRestOfDiag(int base, Topic exclude){
    //   //shifts all siblings and topics below it
    //   for(Topic a:allObjects){
    //       if(a.leftParCor()[1]+1>=base&&a!=exclude){
    //     //System.out.println(a);
    //     a.shiftDown();
    //       }
    //   }
    //   // for(Topic a:allObjects){
    //   //     System.out.println(a);
    //   // }
    // }
    public static void main(String[] args){
  //--------------------
  Topic root=new Topic(100,100);
  root.modifyLabel("classes");
  System.out.println(root);
  root.updateRoot();
  // System.out.println(root);
  Topic math=new Topic("math");
  root.addSubtopic(math);
  // //Topic eng=new Topic("english");
  // Topic precalc=new Topic("precalc");
  // math.addSubtopic(precalc);
  // Topic eng=new Topic("english");
  // root.addSubtopic(eng);
  // Topic geo=new Topic("geometry");
  // math.addSubtopic(geo);
  // Topic fr=new Topic("freshman comp");
  // eng.addSubtopic(fr);
  // Topic euro=new Topic("euro lit");
  // fr.addSibling(euro);
  // Topic ap=new Topic("ap");
  // euro.addSibling(ap);
  // Topic trig=new Topic("trigonometry");
  // geo.addSibling(trig);
  // Topic calc=new Topic("calc");
  // geo.addSibling(calc);
  // // for(Topic a:allObjects){
  // //     System.out.println(a);
  // //     //System.out.println(a.topLeftCorner()[0]+", "+a.topLeftCorner()[1]);
  // // }
  // Topic science=new Topic("science");
  // System.out.println("SCIENCE");
  // root.addSubtopic(science);
   Topic sched=new Topic("sched");
  root.addSibling(sched);
  Topic hr=new Topic("homeroom");
  root.addSibling(hr);
  Topic history=new Topic("history");
  math.addSibling(history);
  Topic locker=new Topic("locker");
  root.addSibling(locker);
  //----------------------
  for(Topic a:allObjects){
      System.out.println(a);
      if(!a.isParPar()&&!a.isRoot()){
    System.out.println("vertline "+a.vertLine()[0]+", "+a.vertLine()[1]+"to "+a.vertLine()[2]+", "+a.vertLine()[3]);
    System.out.println("hortline "+a.horLine()[0]+", "+a.horLine()[1]+"to "+a.horLine()[2]+", "+a.horLine()[3]);
      }
      //System.out.println(a.topLeftCorner()[0]+", "+a.topLeftCorner()[1]);
  }
  // Topic root=new Topic();
  // //if we instantiate empty topic, we'll just follow with modifyLabel (line below)
  // root.modifyLabel("food");
  // root.updateRoot(); //called for first topic in processing
        // Topic child1=new Topic();
  // child1.modifyLabel("drinks");
  // root.addSubtopic(child1);
  // //System.out.println("root "+root);
  // //System.out.println("child1 "+child1);
        //  Topic child5=new Topic("soda");
  //  child1.addSubtopic(child5);
  //  // System.out.println("child5 "+child5);
  //  // Topic child6=new Topic("soda2");
  //  // child1.addSubtopic(child6);
  //  // System.out.println("child6 "+child6);
  // Topic child2=new Topic("snacks");
  // child2.updateSiblingSelected(child1);
  // child1.addSibling(child2);
        // // root.addSubtopic(child2);
  // //System.out.println("child2 "+child2);
  // //System.out.println(child2);
  // Topic child6=new Topic("soda2");
  //  child1.addSubtopic(child6);
  // // // System.out.println("child5 "+child5);
  // // // System.out.println("child2 "+child2);
  // // child2.addSubtopic(child3);
  // // System.out.println("child3 "+child3);
  // // Topic child4=new Topic("chips");
  // // child2.addSubtopic(child4);
  // // System.out.println("child4 "+child4);
  //    System.out.println(allObjects.size());
    }
}