using System
using System.Collections.Generic
using System.Text

class NextXMasBadExample

    // This is bad for unit tests, because it is an external dependency. The output depends on something, that we can not control
    method Get() as DateTime
        var currentDay := DateTime.Today
        var xmas := DateTime{currentDay:Year, 12, 24}
        if xmas < currentDay
            return xmas:AddYears(1)
        endif 

        return xmas


end class

