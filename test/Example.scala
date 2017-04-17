package code.java

import scala.collection.JavaConversions._
import java.util.List
import java.util.Arrays
import java.util.ArrayList
class ClaseA { 

	def transformar(): Unit = {
		var numbers: List[Integer] = Arrays.asList(1,2,3,4,5,6)
		var l2: List[Integer] =  new ArrayList[Integer] ()
		for (n <- numbers) {			
			l2.add(n)
		}
	}

	void nombres() {

		String[] players = {"Rafael", "Ana", "David",
			"Roger", "Andy", "Tomas", "Juan"};

		for (String player: players) {
			System.out.print(player + "; ");
		}
	}
}


