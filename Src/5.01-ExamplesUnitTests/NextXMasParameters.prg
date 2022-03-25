using System
using System.Collections.Generic
using System.Text

class NextXMasParameters

    // This is better for simple dependencies but not user friendly, because i always have to pass the current date
    method Get(currentDay as DateTime) as DateTime
        var xmas := DateTime{currentDay:Year, 12, 24}
        if xmas <= currentDay
            return xmas:AddYears(1)
        endif 

        return xmas

end class


