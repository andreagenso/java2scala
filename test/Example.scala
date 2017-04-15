package code.java

import scala.collection.JavaConversions._
import java.util.List
import java.util.Arrays
import java.util.ArrayList
class ClaseA { 

	def filtrar(inv: ArrayList[Integer]): List[Integer] = {
		var sub: List[Integer] =  new ArrayList[Integer] ()
		for (numero <- inv) {			
			if (numero > 5) {
								
				sub.add(numero)
			}
		}
		sub
	}
	def nombres(): Unit = {
		var players: Array[String] = Array("Rafael", "Ana", "David", "Roger", "Andy", "Tomas", "Juan")
		for (player <- players) {			
			System.out.print(player + "; ")
		}
	}
}


