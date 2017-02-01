package code.java

class ClaseB {

}

class ClaseA {

  private var var1: Int = 0

  protected var var2: String = ""

  protected var var3: String = null

  val VAR4: Double = 0.0

  @transient var var5: Float = 0

  @volatile var var6: Int = 0

  val var7: ClaseB = new ClaseB()


  var tipo1: Byte = 0
  var tipo2: Short = 1
  var tipo3: Char = 'a'
  var tipo4: Int = 3
  var tipo5: Long = 100000000
  var tipo6: Float = .2f
  var tipo7: Double = 0.009
  val tipo8: Boolean = false

  var tipo9: String = ""

  var tipo10: code.java.ClaseB = new code.java.ClaseB()

  var tipo11: Int = 0
  var tipo12: Int = 0
  var tipo13: Int = 0

  var exp1: String = ""
  val exp2: String = exp1 += "exp1"

  var exp3: Integer = 2
  val exp4: Integer = exp3 *= exp3

  val exp5: Boolean = tipo8 && false

  val exp6: Int = (1 + 2) * 50

  val exp7: ClaseB = new ClaseB

  val d: Boolean = met1


  def met1: Boolean = {
    return true
  }



}



