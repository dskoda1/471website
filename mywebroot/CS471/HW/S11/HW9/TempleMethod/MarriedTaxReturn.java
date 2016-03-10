package assig3solution;

public class MarriedTaxReturn extends NewTaxReturn {

    @Override
    public int getBracket1() {
        return MARRIED_BRACKET1;
    }

    @Override
    public int getBracket2() {
        return MARRIED_BRACKET2;
    }

    private static final int MARRIED_BRACKET1 = 35800;
    private static final int MARRIED_BRACKET2 = 86500;
} 
