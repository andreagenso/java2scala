package code.java

class ClaseB(a: Int, b: Int) { 

}


abstract class ClaseC { 

	protected def met5(): Int
}


class ClaseA { 

		var d: Boolean = met1()
	def met1(): Boolean = {
		true
	}
	private def met2(): Int = {
			var b: Int = 5
			var a: Int = 5
		(a + b)
	}
	protected def met3(a: Int, b: Int): code.java.ClaseB = {
		( new ClaseB(a,3))
	}
	final protected def met4(a: Int, b: Int): Int = {
			var res: Int = a * b
		res
	}
	def met6(a: String): String = {
		"sinch"
	}
	@native
	def met7(): Int
	@scala.annotation.strictfp
	private def met8(): Int = {
		10
	}
	private def met9(): Unit = {
	}
	private def met10(): Boolean = {
			var var1: Boolean = true
			var var2: Boolean = false
				
		System.out.println("metodo 10")
		(var1 && var2)
	}
}


