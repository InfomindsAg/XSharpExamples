using system.Collections.Generic

class Invoice
	property Year as int auto
	property Number as int auto
	property Customer as int auto
	property Positions as List<Invoice_Position> auto
end class

class Invoice_Position
	property Article as string auto
	property Quantity as int auto
	property Price as decimal auto
end class


static class InvoiceBuilder

	static method Build(years := 2 as int, invoices := 5 as int) as List<Invoice>
		
		var result := List<Invoice>{}
		
		for var y := 1 upto years
			for var i := 1 upto invoices
				var invoiceItem := Invoice{} { Number := i, Year := 2020 + y, Customer := i * y, Positions := List<Invoice_Position>{} }
			
				for var p := 1 upto 3
					invoiceItem:Positions:Add(Invoice_Position{} {Article := ((char)(64 + p)):ToString(), Quantity := p, Price := i * p })
				next
			
				result:Add(invoiceItem)
			next
		next
		
		return result;
		
end class
