/*	
Switch Case
Usage: Replaces if/elseif/else or do/case constructs, that check always the same Variable
WARNING! doesn't work with Symbols
Documentation: https://www.xsharp.eu/help/command_switch.html
*/

class SwitchExamples
	
	method Execute() as void strict
		Console:WriteLine("Swtich Examples")
		Console:WriteLine("")
		self:SwitchWithString()
		self:SwitchWithInt()
		return
		
	method SwitchWithInt() as void strict
		
		var element := 1
		switch element
			case 1 
				Console:WriteLine("It was 1")
			case 2
				Console:WriteLine("It was 2")
			case 3
				Console:WriteLine("It was 3")
			otherwise
				Console:WriteLine("It was something else")
		end switch
		return		
	
	method SwitchWithString() as void strict
		
		var element := "Dummy"
		
		switch element
			case "DUMMY" 
				Console:WriteLine("It was DUMMY")
			case "Dummy"
				Console:WriteLine("It was Dummy")
			otherwise
				Console:WriteLine("It was something else")
		end switch
		return

end class