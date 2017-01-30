package code.java
trait InterfaceA { 
} 

trait InterfaceB { 
} 

class ClaseA { 
} 

class ClaseC { 
} 

class ClaseBC extends ClaseA with InterfaceA { 
} 

class ClaseBD extends code.java.ClaseC with InterfaceB with InterfaceA { 
} 

class ClaseBE extends code.java.ClaseC with InterfaceB with code.java.InterfaceA { 
} 

