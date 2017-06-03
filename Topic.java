public class Topic{
    ArrayList<Topic> subtopics=new ArrayList<Topic>;
    Subtopic child=null;
    String text;
    int fontSize;
    //create object after getting x value from text field
    public Topic(){
	text="";
    }
    public Topic(String x){
	text=x;
    }
    public void modifyLabel(String x){
	text=x;
    }
    public void addSubtopic(Topic children){
	subtopics.add(children);
	if(child==null){
	    Subtopic a=new Subtopic(children);
	    child=a;
	    return a;
	}
	else{
	    return child.addChild(children);
	}
    }
    public static void main(String[] args){
	Topic root=new Node("food");
        Subtopic child1=root.addChild (new Topic ("drinks"));
	Subtopic child2=root.addChild (new Topic ("snacks"));
    }
}
