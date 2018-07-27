package javaweb;

public class Factory {//工厂

    public static ShapeFactory getInstance(Class c) {
        ShapeFactory shapefactory = null;
        try {
            shapefactory = (ShapeFactory) Class.forName(c.getName()).newInstance();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return shapefactory;
    }
}
