package code.java;

import java.util.List;
import java.util.Arrays;
import java.util.ArrayList;


class ClaseA {

    // Caso 1
    List<Integer> filtrar(ArrayList<Integer> inv) {
        List<Integer> sub = new ArrayList<Integer>();

        for(Integer numero:  inv) {
            if( numero > 5) {
                sub.add(numero);
            }
        }

        return sub;
    }

    // Caso 2
    void nombres() {
        String[] players = {"Rafael", "Ana", "David", "Roger", "Andy", "Tomas", "Juan"};

        for (String player: players) {
            System.out.print(player + "; ");
        }
    }

}
