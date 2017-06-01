public class Subtopic{
    Topic orig;
    Subtopic next=null;
    public Subtopic(Topic x){
	orig=x;
    }
    public Subtopic addChild(Topic x){
	if(next==null){
	    Subtopic a=new Subtopic(x);
	    next=a;
	    return a;
	}
	else{
	    return next.addChild(x);
	}
    }
}
