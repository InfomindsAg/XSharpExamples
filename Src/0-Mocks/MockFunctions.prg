/// <summary>
/// Get a string from a resource or return the passed string
/// </summary>
/// <param name="uMsg">If numerical -> Get the string-resource, if string return the string-instance</param>
/// <param name="uParam1">Replace '%1' inside the main Text with this value (if specified) - the function Msg will be called for this value.</param>
/// <param name="uParam2">Replace '%2' inside the main Text with this value (if specified) - the function Msg will be called for this value.</param>
/// <param name="uParam3">Replace '%3' inside the main Text with this value (if specified) - the function Msg will be called for this value.</param>
/// <returns>The resulting string.</returns>
function Msg (uMsg as usual, uParam1 := nil as usual, uParam2 := nil as usual,uParam3 := nil as usual) as string
   local cMsg as string
   if IsString(uMsg)
      cMsg := uMsg
   elseif IsNumeric(uMsg)
      local res := uMsg as int
      switch res
         case ID_NAME
            cMsg := "name"
         case ID_AGE
            cMsg := "age"
         case ID_PROFESSION
            cMsg := "profession"
         otherwise
            cMsg := res.ToString()
      end switch
   else
      // In real function here would be the handling of different cases
      cMsg := AsString(uMsg)
   endif
   if !IsNil(uParam1)
      cMsg := cMsg.Replace("%1", Msg(uParam1))
      if !IsNil(uParam2)
         cMsg := cMsg.Replace("%2", Msg(uParam2))
         if !IsNil(uParam3)
            cMsg := cMsg.Replace("%3", Msg(uParam3))
         endif
      endif
   endif
   return cMsg