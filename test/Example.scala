package code.java

class ClaseB(a: Int, b: Int) { 

}


abstract class ClaseC { 

	protected def met5(): Int
}


class ClaseA { 

		private var var1: Int = 1
		protected var var2: String = ""
		protected var var3: String = null
		val VAR4: Double = 0.9
		@transient var var5: Float = 0
		@volatile var var6: Int = 0
		val var7: ClaseB =  new ClaseB(var1,var1)
		var tipo1: Byte = 0
		var tipo2: Short = 1
		var tipo3: Char = 'a'
		var tipo4: Int = 3
		var tipo5: Long = 100000000
		var tipo6: Float = .2f
		var tipo7: Double = 0.009
		var tipo8: Boolean = false
		var tipo9: String = ""
		var tipo10: code.java.ClaseB =  new code.java.ClaseB(var1,var1)
		var tipo11: Int = 0
		var tipo12: Int = 0
		var tipo13: Int = 0
		var exp1: String = ""
		var exp2: String = exp1
		var exp3: Integer = 2
		var exp4: Integer = exp3 + 4
		var exp5: Boolean = tipo8 && false
		var exp6: Int = (1 + 2) * 50
		var exp7: ClaseB =  new ClaseB(var1,var1)
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
				{VVVVVV
		
			var var3: Int = 6
		}
		(var1 && var2)
	}
}
