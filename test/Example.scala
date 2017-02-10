package code.java



class ClaseB { 
}


class ClaseA { 

		private var var1: Int = 1
		protected var var2: String = ""
		protected var var3: String = null
		val VAR4: Double = 0.9
		@transient var var5: Float = 0
		@volatile var var6: Int = 0
		var var7: ClaseB =  new ClaseB(var1,var1)

	var tipo1: Byte = 0
		var tipo2: Short = 1
		var tipo3: Char = 'a'
		var tipo4: Int = 3
		var tipo5: Long = 100000000
		var tipo6: Float = .2f
		var tipo7: Double = 0.009
		var tipo8: Boolean = False
		var tipo9: String = ""
		var tipo10: code.java.ClaseB =  new code.java.ClaseB(var1,var1)
		var tipo11: Int = 0
		var tipo12: Int = 0
		var tipo13: Int = 0

		var exp1: String = ""
		var exp2: String = exp1
		var exp3: Integer = 2
		var exp4: Integer = exp3 + 4
		var exp5: Boolean = tipo8 && False
		var exp6: Int = (1 + 2) * 50
		var exp7: ClaseB =  new ClaseB(var1,var1)


		var d: Boolean = met1()

		def met1: Boolean = {
			true
		}

}


