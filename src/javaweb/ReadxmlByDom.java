package javaweb;

import java.util.ArrayList;
import java.util.List;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;

import org.w3c.dom.Document;
import org.w3c.dom.NamedNodeMap;
import org.w3c.dom.NodeList;


/**
 * 用DOM方式读取xml文件
 */
public class ReadxmlByDom {
    private static DocumentBuilderFactory dbFactory = null;
    private static DocumentBuilder db = null;
    private static Document document = null;
    private static List<Shape> Shapes = null;
    static{
        try {
            dbFactory = DocumentBuilderFactory.newInstance();
            db = dbFactory.newDocumentBuilder();
        } catch (ParserConfigurationException e) {
            e.printStackTrace();
        }
    }

    public static List<Shape> getShapes(String fileName) throws Exception{
        //将给定 URI 的内容解析为一个 XML 文档,并返回Document对象
        document = db.parse(fileName);
        //按文档顺序返回包含在文档中且具有给定标记名称的所有 Element 的 NodeList
        NodeList ShapeList = document.getElementsByTagName("shape");
        Shapes = new ArrayList<Shape>();
        //遍历Shapes
        for(int i=0;i<ShapeList.getLength();i++){
            Shape Shape = new Shape();
            //获取第i个Shape结点
            org.w3c.dom.Node node = ShapeList.item(i);
            //获取第i个Shape的所有属性
            NamedNodeMap namedNodeMap = node.getAttributes();
            //获取已知名为id的属性值
            String id = namedNodeMap.getNamedItem("id").getTextContent();//System.out.println(id);
            Shape.setId(Integer.parseInt(id));

            //获取Shape结点的子节点,包含了Test类型的换行
            NodeList cList = node.getChildNodes();//System.out.println(cList.getLength());9

            //将一个Shape里面的属性加入数组
            ArrayList<String> contents = new ArrayList<>();
            for(int j=1;j<cList.getLength();j+=2){

                org.w3c.dom.Node cNode = cList.item(j);
                String content = cNode.getFirstChild().getTextContent();
                contents.add(content);
//                System.out.println(contents);
            }

            Shape.setShapetype(contents.get(0));
            Shape.setNumber1(Double.parseDouble(contents.get(1))) ;
            Shape.setNumber2(Double.parseDouble(contents.get(2)));
            Shapes.add(Shape);
        }

        return Shapes;

    }

    public static void main(String args[]){
        String fileName = "C:\\Users\\Lenovo\\IdeaProjects\\javaweb_exercise\\web\\shape.xml";
        try {
            List<Shape> list = ReadxmlByDom.getShapes(fileName);
            for(Shape Shape :list){
                System.out.println(Shape);
                System.out.println(Shape.getArea());

            }
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }

}
