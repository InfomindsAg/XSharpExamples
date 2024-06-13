using System.Collections.Generic
/*
Tuples
Description:
A tuple is a data structure that groups multiple data elements in a lightweight data structure.
Usage: Represent multiple data elements which should be handled together, use/change them,
pass them as arguments, receive them as return value, without the need to declare a new class or (record-)structure for holding the data set.
Documentation: https://www.xsharp.eu/help/tuples.html
*/

class TuplesExamples

   #Region private helper methods
   private class CollaboratorInfo
      property Description as string auto := "Some collaborator infos."
   end class

   private method GetTupleGeneric() as tuple<string, string, logic>
      return tuple<string, string, logic>{"Holger", "Brixen", true}


   private method GetTupleKeyword() as tuple(string, string, logic)
      return tuple{"Arnold", "Vahrn", true} // tuple item types must match the types in the Tuple definition


   private method GetTupleKeywordSimpler() as (string, string, logic)
      return tuple{"Marcel", "Sterzing", true}

   private method GetNamedTuple() as tuple(Name as string, Location as string, IsDeveloper as logic)
      return tuple{Name := "Matthias", Location := "Raas", IsDeveloper := true} // including tuple item names in the tuple instantiation
   #EndRegion private helper methods

	method Execute() as void
		Console.WriteLine(e"Tuples examples\r\n")

		self.TupleGenericType()
		self.TupleKeyword()
		self.TupleKeywordSimpler()
		self.NamedTuples()
		self.TuplesWithVar()
		self.TupleDeconstruction()
		self.TupleWithCollections()

		return

   /// <summary>
   /// In this Eample the generic System.Collections.Generic.Tuple Type is used to get multiple values from a method
   /// without the need to declare ref/out params or use the usage of a dedicated class or type.
   /// </summary>
   method TupleGenericType() as void
      local collaborator as tuple<string, string, logic>
      collaborator := self.GetTupleGeneric()
      Console.WriteLine(e"\r\nGeneric data type Tuple:")
      Console.WriteLine(ie"Name: {collaborator.Item1}\r\nLocation: {collaborator.Item2}\r\nIsDeveloper: {collaborator.Item3}")
      return

   /// <summary>
   /// In this Eample the code does the exact same thing as in the method TupleGenericType, by using the dedicated keyword tuple.
   /// The tuple keyword syntax allows an easier way for declaring tuples and working with tuples.
   /// </summary>
   method TupleKeyword() as void
      local collaborator as tuple(string, string, logic)
      collaborator := self.GetTupleKeyword()
      Console.WriteLine(e"\r\nKeyword Tuple:")
      Console.WriteLine(ie"Name: {collaborator.Item1}\r\nLocation: {collaborator.Item2}\r\nIsDeveloper: {collaborator.Item3}")
      return

   /// <summary>
   /// In this Eample the code does the exact same thing as in the method TupleKeyword, with an even simpler syntax.
   /// This allows the tuple usage in a mor C#-like style.
   /// </summary>
   method TupleKeywordSimpler() as void
      local collaborator as (string, string, logic) // the TUPLE keyword in the tuple definition can even be omitted!
      collaborator := self.GetTupleKeywordSimpler()
      Console.WriteLine(e"\r\nKeyword Tuple simpler:")
      Console.WriteLine(ie"Name: {collaborator.Item1}\r\nLocation: {collaborator.Item2}\r\nIsDeveloper: {collaborator.Item3}")
      return

   /// <summary>
   /// The dedicated TUPLE keyword syntax supports also specifying custom names for the tuple items, instead of using the generic names Item1, Item2, ...
   /// So the code can become much more readable and close to what it would be like if using a separate new class for the data.
   /// </summary>
   method NamedTuples() as void
      local collaborator as tuple(Name as string, Location as string, IsDeveloper as logic) // defining the named tuple with custom item names
      collaborator := self.GetNamedTuple()
      Console.WriteLine(e"\r\nNamed Tuple:")
      Console.WriteLine(ie"Name: {collaborator.Name}\r\nLocation: {collaborator.Location}\r\nIsDeveloper: {collaborator.IsDeveloper}")
      return

   /// <summary>
   /// Tuples can be defined and instantiated at the same time using the VAR keyword.
   /// The  data type of each tuple item is inferred from the item types supplied in the code.
   /// Tuples with the same item types can be assigned to each other (thus copying the item values from the source tuple to the destination tuple),
   /// and the same can be done for tuples defined with either LOCAL or VAR
   /// </summary>
   method TuplesWithVar() as void
      Console.WriteLine(e"\r\nTuples with var:")
      var collaborator0 := self.GetTupleGeneric()
      Console.WriteLine(ie"0: {collaborator0.Item1}, {collaborator0.Item2}, {collaborator0.Item3}")

      var collaborator1 := self.GetTupleKeyword()
      Console.WriteLine(ie"1: {collaborator1.Item1}, {collaborator1.Item2}, {collaborator1.Item3}")

      var collaborator2 := self.GetTupleKeywordSimpler()
      Console.WriteLine(ie"2: {collaborator2.Item1}, {collaborator2.Item2}, {collaborator2.Item3}")

      var collaborator3 := self.GetNamedTuple()
      Console.WriteLine(ie"3: {collaborator3.Name}, {collaborator3.Location}, {collaborator3.IsDeveloper}")

      collaborator3 := collaborator1 // Collaborator 0 would not be possible since they have not the same data type (System.Tuple != System.ValueTuple)
      Console.WriteLine(ie"3: {collaborator3.Name}, {collaborator3.Location}, {collaborator3.IsDeveloper}")

      var name := "Unknown collaborator"
      var info := CollaboratorInfo{}
      var collaborator4 := tuple{name, info.Description}
      Console.WriteLine(ie"4: {collaborator4.name}, {collaborator4.Description}")

      return

   /// <summary>
   /// A tuple can be deconstructed to multiple plain variables in one line of code, using the (var1, var2, ...) syntax.
   /// </summary>
   method TupleDeconstruction() as void
      Console.WriteLine(e"\r\nTuple deconstruction:")
      local collaborator as tuple(Name as string, Location as string, IsDeveloper as logic)

      local name as string
      local location as string
      local isDeveloper as logic

      collaborator := tuple{Name := "Holger", Location := "Brixen", IsDeveloper := true}
      Console.WriteLine("Assign multiple existing local variables in one row:")
      (name, location, isDeveloper) := collaborator
      Console.WriteLine(ie"Name: {name}, Location: {location}, IsDeveloper: {isDeveloper}")

      collaborator := tuple{Name := "Peter", Location := "Brixen", IsDeveloper := true}
      Console.WriteLine("Define and assign multiple local variables in one row:")
      local (name2 as string, location2 as string, isDeveloper2 as logic) := collaborator
      Console.WriteLine(ie"Name: {name2}, Location: {location2}, IsDeveloper: {isDeveloper2}")

      collaborator := tuple{Name := "Arne", Location := "Brixen", IsDeveloper := true}
      Console.WriteLine("Define and assign multiple local variables in one row with var syntax and type inference:")
      var (name3, location3, isDeveloper3) := collaborator
      Console.WriteLine(ie"Name: {name3}, Location: {location3}, IsDeveloper: {isDeveloper3}")

      return

   /// <summary>
   /// Example for using a tuple with collections to iterate over a set of data.
   /// </summary>
   method TupleWithCollections() as void
      Console.WriteLine(e"\r\nTuple with collections:")
      var collaborators := List<tuple(name as string, location as string, isDeveloper as logic)>{}
      collaborators.Add(self.GetTupleKeyword())
      collaborators.Add(self.GetTupleKeywordSimpler())
      collaborators.Add(self.GetNamedTuple())
      collaborators.Add(tuple{"Lukas", "Brixen", false})

      foreach var c in collaborators
         Console.WriteLine(ie"Name: {c.name}, Location: {c.location}, IsDeveloper: {c.isDeveloper}")
      next

      return

end class