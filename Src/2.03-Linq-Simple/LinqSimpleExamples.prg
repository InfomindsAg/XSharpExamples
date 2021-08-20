/*	
Linq for collections with simply types
Usage: Various Tasks on collections like filters and checks
*/

using system.Text
using system.Collections.Generic
using system.Linq

class LinqSimpleExamples

	method Execute() as void strict
		Console:WriteLine("Linq with Simple Datatypes")
		Console:WriteLine("")
	
		self:DereferedExecution()
		self:Filter()
		self:Sort()
		self:Select()
		self:To()
		self:AllAndAny()
		self:FirstLast()
		return

	method DereferedExecution() as void strict
		
		local function MyFilterFunction(value as int) as logic
			return value > 2
		end function

		var list := List<int>{} { 1, 2, 3, 4, 5}
		
		// Where returns an IEnumberable<int>. This is important, because the where is non executed imediatly, but every time the enumerable is accessed.
		var filteredEnumerable := list:Where(MyFilterFunction)
		
		// the where filter will be executed
		self:Dump(filteredEnumerable)

		// the where filter will be executed again! You can set a breakpoint in the MyFilterFunction to verify this
		self:Dump(filteredEnumerable)

		// by converting the IEnumberable<int> to a List (with ToList), you can make sure, that the Filter is applied only once
		var newList := filteredEnumerable:ToList()

		// now the where will not be executed any more
		self:Dump(newList)
		
		return


	method Filter() as void strict
		var list := List<int>{} { 1, 2, 3, 4, 5}
		var result := list:Where({q => q < 4})
		
		self:Dump(result)
		return


	method Sort() as void strict
		var list := List<int>{} { 3, 4, 5, 1, 2}
		var result := list:OrderBy({q => q})
		
		self:Dump(result)

		result := list:OrderByDescending({q => q})
		
		self:Dump(result)

		return


	method Select() as void strict
		var list := List<int>{} { 1, 2, 3, 4}
		var result := list:Select({q => String.Format("Person {0}", q)})
		
		self:Dump(result)

		return

	method To() as void strict
		var result := List<int>{} { 2, 1, 3 }:OrderBy({q => q})
		var resultTwoValues := result:Select({q => class{ number := q, square := q * q }})
		
		local newList := result:ToList() as List<int>
		local newArray := result:ToArray() as int[]
		local newHashset := result:ToHashset() as Hashset<int>
		
		local newDictionary := resultTwoValues:ToDictionary({q => q:number}, {q => q:square}) as Dictionary<int, int>
		
		self:Dump(newList)
		self:Dump(newArray)
		self:Dump(newHashset)
		self:Dump(newDictionary)

		return


	method AllAndAny() as void strict
		var data := List<int>{} { 1, 2, 3, 4, 5 }

		var anyNumberLowerThen3 := data:Any({q => q < 3})
		Console.WriteLine(i"Any number lower then 3: {anyNumberLowerThen3}")

		var allNumbersLowerThen3 := data:All({q => q < 3})
		Console.WriteLine(i"All numbers lower then 3: {allNumbersLowerThen3}")

		return

	method FirstLast() as void strict
		var data := List<int>{} { 1, 2, 3, 4, 5 }

		// Throws an exception, if Data is empty
		Console.WriteLine(data:First()) // = 1
		Console.WriteLine(data:Last()) // = 5

		// returns the default, if Data is empty
		Console.WriteLine(data:FirstOrDefault()) // = 1
		Console.WriteLine(data:LastOrDefault()) // = 5

		Console.WriteLine(data:FirstOrDefault({q => q < 3})) // = 1
		Console.WriteLine(data:LastOrDefault({q => q < 3})) // = 2

		Console.WriteLine(data:FirstOrDefault({q => q > 10})) // = 0
		return


	// Private helper method to print the elements of an enumerable collection
	private method Dump<T>(collection as IEnumerable<T>) as void strict
		foreach var item in collection
			Console.WriteLine(item)
		next


end class