package code.java;

public class Static2 {

    public static void main(String[] args) {
        Static1.setTestValue(5);

        // non-private static variables can be accessed with class name
        Static1.testString = "\nAssigning testString a value";
        Static1 csd = new Static1();
        System.out.println(csd.getTestString());

        // class and instance static variables are same
        System.out.print("\nCheck if Class and Instance Static Variables are same:  ");
        System.out.println(Static1.testString == csd.testString);
        System.out.println("Why? Because: Static1.testString == csd.testString");
    }
}
