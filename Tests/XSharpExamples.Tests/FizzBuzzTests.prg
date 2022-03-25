using System
using System.Collections.Generic
using System.Linq
using System.Text
using XUnit
using FluentAssertions

// Docs for Assertions: https://fluentassertions.com/introduction

class FizzBuzzTests

    private Converter := FizzBuzz{} as FizzBuzz

    [Fact] ;
    method Number1ShouldReturnNumber() as void
        // Act
        var result := Converter:Convert(1)

        // Assert
        result:Should():Be("1")
    end method

    [Fact];
    method Number3ShouldReturnFizz() as void
        // Act
        var result := Converter:Convert(3)

        // Assert
        result:Should():Be("Fizz")

    [Fact];
    method Number5ShouldReturnBuzz() as void
        // Act
        var result := Converter:Convert(5)

        // Assert
        result:Should():Be("Buzz")
        
    [Fact];
    method Number15ShouldReturnBuzz() as void
        // Act
        var result := Converter:Convert(15)

        // Assert
        result:Should():Be("FizzBuzz")        
        
    [Theory];
    [InlineData(1, "1")] ;
    [InlineData(3, "Fizz")] ;
    [InlineData(5, "Buzz")] ;
    [InlineData(15, "FizzBuzz")] ;
    [InlineData(19, "19")] ;
    [InlineData(20, "Buzz")] ;
    [InlineData(21, "Fizz")] ;
    [InlineData(9, "Fizz")] ;
    [InlineData(10, "Buzz")] ;
    method Numbers(input as int, expected as string) as void
        // Arrange
        var converter := FizzBuzz{}
        
        // Act
        var result := converter:Convert(input)

        // Assert
        result:Should():Be(expected)
    end method        

end class


/* Template for a Text
    [Fact] ;
    method Name() as void
        // Arrange
        
        // Act
        
        // Assert
    end method
*/

/* Template for a Text with multiple values
    [Theory];
    [InlineData(val1, val2)] ;
    method Numbers(param1 as , param2 as ) as void
        // Arrange
        
        // Act
        
        // Assert
    end method
*/
