package xmljava;

import org.xml.sax.*;
import org.xml.sax.helpers.DefaultHandler;
import org.xml.sax.helpers.XMLReaderFactory;

/**
 * Created by mika on 12/02/17.
 */
public class Sax extends DefaultHandler{
    int nb_elements = 0;
    int nb_char = 0;

    public void parseXmlFile(String name) throws Exception {
        XMLReader xr = XMLReaderFactory.createXMLReader();
        xr.setContentHandler(this);
        xr.setErrorHandler(this);
        xr.setFeature("http://xml.org/sax/features/validation", true);
        xr.parse(new InputSource(name));
    }

    @Override
    public void startDocument() throws SAXException {
        nb_elements = 0;
        nb_char = 0;
//        super.startDocument();
    }

    @Override
    public void endDocument() throws SAXException {
        System.out.println("nb_char :" + nb_char + " nb_elements :" + nb_elements);
//        super.endDocument();
    }

    @Override
    public void startElement(String uri, String localName, String qName, Attributes attributes) throws SAXException {
        System.out.println("<" + qName + ">");
        nb_elements++;
//        super.startElement(uri, localName, qName, attributes);
    }

    @Override
    public void endElement(String uri, String localName, String qName) throws SAXException {
        System.out.println("</" + qName + ">");
//        super.endElement(uri, localName, qName);
    }

    @Override
    public void characters(char[] ch, int start, int length) throws SAXException {
        nb_char += length;
        for (int i = start; i < length; i++) {
            switch (ch[i]) {
                case '&':
                    System.out.print("&amp;");
                    break;
                case '<':
                    System.out.print("&lt;");
                    break;
                case '>':
                    System.out.print("&gt;");
                    break;
                default:
                    System.out.print(ch[i]);
                    break;
            }
        }

//        super.characters(ch, start, length);
    }

    @Override
    public void error(SAXParseException e) throws SAXException {
        System.err.printf("Erreur non fatale (ligne %d, col %d) : %s\n",
                e.getLineNumber(), e.getColumnNumber(), e.getMessage());
        super.error(e);
    }

    @Override
    public void fatalError(SAXParseException e) throws SAXException {
        System.err.printf("Erreur fatale : %s\n", e.getMessage());
        super.fatalError(e);
    }

    @Override
    public void warning(SAXParseException e) throws SAXException {
        System.err.printf("warning : %s\n", e.getMessage());
        super.warning(e);
    }

    public static void main(String args[]) throws Exception {
        Sax parser = new Sax();
        parser.parseXmlFile("master.xml");
    }
}
