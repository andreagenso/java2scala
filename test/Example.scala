package code.java

object Static1 {
  private var testValue: Int = 0

  def setTestValue(testValue: Int) {
    if (testValue > 0) Static1.testValue = testValue
    System.out.println("setTestValue method: " + testValue)
  }

  var testString: Nothing = null

  def getTestString: Nothing = {
    return testString
  }

  def setTestString(testString: Nothing) {
    Static1.testString = testString
    System.out.println("setTestString method: " + testString)
  }

  def subValue(i: Int, js: Int*): Int = {
    var sum: Int = i
    for (x <- js) sum -= x
    return sum
  }

  {
    System.out.println("\nI'm static block 1..")
    setTestString("This is static block's String")
    setTestValue(2)
  }
  {
    System.out.println("\nI'm static block 2..")
  }
}

class Static1 {
  def getTestValue: Int = {
    return Static1.testValue
  }
}