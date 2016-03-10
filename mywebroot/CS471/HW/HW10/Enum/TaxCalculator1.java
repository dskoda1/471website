import java.util.Scanner;

/**
   This program calculates a simple tax return.
   based on an example by Horstmann in Big Java
*/
public class TaxCalculator1
{
   public static void main(String[] args)
   {
      Scanner in = new Scanner(System.in);

      System.out.print("Please enter your income: ");
      double income = in.nextDouble();

      System.out.print("Are you married? (Y/N) ");
      String input = in.next();
      TaxStatus status;
      if (input.equalsIgnoreCase("Y"))
         status = TaxStatus.MARRIED;
      else
         status = TaxStatus.SINGLE;

      TaxReturn1 aTaxReturn = new TaxReturn1(income, status);

      System.out.println("Tax: "
            + aTaxReturn.getTax());
   }
}



