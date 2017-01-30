package code.java;

interface  InterfaceA {}
interface  InterfaceB {}
class  ClaseA {}
class  ClaseC {}

class ClaseBC extends ClaseA implements InterfaceA {
}

class ClaseBD extends code.java.ClaseC implements  InterfaceB, InterfaceA {
}

class ClaseBE extends code.java.ClaseC implements  InterfaceB, code.java.InterfaceA {
}

