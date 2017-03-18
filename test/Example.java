package code.java;

import java.util.List;
import java.util.Arrays;
import java.util.ArrayList;

class ClaseA {

    // Caso 3
    void transformar() {
        List<Integer> numbers = Arrays.asList(1, 2, 3, 4, 5, 6);
        List<Integer> l2 = new ArrayList<Integer>();

        for (final int n : numbers) {
            l2.add(doubleIt(n));
        }
    }

    void transformar2() {
        List<Integer> numbers = Arrays.asList(1, 2, 3, 4, 5, 6);
        List<Integer> l2 = new ArrayList<Integer>();

        for (final int n : numbers) {
            l2.add(doubleIt(n));
        }
    }

}

