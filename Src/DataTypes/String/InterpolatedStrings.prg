using System
using System.Text

class InterpolatedStrings

   property Person as tuple(Name as string, Surname as string, Age as int, Profession as string) auto := tuple{"John", "Lennon", 40, "musician"}

   method Execute() as void
      self.Readability()
      self.NewLines()
      self.KeepItSimple()
      self.FormatYourNumbers()
      self.FormatYourDates()
      self.InterpolationOrAlternative()
      return

   method Readability() as void
      // Output: name John Lennon, age 40, profession musician.
      Console.WriteLine(e"Readability1 - Simple Output-check for different synthax\r\nPress key to continue")
      Console.ReadKey()

      begin scope
      var name := "John"
      var surname := "Lennon"
      var age := 40
      var profession := "musician"

      Console.WriteLine()
      Console.WriteLine("name " +name+ " " +surname+ ", age " +age.ToString()+ ", profession " +profession+ ".")

      Console.WriteLine()
      Console.WriteLine(i"name {name} {surname}, age {age}, profession {profession}.")
      end scope

      Console.WriteLine()
      Console.WriteLine("name " +self.Person.Name+ " " +self.Person.Surname+ ", age " +self.Person.Age.ToString()+ ", profession " +self.Person.Profession+ ".")

      Console.WriteLine()
      Console.WriteLine(i"name {self.Person.Name} {self.Person.Surname}, age {self.Person.Age}, profession {self.Person.Profession}.")

      Console.WriteLine()
      Console.WriteLine(i"{Msg(555123/*ID_NAME*/)} {self.Person.Name} {self.Person.Surname}, {Msg(74231/*ID_AGE*/)} {self.Person.Age}, {Msg(76321/*ID_PROFESSION*/)} {self.Person.Profession}.")

      Console.WriteLine()
      Console.WriteLine(Msg(555123/*ID_NAME*/)+ i" {self.Person.Name} {self.Person.Surname}, " +Msg(74231/*ID_AGE*/)+ i" {self.Person.Age}, " +Msg(76321/*ID_PROFESSION*/)+ i" {self.Person.Profession}.")

      begin scope
      var name := self.Person.Name
      var surname := self.Person.Surname
      var age := self.Person.Age
      var profession := self.Person.Profession

      Console.WriteLine()
      Console.WriteLine("name " +name+ " " +surname+ ", age " +age.ToString()+ ", profession " +profession+ ".")

      Console.WriteLine()
      Console.WriteLine(i"name {name} {surname}, age {age}, profession {profession}.")

      Console.WriteLine()
      Console.WriteLine(i"{Msg(555123/*ID_NAME*/)} {name} {surname}, {Msg(74231/*ID_AGE*/)} {age}, {Msg(76321/*ID_PROFESSION*/)} {profession}.")

      Console.WriteLine()
      Console.WriteLine(Msg(555123/*ID_NAME*/)+ i" {name} {surname}, " +Msg(74231/*ID_AGE*/)+ i" {age}, " +Msg(76321/*ID_PROFESSION*/)+ i" {profession}.")
      end scope
      return


   method NewLines() as void
      // Output:
      //name John Lennon,
      //age 40,
      //profession musician.
      Console.WriteLine(e"NewLines - Simple Output-check for different synthax\r\nPress key to continue")
      Console.ReadKey()

      Console.WriteLine()
      Console.WriteLine("name " +self.Person.Name+ " " +self.Person.Surname+ "," +CRLF+ "age " +self.Person.Age.ToString()+ "," +CRLF+ "profession " +self.Person.Profession+ ".")

      Console.WriteLine()
      Console.WriteLine(i"name {self.Person.Name} {self.Person.Surname}," +CRLF+ i"age {self.Person.Age}," +CRLF+ i"profession {self.Person.Profession}.")

      Console.WriteLine()
      Console.WriteLine(i"name {self.Person.Name} {self.Person.Surname},{CRLF}age {self.Person.Age},{CRLF}profession {self.Person.Profession}.")

      Console.WriteLine()
      Console.WriteLine(ie"name {self.Person.Name} {self.Person.Surname},\r\nage {self.Person.Age},\r\nprofession {self.Person.Profession}.")

      Console.WriteLine()
      var (name, surname, age, profession) := self.Person
      Console.WriteLine(i"{Msg(555123/*ID_NAME*/)} {name} {surname},{CRLF}{Msg(74231/*ID_AGE*/)} {age},{CRLF}{Msg(76321/*ID_PROFESSION*/)} {profession}.")

      Console.WriteLine()
      Console.WriteLine(ie"{Msg(555123/*ID_NAME*/)} {name} {surname},\r\n{Msg(74231/*ID_AGE*/)} {age},\r\n{Msg(76321/*ID_PROFESSION*/)} {profession}.")

      Console.WriteLine()
      Console.WriteLine(Msg(555123/*ID_NAME*/)+ ie" {name} {surname},\r\n" +Msg(74231/*ID_AGE*/)+ ie" {age},\r\n" +Msg(76321/*ID_PROFESSION*/)+ i" {profession}.")
      return


   method KeepItSimple() as void
      // Output: Today is: dd.mm.yyyy - Day x of the year yyyy
      Console.WriteLine(e"KeepItSimple - Simple Output-check for different synthax\r\nPress key to continue")
      Console.ReadKey()

      Console.WriteLine()
      Console.WriteLine("Today is: " +DToC(Today())+ " - Day " +(Today() - date(Year(Today()), 1, 1) + 1).ToString()+ " of the year " +Year(Today()).ToString() )

      Console.WriteLine()
      Console.WriteLine(i"Today is: {DToC(Today())} - Day {(Today() - Date(Year(Today()), 1, 1) + 1).ToString()} of the year {Year(Today()).ToString()}" )

      Console.WriteLine()
      begin scope
      var daysPassed := Today() - date(Year(Today()), 1, 1) + 1
      Console.WriteLine(ie"Today is: {Today()} - Day {daysPassed} of the year {Year(Today())}" )
      end scope

      Console.WriteLine()
      begin scope
      var current := Today()
      var daysPassed := current - date(Year(current), 1, 1) + 1
      Console.WriteLine(ie"Today is: {current} - Day {daysPassed} of the year {Year(current)}" )
      end scope

      Console.WriteLine()
      begin scope
      var current := DateTime.Now
      Console.WriteLine(ie"Today is: {current.ToShortDateString()} - Day {current.DayOfYear} of the year {current.Year}" )
      end scope
      return


   method FormatYourNumbers() as void
      // Output: the given numbers with different formats
      Console.WriteLine(e"FormatYourNumbers - Simple Output-check for different synthax\r\nPress key to continue")
      Console.ReadKey()

      var numbers := <float>{42, 0.42, 3.14159265358979323846, 22.642, -5000, -1.5}

      foreach var num in numbers
         Console.WriteLine()
         Console.WriteLine(i"No format specified: [{num}] <<<------------------------------------------------------------------------<<<")
         Console.WriteLine(ie"With format F - Fixed-point\r\nF [{num:F}] \t F1 [{num:F1}] \t F3 [{num:F3}] \t F5 [{num:F5}]\r\n") // Precision specifier: Number of decimal digits.

         Console.WriteLine(ie"With format G - General\r\nG [{num:G}] \t G1 [{num:G1}] \t G3 [{num:G3}] \t G5 [{num:G5}]\r\n") // Precision specifier: Number of significant digits.

         Console.WriteLine(ie"With format P - Percent\r\nP [{num:P}]  \t P1 [{num:P1}] \t P3 [{num:P3}] \t P5 [{num:P5}]\r\n") // Precision specifier: Desired number of decimal places.

         try
            Console.WriteLine(ie"With format D - Decimal: [{num:D}]") // Precision specifier: Minimum number of digits.
         catch ex as FormatException
            Console.WriteLine(ie"-->> Exception: {ex.Message} - D works for ints only")
            Console.WriteLine(ie"With format D - Decimal\r\nD [{(int)num:D}] \t D1 [{(int)num:D1}] \t D3 [{(int)num:D3}] \t D5 [{(int)num:D5}]\r\n")
         end try
      next

      Console.WriteLine()
      return


   method FormatYourDates() as void
      // Output: the given date with different formats
      Console.WriteLine(e"FormatYourDates - Simple Output-check for different synthax\r\nPress key to continue")
      Console.ReadKey()

      var current := Today()
      Console.WriteLine()
      Console.WriteLine(ie"Date - no format:\t[{current}] <<<------------------------------------------------------------------------<<<")
      Console.WriteLine(ie"Date - d:\t\t[{current:d}]")
      Console.WriteLine(ie"Date - D:\t\t[{current:D}]")
      Console.WriteLine(ie"Date - G:\t\t[{current:G}]")
      Console.WriteLine(ie"Date - yyyy-MM-dd:\t[{current:yyyy-MM-dd}]")
      Console.WriteLine(ie"Date - dd.MM.yyyy:\t[{current:dd.MM.yyyy}]")

      Console.WriteLine()
      return


   method InterpolationOrAlternative() as void
      Console.WriteLine()
      var (name, surname, age, profession) := self.Person

      Console.WriteLine()
      Console.WriteLine(Msg(555123/*ID_NAME*/)+ i" {name} {surname}, " +Msg(74231/*ID_AGE*/)+ i" {age}, " +Msg(76321/*ID_PROFESSION*/)+ i" {profession}.")

      Console.WriteLine()
      Console.WriteLine(String.Format("{0} {1} {2}, {3}, {4} {5}, {6} {7}.", Msg(555123/*ID_NAME*/), name, surname, Msg(74231/*ID_AGE*/), age, Msg(76321/*ID_PROFESSION*/), profession))

      Console.WriteLine()
      begin scope
      var sb := StringBuilder{}
      sb.Append(Msg(555123/*ID_NAME*/)).Append(" ").Append(name).Append(" ").Append(surname).Append(", ")
      sb.Append(Msg(74231/*ID_AGE*/)).Append(" ").Append(age).Append(", ")
      sb.Append(Msg(76321/*ID_PROFESSION*/)).Append(" ").Append(profession).Append(".")
      Console.WriteLine(sb.ToString())
      end scope

      Console.WriteLine()
      begin scope
      var sb := StringBuilder{}
      sb.Append(Msg(555123/*ID_NAME*/)).Append(i" {name} {surname}, ")
      sb.Append(Msg(74231/*ID_AGE*/)).Append(i" {age}, ")
      sb.Append(Msg(76321/*ID_PROFESSION*/)).Append(i" {profession}.")
      Console.WriteLine(sb.ToString())
      end scope
      return

end class
