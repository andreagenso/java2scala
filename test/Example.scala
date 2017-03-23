package code.java

import scala.collection.JavaConvertions._
import java.util.List
import java.util.Arrays
import java.util.ArrayList
class ClaseA { 

	def transformar(): Unit = {
		var numbers: List = Arrays.asList(1,2,3,4,5,6)
		var l2: List =  new ArrayList()
		for (n <- numbers) {			
			if (n > 2) {
				System.out.println(" funciona")
			}
		}
	}
	def transformar2(): Unit = {
		var numbers: List = Arrays.asList(1,2,3,4,5,6)
		for (n <- numbers) {
		}
	}
}


