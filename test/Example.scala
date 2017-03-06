package code.java

import java.util
import java.util.List
import java.util.ArrayList
import java.util.Arrays
import scala.collection.JavaConversions._

class ClaseA {

	// Caso 1
	def filtrar(inv: ArrayList[Integer]): List[Integer] = {
		var sub: List[Integer] = new ArrayList[Integer]()
		inv.filter(numero => numero > 5).foreach(sub.add(_))
    //inv.filter(_ > 5).map(sub.add(_))
		sub
	}

	// Caso 2
	def nombres: Unit = {
		val players: Array[String] = Array("Rafael", "Ana", "David", "Roger", "Andy", "Tomas", "Juan")
		players.foreach(player => System.out.print(player + "; "))
	}

	// Caso 3
	def transformar: Unit = {
		val numbers: List[Integer] = Arrays.asList(1, 2, 3, 4, 5, 6)
		val l2 = numbers.map(n => doubleIt(n))
	}

  // Caso 4
  def forClasico: Unit = {
    var i: Int = 0
    while (i < 1) {
      {
        System.out.println(" i es " + i)
      }
      ({i += 1; i - 1})
    }
  }

  def forClasico1: Unit = {
    (0 to 9).foreach(i =>
      System.out.println(" i es " + i))
  }

	def doubleIt(number: Int): Int = {
		number * 2
	}

  // Caso 5 - transformacion generica.
  def filtrar2(inv: ArrayList[Integer]): List[Integer] = {
    var sub: List[Integer] = new ArrayList[Integer]()

    for (numero <- inv) {
      if (numero > 5) {
        sub.add(numero)
      }
    }
    sub
  }

  def nombres2: Unit = {
    val players: Array[String] = Array("Rafael", "Ana", "David", "Roger", "Andy", "Tomas", "Juan")

    for (player <- players) {
      System.out.print(player + "; ")
    }
  }

  def transformar2: Unit = {
    val numbers: List[Integer] = Arrays.asList(1, 2, 3, 4, 5, 6)
    val l2: List[Integer] = new ArrayList[Integer]()
    for (n <- numbers) {
      l2.add(doubleIt(n))
    }
  }

}
