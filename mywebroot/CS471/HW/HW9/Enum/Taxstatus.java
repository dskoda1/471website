public enum TaxStatus {
    SINGLE(21450,51900),
    MARRIED(35800,86500);

    TaxStatus(int bracket1, int bracket2) {
        this.bracket1 = bracket1;
        this.bracket2 = bracket2;
    }
    private int bracket1;
    private int bracket2;
    private double rate1 = 0.15;
    private double rate2 = 0.28;
    private double rate3 = 0.31;
    public int getBracket1() {
        return bracket1;
    }
    public int getBracket2() {
        return bracket2;
    }
    public double getRate1() {
        return rate1;
    }
    public double getRate2() {
        return rate2;
    }
    public double getRate3() {
        return rate3;
    }
}


