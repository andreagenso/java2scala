package code.java

object Switch {
  def main(args: Array[String]) {
    val month: Int = 8
    var monthString: String = null

    (month) match {
      case 1 =>
        monthString = "January"
      case 2 =>
        monthString = "February"
      case 3 =>
        monthString = "March"
      case 4 =>
        monthString = "April"
      case 5 =>
        monthString = "May"
      case 6 =>
        monthString = "June"
      case 7 =>
        monthString = "July"
      case 8 =>
        monthString = "August"
      case 9 =>
        monthString = "September"
      case 10 =>
        monthString = "October"
      case 11 =>
        monthString = "November"
      case 12 =>
        monthString = "December"
      case _ =>
        monthString = "Invalid month"
    }
    System.out.println(monthString)
  }
}