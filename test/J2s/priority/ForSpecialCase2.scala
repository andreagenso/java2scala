package code.java

import scala.collection.JavaConversions._
import java.util.List
import java.util.Arrays
import java.util.ArrayList
class ClaseA { 

	def filtrar(inv: ArrayList[Integer]): List[Integer] = {
		var sub: List[Integer] =  new ArrayList[Integer] ()
		inv.filter(numero => (numero > 5))
		.foreach(numero => 				
					sub.add(numero))
		sub
	}
	def transformar(): Unit = {
		var numbers: List[Integer] = Arrays.asList(1,2,3,4,5,6)
		var l2: List[Integer] =  new ArrayList[Integer] ()
		numbers.foreach(n =>			
			l2.add(n))
	}
	def nombres(): Unit = {
		var players: Array[String] = Array("Rafael", "Ana", "David", "Roger", "Andy", "Tomas", "Juan")
		players.foreach(player => 			
			System.out.print(player + "; "))
	}
}


