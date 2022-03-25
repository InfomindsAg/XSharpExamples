using System

class StringFunctionExamples

	method Execute() as void strict
        self:ExecuteNullChecks()

        self:ExecuteTrim()
      

        return

    method ExecuteNullChecks() as void strict
        
        local procedure CheckIfNullOrEmpty(text as string)
            var isNullOrEmptyVo := text == null .or. text == ""  // VO Function
            var isNullOrEmptyDn := string.IsNullOrEmpty(text)
            Console:WriteLine(i"Is null or empty? {isNullOrEmptyVo} / {isNullOrEmptyDn}")
        end procedure

        local procedure CheckIfNullOrWhitespace(text as string)
            var isNullOrWhitespaceVo := Empty(text) // VO Function
            var isNullOrWhitespaceDn := string.IsNullOrWhitespace(text)
            Console:WriteLine(i"Is null or whitespace? {isNullOrWhitespaceVo} / {isNullOrWhitespaceDn}")
        end procedure

        CheckIfNullOrEmpty(null)
        CheckIfNullOrEmpty("")
        CheckIfNullOrEmpty("    ")
        CheckIfNullOrEmpty("x")
        
        CheckIfNullOrWhitespace(null)
        CheckIfNullOrWhitespace("")
        CheckIfNullOrWhitespace("    ")
        CheckIfNullOrWhitespace("x")

        return



    method ExecuteTrim() as void strict
        var text := "   string   "
        local newTextVo as string
        local newTextDn as string
        
        // Trim the spaces on both ends of a string
        newTextVo := AllTrim(Text) // VO Function
        newTextDn := text:Trim()
        Console:WriteLine(i"Trim start and end: {newTextVo} / {newTextDn}")

        // Trim spaces at end of a string
        newTextVo := Trim(Text) // VO Function (alternative RTrim)
        newTextDn := text:TrimEnd()
        Console:WriteLine(i"Trim end: {newTextVo} / {newTextDn}")

        // Trim spaces at begin of a string
        newTextVo := LTrim(Text) // VO Function
        newTextDn := text:TrimStart()
        Console:WriteLine(i"Trim start: {newTextVo} / {newTextDn}")

        // Trim aother character then space
        text := "..--string--.."

        // Trim . on both ends of a string
        newTextDn := text:Trim(c".")
        Console:WriteLine(i"Trim start and end: {newTextVo} / {newTextDn}")

        // Trim . at end of a string
        newTextDn := text:TrimEnd(c".")
        Console:WriteLine(i"Trim end: {newTextVo} / {newTextDn}")

        // Trim . at begin of a string
        newTextDn := text:TrimStart(c".")
        Console:WriteLine(i"Trim start: {newTextVo} / {newTextDn}")


        // Trim other characters then space
        text := "..--string--.."

        // Trim . and - on both ends of a string
        var trimChars := <char>{c"-", c"."}
        newTextDn := text:Trim(trimChars)
        Console:WriteLine(i"Trim start and end: {newTextVo} / {newTextDn}")

        // Trim . and - at end of a string
        newTextDn := text:TrimEnd(trimChars)
        Console:WriteLine(i"Trim end: {newTextVo} / {newTextDn}")

        // Trim . and - at begin of a string
        newTextDn := text:TrimStart(trimChars)
        Console:WriteLine(i"Trim start: {newTextVo} / {newTextDn}")

        

        return 

end class