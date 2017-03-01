package xmljava;

import org.w3c.dom.*;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import java.io.File;

/**
 * Created by mika on 12/02/17.
 */
public class Dom {
	
	boolean ue = false;

    public void parseXmlFile(String name) throws Exception{
        DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
        factory.setValidating(true);
        DocumentBuilder parser = factory.newDocumentBuilder();
        Document doc = parser.parse(new File(name));
        printTree(doc);
    }

    public void printTree(Node n) {
    	// Ici on affiche seulement les noms des unités d'enseignement
	    if (n.getNodeType() == Node.TEXT_NODE) {
	    	System.out.println();
	        if(ue && n.getParentNode().getNodeName() == "nom") {
	        	System.out.println("  " + n.getNodeValue());
	        }
	    } 
	    
	    else if (n instanceof Comment)
	        System.out.print("<!-- " + n.getNodeValue() + " -->");

	    else if (n instanceof Element) {
	    	if(n.getNodeName() == "ue") ue = true;
			
	        System.out.print("<" + n.getNodeName() + ">");
	        printTrees(n.getChildNodes());
	        System.out.print("</" + n.getNodeName() + ">");
	        
	        ue = false;
	    } 
	    
	    else if (n instanceof Document)
	    	printTrees(n.getChildNodes());
	    
	}

    public void printTrees(NodeList ns) {
        for (int i = 0; i < ns.getLength(); i++)
            printTree(ns.item(i));
    }

    public static void main(String[] args) {
        Dom parser = new Dom();
        try {
            parser.parseXmlFile("master.xml");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
