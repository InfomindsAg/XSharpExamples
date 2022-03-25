using System
using System.Collections.Generic
using System.Linq
using System.Text
using XUnit
using FluentAssertions

class NextXMasParametersTests

    private method DayTest(currentDay as DateTime, expected as DateTime) as void
        // Arrange
        var calculator := NextXMasParameters{}
        
        // Act
        var result := calculator:Get(currentDay)

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
