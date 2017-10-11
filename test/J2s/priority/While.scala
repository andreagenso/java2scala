package code.java

class WhileDemo { 

	def main(args: Array[String]): Unit = {
		var count: Int = 1
		while ( count < 11 ) {			
				System.out.println("Count is: " + count)
				count += 1
		}
		var shouldContinue: Boolean = true
		while ( shouldContinue == true ) {			
				System.out.println("running")
				var random: Double = Math.random() * 10D
				if (random > 5) {											
						shouldContinue=true
				} else {											
						shouldContinue=false
				}
		}
	}
}


