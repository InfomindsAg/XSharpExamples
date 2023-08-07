using System.Collections.Generic

/*	
Generic List
Usage: When you need a list of Elements of a certain type (simple type, class)
Documentation: https://docs.microsoft.com/en-us/dotnet/api/system.collections.generic.list-1?view=netframework-4.7.2
*/

class ListSimpleExamples

	method Execute() as void strict
		Console.WriteLine("Simple List examples")
		Console.WriteLine("")
		
		self:ListWithIntegers()
		self:ListWithDateTimes()
		self:ListStringAndStringJoin()
		return


	method ListWithIntegers() as void strict
		// Creates a list with integers
		var list := List<int>{}
		
		// Add Elements
		list:Add(10)
		list:Add(20)
		list:Add(30)
		list:Add(40)
		list:Add(50)
	
		// iterate trougth the list and output it's values
		// WARNING! The first element of the List has the Index 0
		for var i := 0 upto list:Count -1
			Console.WriteLine(list[i])
		next
		
		// Remove the value 1
		var success := list:Remove(1)
		Console.WriteLine(string.Format("Success {0}, Count {1}", success, list:Count))

		// Remove the element with the index 0
		list:RemoveAt(0)
		Console.WriteLine(string.Format("First Element {0}", list[0]))
		
		// Insert a the value -1 before the first element
		list:Insert(0, 99)
		Console.WriteLine(string.Format("First Element {0}", list[0]))

		// Find an element in the List
		var index := list:IndexOf(40)
		if index > -1
			Console.WriteLine(string.Format("Element 40 found at index {0}", index))
		endif

		// Sort values
		list:Sort()

		// iterate trougth the list using foreach 
		foreach var item in list
			Console.WriteLine(item)
		next

		return


	method ListWithDateTimes() as void strict
		// Creates a list with DateTimes
		var list := List<DateTime>{}
		
		// Add Elements (Today, Tomorrow, ...)
		list:Add(DateTime.Today)
		list:Add(DateTime.Today:AddDays(1))
		list:Add(DateTime.Today:AddDays(2))
		list:Add(DateTime.Today:AddDays(3))
		list:Add(DateTime.Today:AddDays(4))
	
		// iterate trougth the list and output it's values
		// WARNING! The first element of the List has the Index 0
		for var i := 0 upto list:Count -1
			Console.WriteLine(list[i])
		next
		
		// Remove the value Today
		var success := list:Remove(DateTime.Today)
		Console.WriteLine(string.Format("Success {0}, Count {1}", success, list:Count))

		// Remove the element with the index 0
		list:RemoveAt(0)
		Console.WriteLine(string.Format("First Element {0}", [0]))
		
		// Insert a the value Yesterday before the first element
		list:Insert(0, DateTime.Today:AddDays(-1))
		Console.WriteLine(string.Format("First Element {0}", list[0]))

		// Find an element in the List
		var searchValue := DateTime.Today:AddDays(3)
		var index := list:IndexOf(searchValue)
		if index > -1
			Console.WriteLine(string.Format("Element {0} found at index {1}", searchValue, index))
		endif

		// iterate trougth the list using foreach 
		foreach var item in list
			Console.WriteLine(item)
		next

		return


	method ListStringAndStringJoin() as void strict
		// Creates a list with strings
		var list := List<string>{} { "1th", "2nd", "3rd" }

		// Join al the elements in the List of String using the separator -|-
		var joinedString := string.Join("-|-", list)
		Console.WriteLine(joinedString)
		
		// Clear the list and add only one element
		list:clear()
		list:Add("Only element")
		
		// Join al the elements in the List of String using the separator -|-
		joinedString := string.Join("-|-", list)
		Console.WriteLine(joinedString)

		return



end class