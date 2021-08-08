class SqlSelect implements IFieldGet

	method FieldGet(name as symbol) as string
		return i"{self:GetType():Name}-{name}";
		
end class
	
	
class SqlDynamic inherit SqlSelect implements IFieldPut, IFieldGetAndPut

	method FieldPut(name as symbol, value as usual) as void
		console.WriteLine(i"{self:GetType():Name} -> {name} = {value}")
		return
		
end class
	
	
class DataWindow inherit Window implements IFieldGet

	method FieldGet(name as symbol) as string
		return "DataWindow -> " + name:ToString();
		
end class
	
class DataFile inherit File implements IFieldPut

	method FieldPut(name as symbol, value as usual) as void
		console.WriteLine(i"Save {name} = {value} to file")
		return
		
end class
	
	
class Window 
end class

class File
end class
