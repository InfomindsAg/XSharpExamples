using System
using System.Collections.Generic
using System.Linq
using System.Text
using XUnit
using FluentAssertions

class NextXMasWithProviderTests

    /// <summary>
    /// Special DataProvider for the Tests, that allows to set the current date using a property
    /// </summary>
    class DateTestProvider implements IDateProvider
    
        property CurrentDate as DateTime auto

        method GetToday() as DateTime
            return CurrentDate

    end class

    private method DayTest(currentDay as DateTime, expected as DateTime) as void
        // Arrange
        var dateProvider := DateTestProvider{} { CurrentDate := currentDay }
        var converter := NextXMasWithProvider{dateProvider}
        
        // Act
        var result := converter:Get()

        // Assert
        result:Should():Be(expected)


    [Fact];
    method Day0101() as void => DayTest(DateTime{2020, 1, 1 }, DateTime{2020, 12, 24 })

    [Fact];
    method Day2312() as void => DayTest(DateTime{2020, 12, 23 }, DateTime{2020, 12, 24 })

    [Fact];
    method Day2412() as void => DayTest(DateTime{2020, 12, 24 }, DateTime{2021, 12, 24 })

    [Fact];
    method Day2512() as void => DayTest(DateTime{2020, 12, 25 }, DateTime{2021, 12, 24 })

end class
