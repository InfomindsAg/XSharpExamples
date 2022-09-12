using System
using System.Collections.Generic
using System.Text

/// <summary>
/// Example class for benchmarcs.
/// </summary>
class ExampleForBenchmark

    private method Setup() as List<string>
        var result := List<string>{}
        
        for var i := 1 to 200
            result.Add(ie"Art Article - {i}")
            for var j := 1 to 15
                result.Add(ie"Qty {j}")
            next
        next
        return result        
        
    
    constructor()
        return

    method OutputStart() as void
        Console.WriteLine("Output -> base")
        Console.WriteLine(self:Start())
        Console.WriteLine("Output <- base")
        return

    method OutputFinal() as void
        Console.WriteLine("Output -> optimized")
        Console.WriteLine(self:Opt3StringComparison())
        Console.WriteLine("Output <- optimized")
        return

    method Start() as string
        var data := self:Setup()
        local result as string
        local checker := LineType{} as object
        var firstQuantity := false
        result := ""
        
        for var i := 0 to data.Count - 1
            var item := data[i]
            var key := checker.Get(item)
            var value := substr(item, 5)
            if key == 1
                if !Empty(result)
                    result += e"\r\n"
                endif
                result += value + e"\r\n"
                firstQuantity := true
            elseif key == 2
                if firstQuantity
                    result += " -> "
                    firstQuantity := false
                else
                    result += ","
                endif
                result += value
            endif 
        next
        
        return result

    method Opt1NoLateBound() as string
        var data := self:Setup()
        local result as string
        var checker := LineType{} // <- LineChecker is now typed
        var firstQuantity := false
        result := ""
        
        for var i := 0 to data.Count - 1
            var item := data[i]
            var key := checker.Get(item)
            var value := substr(item, 5)
            if key == 1
                if !Empty(result)
                    result += e"\r\n"
                endif
                result += value + e"\r\n"
                firstQuantity := true
            elseif key == 2
                if firstQuantity
                    result += " -> "
                    firstQuantity := false
                else
                    result += ","
                endif
                result += value
            endif 
        next
        return result

    method Opt2UseStringBuilder() as string
        var data := self:Setup()
        var result := StringBuilder{} // <-- use Stirngbuilder
        var checker := LineType{}
        var firstQuantity := false
        
        for var i := 0 to data.Count - 1
            var item := data[i]
            var key := checker.Get(item)
            var value := substr(item, 5)
            if key == 1
                if result.Length > 0
                    result.AppendLine()
                endif
                result.AppendLine(value)
                firstQuantity := true
            elseif key == 2
                if firstQuantity
                    result.Append(" -> ")
                    firstQuantity := false
                else
                    result.Append(",")
                endif
                result.Append(value)
            endif 
        next
        return result.ToString()

    method Opt3StringComparison() as string
        var data := self:Setup()
        var result := StringBuilder{} 
        var checker := LineType{}
        var firstQuantity := false
        
        for var i := 0 to data.Count - 1
            var item := data[i]
            var key := checker.GetOpt(item) // <-- Use Optimizied Get LineType with StartsWith and StirngComparison
            var value := substr(item, 5)
            if key == 1
                if result.Length > 0
                    result.AppendLine()
                endif
                result.AppendLine(value)
                firstQuantity := true
            elseif key == 2
                if firstQuantity
                    result.Append(" -> ")
                    firstQuantity := false
                else
                    result.Append(",")
                endif
                result.Append(value)
            endif 
        next
        return result.ToString()

    class LineType
    
        method Get(line as usual) as usual
            var key := lower(substr(line, 1, 3))
            if key == "art"
                return 1
            elseif key == "qty"
                return 2
            endif 
            return 0

        method GetOpt(line as string) as int
            if !string.IsNullOrEmpty(line)
                if line.StartsWith("art", StringComparison.OrdinalIgnoreCase)
                    return 1
                elseif line.StartsWith("qty", StringComparison.OrdinalIgnoreCase)
                    return 2
                endif 
            endif
            return 0

    end class

end class

