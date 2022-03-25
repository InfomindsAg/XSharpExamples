using System
using System.Collections.Generic
using System.Text

/// <summary>
/// The FizzBuzz class.
/// </summary>
class FizzBuzz
 
constructor()
    return

/// <summary>
/// Converts a Number to a string.
/// Any number divisible by three is replaced by the word fizz 
/// Any number divisible by five by the word buzz. 
/// Numbers divisible by three  and five become fizzbuzz.
/// Any other number is returned as number
/// </summary>
/// <param name="number"></param>
/// <returns></returns>
method Convert(number as int) as string
   
    if number % 3 == 0 .and. number  % 5 == 0
        return "FizzBuzz"
    end if 
    
    if number % 3 == 0
        return "Fizz"
    end if 
        
    if number % 5 == 0
        return "Buzz"
    end if 
        
    return number:ToString()


end class
