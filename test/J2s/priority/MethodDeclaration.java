package code.java;

class ClaseB {
    ClaseB(int a, int b){}
}

abstract class  ClaseC {
    protected abstract int met5();
}

class ClaseA {

    boolean d = met1();

    // metodos
    public boolean met1() {
        return  true;
    }

    private int met2(){
        int b = 5;
        int a = 5;

        return  (a+b);
    }

    protected  code.java.ClaseB met3(int a, int b) {
        return (new  ClaseB(a, 3));
    }

    protected final int met4(int a, int b) {
        int res = a*b;
        return res;
    }

    public synchronized String met6(String a) {
        return "sinch";
    }

    native private int met7();

    private  strictfp int met8() {
        return 10;
    }

    private  void met9() {

    }

    private boolean met10() {
        boolean var1 = true;
        boolean var2 = false;
        {
            System.out.println("metodo 10");
        }
        return (var1 && var2);
    }
}
