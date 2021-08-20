interface IFieldGet

	method FieldGet(name as symbol) as string

end interface

interface IFieldPut

	method FieldPut(name as symbol, value as usual) as void

end interface

interface IFieldGetAndPut inherit IFieldGet, IFieldPut
end interface
