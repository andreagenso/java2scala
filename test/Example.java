package code.java;


class ClaseC {
    public  static void main() {
        System.out.println(" AAAA");
    }
}



class ClaseB {
    ClaseB(int a, int b){}
}

class ClaseA {

    // modificadores
    private static  int var1 = 1;
    protected String var2 = "";
    protected String var3;
    static final double VAR4 = 0.9;

    transient float var5;

    static volatile int var6 = 0;

    public static final ClaseB var7 = new ClaseB(var1, var1);

    // Type
    byte tipo1;
    short tipo2 = 1;
    char tipo3 = 'a';
    int tipo4 = 3;
    long tipo5 = 100000000;
    float tipo6 = .2f;
    double tipo7 = 0.009;
    boolean tipo8 = false;

    String tipo9 = "";

    code.java.ClaseB tipo10 = new code.java.ClaseB(var1, var1);

    int tipo11, tipo12, tipo13;

    // expresiones de asignacion
    String exp1 = "";
    String exp2 = exp1;

    Integer exp3 = 2;
    Integer exp4 = exp3 + 4;

    boolean exp5 = tipo8 && false;

    int exp6 = (1 +2) * 50;

    ClaseB exp7 = new ClaseB(var1, var1);

    boolean d = met1();

    boolean met1() {
        return  true;
    }

    private int met2(){
        return  2;
    }

    protected  code.java.ClaseB met3(int a, int b) {
        return (new  ClaseB(a, b));
    }

    /*for(int i=0; i<10; i++){
    }*/
}

