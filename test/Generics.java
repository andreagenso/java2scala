// Definicion de clases genericas
class Par1<T, S> {
    T fst; S snd;
    Par1(T f, S s) {fst = f; snd = s;}
}

class Par2<T, S extends T> {
    T fst; S snd;
    Par2(T f, S s) {fst = f; snd = s;}
}

class Par3<T, S extends String> {
    T fst; S snd;
    Par3(T f, S s) {fst = f; snd = s;}
}

class Par4<T, S extends Double> {
    T fst; S snd;
    Par4(T f, S s) {fst = f; snd = s;}
}

class Par5<T, S extends ClaseA, U> {
    T fst; S snd; U aux;
    Par5(T f, S s, U u) {fst = f; snd = s; aux =u;}
}

interface InterfaceA {

}

interface InterfaceB {

}

class Par6<T, S extends ClaseA & InterfaceA & InterfaceB, U> {
    T fst; S snd; U aux;
    Par6(T f, S s, U u) {fst = f; snd = s; aux =u;}
}

class Par7<T, S extends Integer & InterfaceA & InterfaceB, U > {
    T fst; S snd; U aux;
    Par7(T f, S s, U u) {fst = f; snd = s; aux =u;}
}