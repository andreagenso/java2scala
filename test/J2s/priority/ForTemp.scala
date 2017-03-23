package code.java

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

}
