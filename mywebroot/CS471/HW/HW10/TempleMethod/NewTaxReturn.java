package assig3solution;
/**
   A tax return of a taxpayer in 1992.
 */
public abstract class NewTaxReturn {
    /**
     * Gives the first Tax Bracket for this return
     * type
     * @return lower Tax Bracket
     */
    public abstract int getBracket1();

    /**
     * Gives the second Tax Bracket for this return
     * type
     * @return upper Tax Bracket
     */
    public abstract int getBracket2();

    /**
     * Computes the tax that will apply to a certain
     * income.
     * @param income the value of the person's income
     * @return the tax the person should pay
     */
    public double getTax(double income) {
        double tax = 0;
        if (income <= getBracket1()) {
            double amountInBracket1 = income;
            tax = RATE1* amountInBracket1 ;

        } else if (income <= getBracket2()) {
            double amountInBracket1 = getBracket1();
            double amountInBracket2 = income - getBracket1();
            tax =
                RATE1* amountInBracket1
                + RATE2* amountInBracket2;

        } else {
            double amountInBracket1 = getBracket1();
            double amountInBracket2 = getBracket2() - getBracket1();
            double amountInBracket3 = income - getBracket2();
            tax =
                RATE1 * amountInBracket1
                + RATE2 * amountInBracket2
                + RATE3 * amountInBracket3;
        }
        return tax;
    }

    private static final double RATE1 = 0.15;
    private static final double RATE2 = 0.28;
    private static final double RATE3 = 0.31;
} 
