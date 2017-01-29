package code.java;


class ClaseBA extends ClaseA {
}
class ClaseBB extends code.java.ClaseC {
}

class Par1<T, S> {
    Par1(T fst, S snd) {
    }
}

class Par2<T, S extends T> {
    Par2(T fst, S snd) {}
}

class Par5<T, S extends ClaseA, U> {
    Par5(T fst, S snd, U aux) {}
}

class Par6<T, S extends ClaseA & InterfaceA & InterfaceB, U> {
    Par6(T fst, S snd, U aux) {}
}

class Par7<T, S extends Integer & InterfaceA & InterfaceB, U > {
    Par7(T fst, S snd, U aux) {}
}