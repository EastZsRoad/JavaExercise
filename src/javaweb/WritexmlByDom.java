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
        Element shapestore = doc.createElement("shapestore");

        for(Shape Shape :shapeList){

            Element shape = doc.createElement("shape");

            Element shapetype = doc.createElement("shapetype");
            Element number1 = doc.createElement("number1");
            Element number2 = doc.createElement("number2");
            Element length = doc.createElement("length");
            Element area = doc.createElement("area");
            shapetype.setTextContent(String.valueOf(Shape.getShapetype()));
            number1.setTextContent(String.valueOf(Shape.getNumber1()));
            number2.setTextContent(String.valueOf(Shape.getNumber2()));
            length.setTextContent(String.valueOf(Shape.getLength()));
            area.setTextContent(String.valueOf(Shape.getArea()));
            shape.appendChild(shapetype);
            shape.appendChild(number1);
            shape.appendChild(number2);
            shape.appendChild(length);
            shape.appendChild(area);
            shape.setAttribute("id",String.valueOf(Shape.getId()));
            shapestore.appendChild(shape);

        }

        doc.appendChild(shapestore);
        TransformerFactory factory_t = TransformerFactory.newInstance();
        Transformer former = factory_t.newTransformer();
        former.setOutputProperty(OutputKeys.INDENT,"yes");
        former.transform(new DOMSource(doc),new StreamResult(new File("C:\\Users\\Lenovo\\IdeaProjects\\javaweb_exercise\\web\\shapeoutput.xml")));

    }
    public static void WriteShapes(String[] list1, String[] list2 ,String[] list3,String[] list4,String[] list5,String Filepath ) throws Exception{
        Element shapestore = doc.createElement("shapestore");

        for(int i=0;i< list1.length;i++){

            Element shape = doc.createElement("shape");
            Element shapetype = doc.createElement("shapetype");
            Element number1 = doc.createElement("number1");
            Element number2 = doc.createElement("number2");
            Element length = doc.createElement("length");
            Element area = doc.createElement("area");
            shapetype.setTextContent((list1[i]));
            number1.setTextContent(list2[i]);
            number2.setTextContent(list3[i]);
            length.setTextContent(list4[i]);
            area.setTextContent(list5[i]);
            shape.appendChild(shapetype);
            shape.appendChild(number1);
            shape.appendChild(number2);
            shape.appendChild(length);
            shape.appendChild(area);
            //shape.setAttribute("id",String.valueOf(Shape.getId()));
            shapestore.appendChild(shape);

        }

        doc.appendChild(shapestore);
        TransformerFactory factory_t = TransformerFactory.newInstance();
        Transformer former = factory_t.newTransformer();
        former.setOutputProperty(OutputKeys.INDENT,"yes");
        former.transform(new DOMSource(doc),new StreamResult(new File(Filepath)));

    }



    public static void main(String[] args) {
        String fileName = "C:\\Users\\Lenovo\\IdeaProjects\\javaweb_exercise\\web\\shape.xml";
        try {
            List<Shape> list = ReadxmlByDom.getShapes(fileName);
            WritexmlByDom.writeShapes(list);
            for (Shape Shape : list) {
                System.out.println(Shape);
                System.out.println(Shape.getArea());

            }
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }

}