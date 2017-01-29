package code.java;

class ClaseA {
}

final class ClaseB {
}

strictfp class ClaseC {


    protected strictfp class CB {
    }


    private strictfp class CC {
    }

    public static final strictfp class CD {
    }


    public static final strictfp
    class CE {
    }

    public static strictfp class CF {
    }

    public abstract strictfp
    class CG {
    }
}


strictfp class ClaseD {
}


strictfp class ClaseE {
}


final strictfp class ClaseF {
}


public class Example {
}

final strictfp class CDA {
}


final strictfp class CEA {
}

strictfp class CFA {
}

strictfp class CGA {
}


class  VVV {

}

// Interfaces

interface InterfaceA {}
abstract interface InterfaceB {}

strictfp interface InterfaceC {
}
strictfp interface InterfaceD {}
strictfp interface InterfaceE {}
abstract  interface InterfaceF {}
/*public interface Example {
}*/

// Definicion de interfaces genericas
interface Par1<T, S> {}
interface Par2<T, S extends T> {}
interface Par3<T, S extends String> {}
interface Par4<T, S extends Double> {}
interface Par5<T, S extends ClaseA, U> {}
class Par6<T, S extends ClaseA & InterfaceA & InterfaceB, U> {}
class Par7<T, S extends Integer & InterfaceA & InterfaceB, U > {}

// Herencia
interface InterfaceBA extends InterfaceA {}
interface ClaseBB extends code.java.InterfaceC {}


interface CA {}
strictfp interface CB {}
interface CC {}
//public static
strictfp interface CD {}
//public
abstract strictfp interface CE {}
strictfp interface CF {}
abstract strictfp interface CG {}
abstract interface CH {}