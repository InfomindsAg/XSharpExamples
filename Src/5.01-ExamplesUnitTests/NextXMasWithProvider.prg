using System
using System.Collections.Generic
using System.Text

/// <summary>
/// DateProvider Interface
/// </summary>
interface IDateProvider
    method GetToday() as DateTime
end interface

/// <summary>
/// DateProvider implementation
/// </summary>
class DateProvider implements IDateProvider

    method GetToday() as DateTime
        return DateTime.Today

end class


class NextXMasWithProvider

    private _DateProvider as IDateProvider

    constructor (dateProvider as IDateProvider)
        self:_DateProvider := dateProvider
        return

    // constructor with autmatic initialisation of DateProvider, so it is easier to use in the normal code
    constructor () ; self(DateProvider{})
        return

    // This is bad for unit tests, because it is an external dependency. The output depends on something, that we can not control
    method Get() as DateTime
        var currentDay := self:_DateProvider.GetToday()
        var xmas := DateTime{currentDay:Year, 12, 24}
        if xmas <= currentDay
            return xmas:AddYears(1)
        endif 
        return xmas

end class



