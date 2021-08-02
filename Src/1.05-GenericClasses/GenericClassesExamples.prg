/*	
Generic Classes
Usage: When you want to create a class, where you can pass one or more data types as parameter (ex: List of int, List of String, ...)
Documentation: https://www.xsharp.eu/help/generics-example.html
*/

class GenericClassesExamples

	// Defines a class, that takes eine Type parameter called T
	private class TwoValues<T>
		property Value1 as T auto
		property Value2 as T auto
		
		method Swap() as void 
			local buffer as T
			buffer := Value1
			Value1 := Value2
			Value2 := Buffer
			return
			
		end class

	method Execute() as void strict
		Console:WriteLine("Generic classes examples")
		Console:WriteLine("")
		
		self:UseGenericClass()
		return

	method UseGenericClass() as void strict
		var TwoStrings := TwoValues<string>{} { Value1 := "A", Value2 := "B" }
		TwoStrings:Swap()
		
		Console:WriteLine(i"Value 1 = {TwoStrings:Value1}, Value 2 = {TwoStrings:Value2}")
		
		var TwoInts := TwoValues<int>{} { Value1 := 1, Value2 := 2 }
		TwoInts:Swap()
		
		Console:WriteLine(i"Value 1 = {TwoInts:Value1}, Value 2 = {TwoInts:Value2}")
		
		return


end class