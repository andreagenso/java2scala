package code.java
trait InterfaceA { 
} 

abstract trait InterfaceB { 
} 

@scala.annotation.strictfp
 trait InterfaceC { 
} 

abstract trait InterfaceF { 
} 

trait Par1[T, S] { 
} 

trait Par2[T, S <: T] { 
} 

trait Par3[T, S <: String] { 
} 

trait Par4[T, S <: Double] { 
} 

trait Par5[T, S <: ClaseA, U] { 
} 

class Par6[T, S <: ClaseA with InterfaceA with InterfaceB, U] { 
} 

class Par7[T, S <: Integer with InterfaceA with InterfaceB, U] { 
} 

trait InterfaceBA extends InterfaceA { 
} 

trait ClaseBB extends code.java.InterfaceC { 
} 

trait CA { 
} 

@scala.annotation.strictfp
 trait CB { 
} 

trait CC { 
} 

@scala.annotation.strictfp
 trait CD { 
} 

@scala.annotation.strictfp
abstract trait CE { 
} 

abstract trait CH { 
} 

