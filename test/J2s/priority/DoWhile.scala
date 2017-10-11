package code.java

object DoWhileDemo { 

	def main(args: Array[String]): Unit = {
		var count: Int = 1
		do {			
				System.out.println("Count is: " + count)
				count += 1
		}
		while ( count < 11 )
		var x: Int = 10
		do {			
				System.out.print("value of x : " + x)
				x += 1
				System.out.print("\n")
		}
		while ( x < 20 )
	}
}

class DoWhileDemo { 
import DoWhileDemo._
}


