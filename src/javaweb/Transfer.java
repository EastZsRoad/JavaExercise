package javaweb;

public class Transfer {

    public double LengthOutput(double a,double b, String c){
        double L = -1;
        switch (c)
        {
            case "CIRC":
                ShapeFactory d = Factory.getInstance(CircuFactory.class);
                d.NumberSet(a,b);
                L =  d.LengthCalc();
                break;
            case "SQUA":
                ShapeFactory e = Factory.getInstance(SquarFactory.class);
                e.NumberSet(a,b);
                L =  e.LengthCalc();
                break;
        }
        return L;

    }
    public double AreaOutput(double a,double b, String c){
        double L = -1;
        switch (c)
        {
            case "CIRC":
                ShapeFactory d = Factory.getInstance(CircuFactory.class);
                d.NumberSet(a,b);
                L =  d.AreaCalc();
                break;
            case "SQUA":
                ShapeFactory e = Factory.getInstance(SquarFactory.class);
                e.NumberSet(a,b);
                L =  e.AreaCalc();
                break;
        }
        return L;

    }
    public static void main(String args[]){
        double a =10;
        double b =20;
        String c = "CIRC";
        Transfer t = new Transfer();
        System.out.println(t.AreaOutput(a,b,c));


//       ShapeFactory a = Factory.getInstance(CircuFactory.class);
//       a.NumberSet(7,10);
//        System.out.println(a.AreaCalc());


    }

}
