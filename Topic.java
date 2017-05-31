public class Topic{
    ArrayList<Topic> subtopics=new ArrayList<Topic>;
    String text;
    int fontSize;
    //create object after getting x value from text field
    public Topic(){
	text="";
    }
    public void modifyLabel(String x){
	text=x;
    }
    public void addSubtopic(Topic children){
	subtopics.add(children);
    }
}
