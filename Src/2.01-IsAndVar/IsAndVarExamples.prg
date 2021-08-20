/*	
IS and Var
Usage: Checking if an object is a certain type and automaticaly create a new variable containing the checked casted to the type
*/

using system.Text
using system.Collections.Generic

class IsAndVarExamples

	method Execute() as void strict
		Console:WriteLine("Is and Var examples")
		Console:WriteLine("")
	
		self:IsForSimpleTypes()
		self:IsForObjects()
		return
	
	method IsForSimpleTypes() as void strict

		local procedure Dump(a as usual)
			if a is string var stringA
				console.WriteLine("A is a string with the value " + stringA)
			elseif a is DateTime var dateTimeA
				console.WriteLine("A is a dateTime with the value " + dateTimeA:ToShortDateString())
			else
				console.WriteLine("A is an unknown type")
			endif
				
		end procedure 
		
		Dump("Dummy String")
		
		Dump(DateTime.Now)
		return


	method IsForObjects() as void strict
		
		local procedure Dump(a as usual)
			if a is StringBuilder var stringBuilderA
				console.WriteLine("A is a StringBuilder with the value " + stringBuilderA:ToString())
			elseif a is List<string> var listStringA
				console.WriteLine("A is a List with the value " + string.Join(Environment.NewLine, listStringA))
			else
				console.WriteLine("A is an unknown type")
			endif
				
		end procedure 
		
		Dump(StringBuilder{}:AppendLine("SB1"):AppendLine("SB2"))
		
		Dump(List<string>{} {"List1", "List2"})
		return

end class