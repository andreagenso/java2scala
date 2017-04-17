package code.java;

import java.util.List;
import java.util.Arrays;
import java.util.ArrayList;

class ClaseA {
    void transformar() {
        List<Integer> numbers = Arrays.asList(1, 2, 3, 4, 5, 6);
        List<Integer> l2 = new  ArrayList<Integer>();

        for (int n : numbers) {
            l2.add(n);
        }
    }

    void nombres() {

        String[] players = {"Rafael", "Ana", "David",
                "Roger", "Andy", "Tomas", "Juan"};

        for (String player: players) {
            System.out.print(player + "; ");
        }
    }

    List<Integer> filtrar(ArrayList<Integer> inv) {

        List<Integer> sub = new ArrayList<Integer>();

        for(Integer numero:  inv) {
            if( numero > 5) {
                sub.add(numero);
            }
        }
        return sub;
    }
}
