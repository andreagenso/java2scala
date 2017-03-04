package code.java

class ClaseA { 

	var currentSpeed: Int = 100
	var isMoving: Boolean = true
	def applyBrakes(): Unit = {
		if (isMoving) {
			currentSpeed -= 1
		}
	}
}


