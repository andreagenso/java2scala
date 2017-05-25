package java.util

abstract class AbstractSequentialList()[E] extends AbstractList[E]  { 

	def get(index: Int): E = {
		
	}
	def set(index: Int, element: E): E = {
		
	}
	def add(index: Int, element: E): Unit = {
		
	}
	def remove(index: Int): E = {
		
	}
	def addAll(index: Int, c: Collection[E]): Boolean = {
		
	}
	def iterator(): Iterator[E] = {
		listIterator()
	}
	def listIterator(index: Int): ListIterator[E]
}


