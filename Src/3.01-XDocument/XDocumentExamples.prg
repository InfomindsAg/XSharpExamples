/*	
XDocument Functionalities
Usage: Working with XML Documents
Documentation: 
- https://docs.microsoft.com/en-us/dotnet/api/system.xml.linq.xdocument?view=netframework-4.7.2
*/

using System.Xml.Linq // needs references to System.XML and System.Xml.Linq in Project
using System.Linq

#pragma warnings (XS0219, off)
class XDocumentExamples

	method Execute() as void strict
        #region XML
    
        /*
        <?xml version="1.0" encoding="UTF-8"?>
        <CedentePrestatore>
            <Sede>
                <Indirizzo>VIA ARMANDO PICA 170</Indirizzo>
                <CAP>41126</CAP>
                <Comune>MODENA</Comune>
                <Provincia>MO</Provincia>
                <Nazione>IT</Nazione>
            </Sede>
            <Contatti TestAttribute="AttValue">
                <Telefono>059/2863111</Telefono>
                <Fax>059/2863199</Fax>
                <Email>FABIO.VINCENZI@NEULIFT.COM</Email>
            </Contatti>
            <Contatti>
                <Telefono>073/1234345</Telefono>
                <Fax>063/8431816</Fax>
                <Email>samplemail@gmail.com</Email>
            </Contatti>
        </CedentePrestatore>
        */
    
        #endregion
    
        #region Initializing
    
        var xmlString := "<?xml version=""1.0"" encoding=""UTF-8""?><CedentePrestatore><Sede><Indirizzo>VIA ARMANDO PICA 170</Indirizzo><CAP>41126</CAP><Comune>MODENA</Comune><Provincia>MO</Provincia><Nazione>IT</Nazione></Sede><Contatti TestAttribute=""AttValue""><Telefono>059/2863111</Telefono><Fax>059/2863199</Fax><Email>FABIO.VINCENZI@NEULIFT.COM</Email></Contatti><Contatti><Telefono>073/1234345</Telefono><Fax>063/8431816</Fax><Email>samplemail@gmail.com</Email></Contatti></CedentePrestatore>"
        var xDoc := XDocument.Parse(xmlString)
        //var xDoc := XDocument.Load(xmlFile)
        var rootElement := xDoc:Root //XElement
    
        #endregion
    
        #region Elements/Descendants/Attributes
    
        var contatto := rootElement:Element("Contatti") //XElement
        //returns first direct child XElement with corresponding XName (case sensitive)
        /*
        <Contatti TestAttribute="AttValue">
            <Telefono>059/2863111</Telefono>
            <Fax>059/2863199</Fax>
            <Email>FABIO.VINCENZI@NEULIFT.COM</Email>
        </Contatti>
        */
    
        var contatti := rootElement:Elements("Contatti") //IEnumerable<XElement>
        //returns a collection of all direct child XElements with corresponding XName
        /*
        <Contatti TestAttribute="AttValue">
            <Telefono>059/2863111</Telefono>
            <Fax>059/2863199</Fax>
            <Email>FABIO.VINCENZI@NEULIFT.COM</Email>
        </Contatti>
        <Contatti>
            <Telefono>073/1234345</Telefono>
            <Fax>063/8431816</Fax>
            <Email>samplemail@gmail.com</Email>
        </Contatti>
        */

        var telefono := rootElement:Descendants("Telefono") //IEnumerable<XElement>
        //returns a collection of all child XElements, ignoring hierarchy, with corresponding XName
        /*
        <Telefono>059/2863111</Telefono>
        <Telefono>073/1234345</Telefono>
        */
    
        var attribute := contatto:Attribute("TestAttribute") //XAttribute
    
    
        #endregion
    
        #region Working with xmlns Namespaces
    
        /*
        <ElementName xmlns:aw="http://www.adventure-works.com">
            <aw:Descendant>1200</aw:Descendant>
            <aw:Descendant>content</aw:Descendant>
            <Descendant>3.0</Descendant>
        </ElementName>
        */
    
        var xmlns := (XNamespace)"http://www.adventure-works.com"
        var element := XElement.Parse("<ElementName xmlns:aw=""http://www.adventure-works.com""><aw:Descendant>1200</aw:Descendant><aw:Descendant>content</aw:Descendant><Descendant>3.0</Descendant></ElementName>")
        var awDescendants := element:Elements(xmlns + "Descendant"):Select({el => el:Value})
        //awDescendants looks like
        /*
            "1200"
            "content"
        */
    
        var name := element:Elements():First():Name //XName
        var fullName := name:ToString() //"{http://www.adventure-works.com}Descendant"
        var localName := name:LocalName //"Descendant"
        var namespaceName := name:NamespaceName //"http://www.adventure-works.com"
    
        //Casting Elements
        var doubleValue := (double)element:Elements():Last()
        //throws FormatException when XElement value is not of compatible format
    
        #endregion

        return

end class
#pragma warnings (XS0219, default)