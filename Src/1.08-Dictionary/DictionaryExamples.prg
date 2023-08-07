/*	
Dictionary
Usage: Key-value store. Can check very fast, if the store contains a key and retrieve the value of that key. 
Is useful for lookups
WARNING! The Keys care added using the HashValue! They must be unique
Documentation: https://docs.microsoft.com/en-us/dotnet/api/system.collections.generic.dictionary-2?view=net-5.0
*/

using system.collections.generic

class DictionaryExamples

	method Execute() as void strict
		Console.WriteLine("Dictionary examples")
		Console.WriteLine("")
		
		self:KeyValueSimple()
		self:KeyValueObject()
		return
	
	method KeyValueSimple() as void strict
		var dictionary := Dictionary<int, string>{}
		
		// Add values
		dictionary:Add(1, "One")
		dictionary:Add(2, "Two")
		dictionary:Add(10, "Ten")
		
		// Add or replace values
		dictionary[1] := "Eins"
		dictionary[2] := "Zwei"
		dictionary[10] := "Zehn"
		dictionary[3] := "Drei"
		
		// Check if a value exists
		if !dictionary:ContainsKey(5)
			Console.WriteLine("Dictionary doesn't contain value 5")
		endif
		
		// Check if a value exists and get the value
		if dictionary:ContainsKey(10)
			Console.WriteLine(dictionary[10])
		endif
		
		// Alternative syntax
		if dictionary:TryGetValue(10, out var textValue)
			Console.WriteLine(textValue)
		endif
		
		return
	
	method KeyValueObject() as void strict
		var dictionary := Dictionary<string, List<string>>{}
		
		var data := List<string> {} { "A-1", "B-1", "A-2", "C-1", "C-3" }
		
		// Group the values after the - on the value bevor the -
		foreach var item in data
			
			var values := item:Split(c"-")
			// WARNING! Arrays start with 1, Lists start with 0!
			var key := Values[1]
			var value := Values[2]
			
			// make sure, that the list for the group value exists
			if !dictionary:ContainsKey(key)
				dictionary[key] := List<string>{}
			endif
			
			dictionary[key]:Add(value)
		next
		
		// Loop over the keys of the Dictionary
		foreach var item in dictionary:Keys
			var text := string.Join(", ", dictionary[item])
			Console.WriteLine(i"{item} => {text}")
		next
		
		return
	
	
end class