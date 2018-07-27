package javaweb;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NamedNodeMap;
import org.w3c.dom.NodeList;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.transform.OutputKeys;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;
import java.io.File;
import java.util.ArrayList;
import java.util.List;

public class WritexmlByDom {
    private static DocumentBuilderFactory dbFactory = null;
    private static DocumentBuilder db = null;
    private static Document doc = null;
    private static List<Shape> Shapes = null;
    static{
        try {
            dbFactory = DocumentBuilderFactory.newInstance();
            db = dbFactory.newDocumentBuilder();
            doc = db.newDocument();
        } catch (ParserConfigurationException e) {
            e.printStackTrace();
        }
    }
    public static void writeShapes(List<Shape>  shapeList ) throws Exception{

        for(Shape Shape :shapeList){
            Element shapestore = doc.createElement("shapestore");
            Element shape = doc.createElement("shape");
            shape.setTextContent(Shape.getShapetype());
            Element number1 = doc.createElement("number1");
            shape.setTextContent(String.valueOf(Shape.getNumber1()));
            Element number2 = doc.createElement("number2");
            shape.setTextContent(String.valueOf(Shape.getNumber2()));
            Element length = doc.createElement("length");
            shape.setTextContent(String.valueOf(Shape.getLength()));
            Element area = doc.createElement("area");
            shape.setTextContent(String.valueOf(Shape.getArea()));
            shape.appendChild(number1);
            shape.appendChild(number2);
            shape.appendChild(length);
            shape.appendChild(area);
            doc.appendChild(shapestore);
        }
        TransformerFactory factory_t = TransformerFactory.newInstance();
        Transformer former = factory_t.newTransformer();
        former.setOutputProperty(OutputKeys.INDENT,"yes");
        former.transform(new DOMSource(doc),new StreamResult(new File("C:\\Users\\Lenovo\\IdeaProjects\\javaweb_exercise\\web\\shapeoutput.xml")));

    }

    public static void main(String[] args) {


    }
}