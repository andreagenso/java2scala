package code.java
class ClaseBA extends ClaseA { 
} 

class ClaseBB extends code.java.ClaseC { 
} 

class Par1[T, S] { 
} 

class Par2[T, S <: T] { 
} 

class Par5[T, S <: ClaseA, U] { 
} 

class Par6[T, S <: ClaseA with InterfaceA with InterfaceB, U] { 
} 

class Par7[T, S <: Integer with InterfaceA with InterfaceB, U] { 
} 

