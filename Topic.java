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
    Subtopic child=null;
    static ArrayList<Topic> allObjects=new ArrayList<Topic>();
    String text;
    int fontSize;
    // static int topicId=0;
    // static int subtopicId=0;
    static int widthOfBox=20;
    int lengthOfBox=30;
    Topic parent;
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
    public int[] topLeftCorner(){
	int[] toRet=new int[2];
	toRet[0]=leftParCor()[0];
	toRet[1]=leftParCor()[1]+widthOfBox/2;
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
	toSubCor[1]=leftParCor()[1]-widthOfBox/2;
	//System.out.println(toSubCor[0]);
	//System.out.println(toSubCor[1]);
	
    }
    public String toString(){
	return text+" left : "+leftParCor()[0]+", "+leftParCor()[1]+" bottom: "+botSubCor()[0]+", "+botSubCor()[1];
    }
    public void updateRoot(){
	parent=null;
	fromParCor[0]=0;
	fromParCor[1]=0;
	toSubCor[0]=lengthOfBox/2;
	toSubCor[1]=-widthOfBox/2;
	allObjects.add(this);
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
	    //System.out.println("not");
	    ArrayList<Topic> sub=x.subtopics;
	    Topic lastOfSub=sub.get(sub.size()-1);
	    look(lastOfSub,toRet);
	}
	return toRet-100;
    }
    public boolean continueOrNot(Topic x){
	boolean toRet=false;
	ArrayList<Topic> now=x.subtopics; //now refers to subtopics of given input topic
	// for(int i=0;i<now.size();i++){
	//     Topic sub=now.get(i);
	//     Topic subOfSub=sub.subtopics;
	//     if(subOfSub.size()!=0){
	// 	toRet=true;
	//     }
	// }
	//System.out.println("x "+x);
	Topic sub=now.get(now.size()-1); //last subtopic
	//	System.out.println("sub "+sub);
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
	// 	lowX=current.botSubCor[0];
	//     }
	// }
	//System.out.println("drinks subtopics "+now.size());
	Topic current=now.get(now.size()-1); //last subtopic
	//System.out.println("last "+current);
	//System.out.println("current "+current);
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
	toRet[0]=toSubCor[0]+100;
	if(subtopics.size()>0){
	    //System.out.println("no");
	    //for(int i=0;i<subtopics.size();i++){
	    lowestYCor=look(this,lowestYCor);
	    //System.out.println("made it "+lowestYCor);
	    //}
	}
	else{
	    //System.out.println("yes");
	    lowestYCor-=100;
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
	    lowestYCor=this.leftParCor()[1]-100;
	}
	toRet[1]=lowestYCor;
	//toRet[1]=this.leftParCor()[1]-100;
	//System.out.println("eh");
	return toRet;
    }
    public void addSibling(Topic sibling){
	//"this" refers to sibling selected. call like this: siblingSelected.addSibling(Topic sibling) so siblingSelected and sibling will be on same level
        sibling.parent=this.parent;
	sibling.updateSiblingSelected(this);
	sibling.updateLeftCorSibling();
	sibling.updateBotCor();
	//System.out.println(parent);
	//System.out.println(sibling);
	this.parent.addSubPlain(sibling);
	allObjects.add(sibling);
	updateAll();
	updateRestOfDiag(sibling.leftParCor()[1],sibling);
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
	//System.out.println("parent "+this+" child"+children);
	//updateAll();
        Collections.sort(allObjects);
	updateRestOfDiag(children.leftParCor()[1],children);
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
	leftParCor()[1]-=100;
	botSubCor()[1]-=100;
    }
    public void updateRestOfDiag(int base, Topic exclude){
	//shifts all siblings and topics below it
	for(Topic a:allObjects){
	    if(a.leftParCor()[1]-10<=base&&a!=exclude){
		//System.out.println(a);
		a.shiftDown();
	    }
	}
	// for(Topic a:allObjects){
	//     System.out.println(a);
	// }
    }
    public static void main(String[] args){
	//--------------------
	Topic root=new Topic();
	root.modifyLabel("classes");
	root.updateRoot();
	Topic math=new Topic("math");
	root.addSubtopic(math);
	Topic eng=new Topic("english");
	root.addSubtopic(eng);
	Topic geo=new Topic("geometry");
	math.addSubtopic(geo);
	Topic fr=new Topic("freshman comp");
	eng.addSubtopic(fr);
	Topic euro=new Topic("euro lit");
	fr.addSibling(euro);
	Topic trig=new Topic("trigonometry");
	geo.addSibling(trig);
	//----------------------
	for(Topic a:allObjects){
	    System.out.println(a);
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
