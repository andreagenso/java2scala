package code.java

import scala.collection.JavaConvertions._
import java.util.List
import java.util.Arrays
import java.util.ArrayList

class ClaseA { 

	def transformar(): Unit = {
		List < Integer > numbers=Arrays.asList(1,2,3,4,5,6)
		for (n <- numbers) {			
			l2.add(doubleIt(n))
		}
	}

	def transformar2(): Unit = {
		List < Integer > numbers=Arrays.asList(1,2,3,4,5,6)
		for (n <- numbers) {			
			l2.add(doubleIt(n))
		}
	}

}
