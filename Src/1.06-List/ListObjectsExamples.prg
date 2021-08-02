using System.Collections.Generic

/*	
Generic List
Usage: When you need a list of Elements of a certain type (simple type, class)
Documentation: https://docs.microsoft.com/en-us/dotnet/api/system.collections.generic.list-1?view=netframework-4.7.2
*/

class ListObjectsExamples

	#region private class for list
	
	private class Person
		property FirstName as string auto
		property LastName as string auto
	end class
	
	#endregion 
	
	method Execute() as void strict
		Console:WriteLine("List with Objects examples")
		Console:WriteLine("")
		
		self:ListWithObject()
		self:ListWithListWithInt()
		return
	
	
	method ListWithObject() as void strict
		// Creates a list with Persons
		// Initialisation using initializer syntax
		var list := List<Person>{} { ;
			Person{} { FirstName := "Max", LastName := "Mustermann" }, ;
			Person{} { FirstName := "Pinco", LastName := "Pallino" } ;
		}
		
		// iterate trougth the list and output it's values
		// WARNING! The first element of the List has the Index 0
		for var i := 0 upto list:Count -1
			console:WriteLine(i"{list[i]:FirstName} - {list[i]:LastName}")
		next
		
		// Add object Max Musterman again
		var maxMusterman := list[0]
		list:Add(maxMusterman)
		
		// Change the Name from Max to Maximilian
		maxMusterman:FirstName := "Maximilian"
		
		// iterate trougth the list using foreach 
		foreach var item in list
			// Interpolated syntax -> same as String.Format
			console:WriteLine(i"{item:FirstName} - {item:LastName}")
		next
		
		// Search for first Object with name Pinco
		var pinco := list:Find({ q => q:FirstName == "Pinco" })
		if pinco != null
			console:WriteLine(i"{pinco:FirstName} - {pinco:LastName}")
		endif
		
		return
		
	method ListWithListWithInt() as void strict
		var list := List<List<int>>{}
		
		list:Add(List<int>{} {1, 2, 3 })
		list:Add(List<int>{} {11, 12, 13 })
		
		foreach var innerList in list
			foreach var item in innerList
				Console:WriteLine(item)
			next
			Console:WriteLine("----")
		next
	
end class