package javaweb;

public class CircuFactory implements ShapeFactory {
    private double numberA = 0;
    private double numberB = 0;
    @Override
    public double LengthCalc() {
        return 3.14 * (this.numberA + this.numberB);
    }
    @Override
    public double AreaCalc() {
        return 3.14 * this.numberA * this.numberB;
    }
    @Override
    public void  NumberSet(double number1, double number2){
        this.numberA = number1;
        this.numberB = number2;

    }
}
