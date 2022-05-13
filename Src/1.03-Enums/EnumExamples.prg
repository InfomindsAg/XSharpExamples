/*	
Enums
Usage: Replaces magic numbers or enumeration constants
Documentation: 
- https://docs.microsoft.com/en-us/dotnet/csharp/language-reference/builtin-types/enum
- https://www.xsharp.eu/help/command_enum.html
*/

class EnumExamples

	enum Answer 
		Yes := 1
		No := 2
		Maybe := 3 
	end enum

	enum Developer 
		// When you ommit the numeric value, the Values are numbered starting with 0
		// WARNING! When you save the value somewhere, your shoud always assign the numeric value, because you the automatic numbering changes, when you change the order!
		Junior // := 0
		Senior // := 1
	end enum

	method Execute() as void strict
		Console:WriteLine("Enum Examples")
		Console:WriteLine("")
		self:UseAnswer()
		return
	
	method UseAnswer() as void strict
		
		// This is a local method, only visible inide the UseAnswer method
		local procedure WriteEnum(userAnswer as Answer) 
			switch userAnswer
			case Answer:yes
				Console:WriteLine("Yes")
			case Answer:No
				Console:WriteLine("No")
			case Answer:Maybe
				Console:WriteLine("Maybe")
			otherwise
				Console:WriteLine("Something stange -> " + userAnswer:ToString())
			end switch 
		end procedure
		
		// Assign the Enum the using the Enum definition
		var myAnswer := Answer:Yes
		WriteEnum(myAnswer)
		
		// Assign Enum using the integer value
		myAnswer := (Answer)3
		WriteEnum(myAnswer)

		// Using the Cast, you can also assign invalid values
		myAnswer := (Answer)99
		WriteEnum(myAnswer)

		return
		

end class