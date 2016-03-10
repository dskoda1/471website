package assig3solution;

public class SingleTaxReturn extends NewTaxReturn {

    @Override
    public int getBracket1() {
        return SINGLE_BRACKET1;
    }

    @Override
    public int getBracket2() {
        return SINGLE_BRACKET2;
    }

    private static final int SINGLE_BRACKET1 = 21450;
    private static final int SINGLE_BRACKET2 = 51900;
}
