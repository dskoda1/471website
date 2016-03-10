package assig3solution;
import java.util.Scanner;

/**
   This program calculates a simple tax return.
*/
public class NewTaxCalculator
{
   public static void main(String[] args)
   {
      Scanner in = new Scanner(System.in);

      System.out.print("Please enter your income: ");
      double income = in.nextDouble();

      System.out.print("Are you married? (Y/N) ");
      String input = in.next();
      NewTaxReturn aTaxReturn = null;
      if (input.equalsIgnoreCase("Y"))
          aTaxReturn = new MarriedTaxReturn();
      else
          aTaxReturn = new SingleTaxReturn();

      System.out.println("Tax: "
            + aTaxReturn.getTax(income));
   }
}

