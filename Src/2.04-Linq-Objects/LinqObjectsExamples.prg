/*	
Linq for collections with simply types
Usage: Various Tasks on collections like filters and checks
*/

using system.Text
using system.Collections.Generic
using system.Linq

class LinqObjectsExamples

	method Execute() as void strict
		Console:WriteLine("Linq with Objects")
		Console:WriteLine("")
	
		self:WhereSelectSum()
		self:SelectMany()
		self:OrderByThenBy()
		return

	method WhereSelectSum() as void strict
		console:WriteLine("WhereSelectSum")
		
		var list := InvoiceBuilder.Build(1)

		var result := list; 
						:Where({q => q:Number < 3});  // get only the first two invoices
						:Select({q => class{ ;
							q:Year, ;
							q:Number, ;
							SumValue := q:Positions?:Sum({p => p:Quantity * p:Price }),;   // project to a new, anonymous class, that contains the original item and the sum of all positions
							PosText := string.Join(" + ", q:Positions?:Select({p => i"{p:Quantity*p:Price}"})) }});
						:ToList()  // convert to list
			
			
			
		// q:Positions?: => execute sum only, is Positions is not null. Otherwise return null
		foreach var item in result
			console:WriteLine(i"{item:Year}/{item:Number} => {item:SumValue}  ({item:PosText})")
		next

		console:WriteLine()
		return

	method SelectMany() as void strict
		console:WriteLine("selectMany")
		
		var list := InvoiceBuilder.Build(1, 3)

		// SelectMany takes a object that contains a list of objects and joins them together to create a flat table
		var result := list:SelectMany({ p => p:Positions}, { q, p => class { q:Year, q:Number, p:Article, p:Quantity, p:Price, value := p:Quantity * p:Price }})

		foreach var item in result
			console:WriteLine(i"{item:Year}/{item:Number} => {item:Article} - {item:Quantity} {item:Price} => ({item:Value})")
		next

		console:WriteLine()
		return

	method OrderByThenBy() as void strict
		console:WriteLine("OrderByThenBy")
		
		var list := InvoiceBuilder.Build()

		var result := list;
						:OrderByDescending({q => q:Year}); // First sort by Year descending
						:ThenBy({q => q:Number}); // and per Year, sort be number ascending
						:ToList()
						
		foreach var item in result
			console:WriteLine(i"{item:Year}/{item:Number}")
		next

		console:WriteLine()
		return

end class