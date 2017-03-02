package code.java

class laseA {

	var currentSpeed: Int = 100
	var isMoving: Boolean = true
	def applyBrakes(): Unit = {
		if (isMoving) {						
			currentSpeed -= 1
		}
	}
	def applyBrakes2(): Unit = {
		if (isMoving) {						
			currentSpeed -= 1
		} else {						
			System.err.println("The bicycle has already stopped!")
		}
	}
	def edad(): Unit = {
		var age: Int = 20
		if (age > 18 + 2) {						
			System.out.print("Age is greater than 18")
		}
		if (age % 18 == 0) {						
			System.out.print("Age is greater than 18")
		}
	}
}


class IfElseDemo { 

	def main(args: String): Unit = {
		var testscore: Int = 76
		var grade: Char = '\u0000'
		if (testscore >= 90) {			
			grade='A'
		} else if (testscore >= 80) {			
			grade='B'
		} else if (testscore >= 70) {			
			grade='C'
		} else if (testscore >= 60) {						
			grade='D'
		} else {						
			grade='F'
		}
		System.out.println("Grade = " + grade)
	}
}


class WhileDemo { 

	def main(args: String): Unit = {
		var count: Int = 1
		 while ( count < 11 ) {
			
			System.out.println("Count is: " + count)
			count += 1
		}
	}
}


class DoWhileDemo { 

	def main(args: String): Unit = {
		var count: Int = 1
				
		System.out.println("Count is: " + count)
		count += 1		
		System.out.println("Count is: " + count)
		count += 1
	}
}


