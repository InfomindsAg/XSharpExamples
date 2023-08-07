/*	
XDocument Exports
Usage: Create XML Documents
Documentation: 
- https://docs.microsoft.com/en-us/dotnet/api/system.xml.linq.xdocument?view=netframework-4.7.2
*/

using system.Xml.Linq // needs references to System.XML and System.Xml.Linq in Project

class XDocumentExportExamples

	method Execute() as void strict
		Console.WriteLine("XML Export examples")
		Console.WriteLine("")
		
		self:StaticXmlDoc()
		self:ListXmlDoc()
		return
		
	method StaticXmlDoc() as void strict
		
		/* Create the following XML
			<info>
				<version id="123" />
				<changelog>dummy dummy</changelog>
			</info>
		*/
		
		var doc := XDocument{;
			XElement{"info", ;
				XElement{"version", XAttribute{"id", 123}}, ;
				XElement{"changelog", "dummy dummy"}}}
		
		// doc:Save("static.xml")
		Console.WriteLine(doc:ToString())
		return


	method ListXmlDoc() as void strict
		
		/* Create the following XML
			<articles>
				<article id="1">
					<barcode>1.1</barcode>
				</article>
				<article id="2">
					<barcode>2.1</barcode>
					<barcode>2.2</barcode>
				</article>
				<article id="3">
					<barcode>3.1</barcode>
					<barcode>3.2</barcode>
					<barcode>3.3</barcode>
				</article>
			</articles>
		*/

		var articles := XElement{"articles"}
		for var i := 1 to 3
			var article := XElement{"article", XAttribute{"id", i}}
			for var j := 1 to i
				article:Add(XElement{"barcode", i"{i}-{j}"}) // i" = interpolated String. Is equal to => String.Format("{0}-{1}", i, j)
			next
			articles:Add(article)
		next
		
		var doc := XDocument{articles}
		// doc:Save("list.xml")
		Console.WriteLine(doc:ToString())

		return

end class