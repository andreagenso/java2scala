package code.java

import java.util.List
import java.util.Arrays
import java.util.ArrayList
import scala.collection.JavaConversions._

class ClaseA { 

	def transformar(): Unit = {
		val numbers: List[Integer] = Arrays.asList(1,2,3,4,5,6)
		val l2: List[Integer] = new ArrayList()
		for (final n: Integer <- numbers) {
			l2.add(doubleIt(n))
		}
	}
	def forClasico(): Unit = {
		
		var i: Int = 0
		while(true) {			
			System.out.println(" i es " + i)
			i += 1
		}
	}
	def doubleIt(number: Int): Int = {
		number * 2
	}
}


class ExampleStatic { 

	var a: Int = 0
	var b: Int = 9
	def main(args: String): Unit = {
		var grade: Char = 'a'
		System.out.println("Grade = " + grade)
	}
	def getNum(): Int = {
		2
	}


}


