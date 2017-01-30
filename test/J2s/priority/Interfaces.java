package code.java;

interface InterfaceA {}

abstract interface InterfaceB {}

strictfp interface InterfaceC {}

abstract  interface InterfaceF {}

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

strictfp interface CD {}

abstract strictfp interface CE {}

abstract interface CH {}
