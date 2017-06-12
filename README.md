# MindMapFinalProject
<html>
<h1>Mind Mapping</h1>
<img src="http://www.mindmapping.com/img/mind-map.jpg">
<br>
<h5>Jenny Gao and Karen Chen (JenRen GaoChen)</h5>
<h5>Period 6</h5><br>
<h3>Overview</h3>
<p>Mind Mapping is a program that allows users to organize ideas by creating visual outlines. Users start with a blank document to add various topics to. Each individual topic can create a sibling or subtopic.  The direction is down and to the right.</p>
<br>
<ul><h3>Keys in Processing, Hit: </h3>
<li>'f' to add a floating topic</li>
<li>'w' to edit text</li>
<li>'s' to add a subtopic to a SELECTED topic</li>
<li>'z' to add a sibling topic to a SELECTED topic</li>
<li>'v' to save a screenshot</li>
<li>RETURN to deselect</li>
</ul><br>
<ul><h3>Data Storage</h3>
<li>Each topic has an ArrayList of topics (subtopics) (done Saturday 6/3)</li>
</ul><br>
<ul><h3><b>User Inputs Topics </b></h3>
<li>Initial Plan: there are buttons to choose to add subtopics, floating topics, and siblings.  Once clicked, a text field appears (not working currently) (done Saturday 6/3)</li>
<li>Now: Refer to above "Keys in Processing, Hit: " to learn how to create topics and edit the text of topics</li>
</ul><br>
<ul><h3>Labels on Diagram</h3>
<li>When keys are pressed for new floating topics/subtopics/siblings to be created, coordinates will be generated for those new topics (some seemed to work on Saturday 6/3 but lots of problems arose as I [Jenny] started testing and trying out all possible cases so they work as of 6/11). </li>
<li>Lines appear at these coordinate locations, and users can choose to edit the (blank) text</li>
</ul><br>
<ul><h3>Stylistic Features</h3>
<li>User can choose the font from a drop-down list of 10 font types.  This font applies to all text labels.</li><br>
<i>Note: For this to work, the user must load the fonts in Processing.  Processing window: TOOLS --> CREATE FONT (for 10 fonts).  The 10 fonts include Calibri, Cambria, Century Gothic, Comic Sans, Courier New, Georgia, Papyrus, Script, Times New Roman, and Verdana.</i>
</ul><br>
<ul><h3>To Save</h3>
<li>Originally, I [Karen] worked on serializing the file, but serialization interfered with key-pressing. Instead, 'v' will now have Processing take and save a screenshot of the mindmap into the createdMaps folder.</li>
</ul><br>
</html>
