package code.java

import java.util.List
import java.util.Arrays
import java.util.ArrayList
class ClaseA { 

	def transformar(): Unit = {
		List < Integer > numbers=Arrays.asList(1,2,3,4,5,6)
		List < Integer > l2= new ArrayList()
		for (n <- numbers) {			
			l2.add(doubleIt(n))
		}
	}
	def forClasico(): Unit = {
		
		var i: Int = 0
		while(i < 1) {			
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


