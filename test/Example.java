package code.java;

public class Static1 {

    // 1st static block
    static {
        System.out.println("\nI'm static block 1..");
        setTestString("This is static block's String");
        setTestValue(2);
    }

    // 2nd static blocks in same class
    static {
        System.out.println("\nI'm static block 2..");
    }

    // static variable example
    private static int testValue; // kept private to control it's value through setter

    public int getTestValue() {
        return testValue;
    }

    // static method example
    public static void setTestValue(int testValue) {
        if (testValue > 0)
            Static1.testValue = testValue;
        System.out.println("setTestValue method: " + testValue);
    }

    public static String testString;

    /**
     * @return the testString
     */
    public static String getTestString() {
        return testString;
    }

    /**
     * @param testString the testString to set
     */
    public static void setTestString(String testString) {
        Static1.testString = testString;
        System.out.println("setTestString method: " + testString);
    }

    // static util method
    public static int subValue(int i, int... js) {
        int sum = i;
        for (int x : js)
            sum -= x;
        return sum;
    }
}