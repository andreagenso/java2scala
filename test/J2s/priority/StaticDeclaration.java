package code.java;

public class StaticDeclaration {

    public static void main(String args[]) {
        String[] crunchifyObject = new String[3];
        crunchifyObject = new String[] { "Google", "Facebook", "Crunchify" };

        // creating instnace
        StaticDeclaration object = new StaticDeclaration();
        object.crunchifyTestMethod(crunchifyObject);

    }

	/*
	 * Check this out: Let's understand little more...
	 *
	 * Here method crunchifyTestMethod is defined as
	 * public void crunchifyTestMethod(String[])
	 * so it is "non-static". It can't be called unless it is called on an instance of StaticDeclaration.
	 *
	 * If you declared your method as
	 * public static void crunchifyTestMethod(int[])
	 * then you could call: StaticDeclaration.crunchifyTestMethod(arr); within main without having created an instance for it.
	 */

    public void crunchifyTestMethod(String[] crunchifyObject) {
        for (int i = 0; i < crunchifyObject.length; i++)
            System.out.println(crunchifyObject[i]);

    }

}