package code.java;

import java.util.List;
import java.util.Arrays;
import java.util.ArrayList;

class ClaseA {

    // Caso 3
    void transformar() {
        List<Integer> numbers = Arrays.asList(1, 2, 3, 4, 5, 6);
        List<Integer> l2 = new ArrayList<Integer>();

        for (int n : numbers) {
            l2.add(doubleIt(n));
        }
    }

    void forClasico() {
        for(int i=0; i<1; i++) {
            System.out.println(" i es " + i);
        }
    }

    public int doubleIt(int number) {
        return number * 2;
    }
}


class ExampleStatic {
    int a = 0;
    static int b = 9;

    public static void main(String[] args) {
        char grade = 'a';
        System.out.println("Grade = " + grade);
    }

    public int getNum() {
        return 2;
    }
}