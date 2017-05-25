package code.java;

class ClaseA {
}

final class ClaseB {
}

strictfp class ClaseC {
}

final strictfp class ClaseF {
}

public class Clases {
}

final strictfp class CDA {
}

strictfp class CFA {
}

abstract strictfp class CGA {
}

class  CHA {
}

// Definicion de clases genericas
class Par1<T, S> {
}

class Par2<T, S extends T> {
}

class Par3<T, S extends String> {
}

class Par4<T, S extends Double> {
}

class Par5<T, S extends ClaseA, U> {
}

interface InterfaceA {}

interface InterfaceB {}

class Par6<T, S extends ClaseA & InterfaceA & InterfaceB, U> {
}

class Par7<T, S extends Integer & InterfaceA & InterfaceB, U > {
}

// Herencia
class ClaseBA extends ClaseA {
}

class ClaseBB extends code.java.ClaseC {
}

// Interfaces
class ClaseBC extends ClaseA implements InterfaceA {
}

class ClaseBD extends code.java.ClaseC implements  InterfaceB, InterfaceA {
}

class ClaseBE extends code.java.ClaseC implements  InterfaceB, code.java.InterfaceA {
}
