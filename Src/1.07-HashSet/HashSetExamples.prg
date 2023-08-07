/*	
HashSets
Usage: Contains a list of non duplicate Values. Can check very fast, if the list contains a value or not. 
Is useful, if you must check, if a certain value in a long list of values exists (ex. check if value is duplicate, ...)
WARNING! The values are added using the HashValue!
Documentation: https://docs.microsoft.com/en-us/dotnet/api/system.collections.generic.hashset-1?view=netframework-4.7.2
*/

using system.collections.generic

class HashSetExamples

	method Execute() as void strict
		Console.WriteLine("HashSet examples")
		Console.WriteLine("")
		
		self:CheckExists()
		return
		
	method CheckExists() as void strict
		var hashSetInt := Hashset<int>{}
		hashSetInt:Add(1)
		hashSetInt:Add(1)
		hashSetInt:Add(2)
		hashSetInt:Add(4)
		
		Console.WriteLine(i"Hashset count = {hashSetInt:Count}")
		
		for var i := 1 upto 4
			if !hashSetInt:Contains(i)
				Console.WriteLine(i"HashSet doen't contains {I}")
			endif
		next
		
		return
		
		
end class