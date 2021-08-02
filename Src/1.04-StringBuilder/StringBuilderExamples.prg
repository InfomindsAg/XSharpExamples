using System.Text

/*	
StringBuilder
Usage: When you have to perform a series of string concatenations (ex. build the content of a file, construct a error message, ...)
Documentation: https://docs.microsoft.com/en-us/dotnet/api/system.text.stringbuilder?view=netframework-4.7.2
*/

public class StringBuilderExamples

	method Execute() as void strict
		Console:WriteLine("Stringbuilder Examples")
		Console:WriteLine("")
		
		self:ConcatenateNoLineBreaks()
		self:ConcatenateWithLineBreaks()
		self:FluentApi()
		self:FluentApiMultiLine()
		self:Clear()
		self:AppendFormat()
		self:InsertAndRemove()
		return
	
	
	method ConcatenateNoLineBreaks() as void strict
		// Concatenates strings (without line breaks)
		var sb := StringBuilder{}
		
		sb:Append("Concatenate some ")
		sb:Append("text with the number ")
		sb:Append(5)
		sb:Append("in it")
		
		// Convert the content of the StringBuilder to a string
		var result := sb:ToString()
		Console.WriteLine(result)
	
	
	method ConcatenateWithLineBreaks() as void strict
		// Concatenates strings (with line breaks)
		var sb := StringBuilder{}
		
		sb:AppendLine("1. Line")
		sb:AppendLine("2. Line")
		sb:AppendLine("3. Line")
		sb:AppendLine("4. Line")
		
		Console.WriteLine(sb:ToString())
	
	method FluentApi() as void strict
		// Concatenates strings (fluent approach - method concatenation)
		var sb := StringBuilder{}
		
		sb:Append("Concatenate "):Append("some "):Append("text"):AppendLine()
		
		Console.WriteLine(sb:ToString())
	
	method FluentApiMultiLine() as void strict
		// Concatenates strings (fluent approach, multiple lines)
		var sb := StringBuilder{}
		
		sb:AppendLine("1. Line");
			:AppendLine("2. Line");
			:AppendLine("3. Line");
			:AppendLine("4. Line")
		
		Console.WriteLine(sb:ToString())
	
	method Clear() as void strict
		// Clear the content of the stringbuilder to start over
		var sb := StringBuilder{}
		
		sb:AppendLine("Add some stuff")
		sb:Clear()
		sb:AppendLine("Add some new stuff")
		
		Console.WriteLine(sb:ToString())
	
	method AppendFormat() as void strict
		// Adds a Text with placeholders, that will be replaced with variables
		var sb := StringBuilder{}
		
		// Custom Date and Time to Sting formatting https://docs.microsoft.com/en-us/dotnet/standard/base-types/custom-date-and-time-format-strings
		
		var today := DateTime.Today
		var now := DateTime.Now

		sb:AppendFormat("Current Date/Time with ToString: {0} / {1}", today:ToString("dd.MM.yyyy"), Now:ToString("HH:mm:ss"))

		sb:AppendLine():AppendLine("---")
	
		sb:AppendFormat("Current Date/Time with format in placeholder: {0:dd.MM.yyyy} / {1:HH:mm:ss}", today, Now)
		
		Console.WriteLine(sb:ToString())
	
	
	method InsertAndRemove() as void strict
		// Inserts and removes Parts of the String
		// WARNING! The first character in the string has the Index 0
		var sb := StringBuilder{}
		
		//         0....5....10 
		sb:Append("This is a c# example")
		
		sb:Remove(10, 2) // <- Removes c#
		sb:Insert(10, "XSharp")

		Console.WriteLine(sb:ToString())
	
end class