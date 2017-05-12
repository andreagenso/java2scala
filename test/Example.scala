package code.java

object Switch { 

	def main(args: Array[String]): Unit = {
		var month: Int = 8
		var monthString: String = null
		(month) match {
			case 1 =>
			monthString="January"
			//todo: break is not supported
			case 2 =>
			monthString="February"
			//todo: break is not supported
			case 3 =>
			monthString="March"
			//todo: break is not supported
			case 4 =>
			monthString="April"
			//todo: break is not supported
			case 5 =>
			monthString="May"
			//todo: break is not supported
			case 6 =>
			monthString="June"
			//todo: break is not supported
			case 7 =>
			monthString="July"
			//todo: break is not supported
			case 8 =>
			monthString="August"
			//todo: break is not supported
			case 9 =>
			monthString="September"
			//todo: break is not supported
			case 10 =>
			monthString="October"
			//todo: break is not supported
			case 11 =>
			monthString="November"
			//todo: break is not supported
			case 12 =>
			monthString="December"
			//todo: break is not supported
			case _ =>
			monthString="Invalid month"
			//todo: break is not supported

		}
		System.out.println(monthString)
	}
}

class Switch { 
import Switch._
}


