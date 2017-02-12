package xmljava;

import org.w3c.dom.*;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import java.io.File;

/**
 * Created by mika on 12/02/17.
 */
public class Dom {

    public void parseXmlFile(String name) throws Exception{
        DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
        factory.setValidating(true);
        DocumentBuilder parser = factory.newDocumentBuilder();
        Document doc = parser.parse(new File(name));
        printTree(doc);
    }

    public void printTree(Node n) {
        if (n.getNodeType() == Node.TEXT_NODE) {
            System.out.println(n.getNodeValue());
        } else if (n instanceof Comment) { // MAIS C'EST VRAIMENT DEGEULASSE ! ! !
            System.out.println("<!--" + n.getNodeValue() + "-->");
        } else if (n instanceof Element) {
            System.out.println("<" + n.getNodeName() + ">");
            printTrees(n.getChildNodes());
            System.out.println("</" + n.getNodeName() + ">");
        } else if (n instanceof Document) {  // SI SI, JUSQU'AU BOUT C'EST CRADE !
            printTrees(n.getChildNodes());
        }
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
