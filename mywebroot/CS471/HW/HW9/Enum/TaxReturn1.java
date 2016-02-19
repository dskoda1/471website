/**
 * A tax return of a taxpayer in 1992
 * based on an example by Horstmann in Big Java
 *
 */
public class TaxReturn1 {
    private double income;
    private TaxStatus status;
    /**
     * Constructs a tax return object for a income and marital status
     * @param anIncome the taxpayer income
     * @param aStatus the tax status
     */
    public TaxReturn1(double anIncome, TaxStatus aStatus) {
        income = anIncome;
        status = aStatus;
    }
    public double getTax() {
        double tax = 0;
        if (income <= status.getBracket1()) {
            double amountInBracket1 = income;
            tax = status.getRate1()* amountInBracket1 ;

        } else if (income <= status.getBracket2()) {
            double amountInBracket1 = status.getBracket1();
            double amountInBracket2 = income - status.getBracket1();
            tax =
                status.getRate1()* amountInBracket1
                + status.getRate2()* amountInBracket2;

        } else {
            double amountInBracket1 = status.getBracket1();
            double amountInBracket2 = status.getBracket2() - status.getBracket1();
            double amountInBracket3 = income - status.getBracket2();
            tax =
                status.getRate1() * amountInBracket1
                + status.getRate2() * amountInBracket2
                + status.getRate3() * amountInBracket3;
        }
        return tax;
    }
} 
