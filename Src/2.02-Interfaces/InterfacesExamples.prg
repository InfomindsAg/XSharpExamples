/*	
Interfaces
Usage: 
- Separating the definition of the available methods/properties from its implementation
- Adding common methods to classes, that don't have a common super-class 
- Solving circular references
*/

using system.Text
using system.Collections.Generic

class InterfaceExamples

	private _Random := Random{} as Random 

	method Execute() as void strict
		Console:WriteLine("Interface examples")
		Console:WriteLine("")
	
		self:UseInterfaces()
		return

	method UseInterfaces() as void strict
			
		var sqlSel := SqlSelect{}
		var sqlDyn := SqlDynamic{}
		var dataWnd := DataWindow{}
		var dataFil := DataFile{}
		
		console.WriteLine(self:FieldGetId(sqlSel))
		console.WriteLine(self:FieldGetId(sqlDyn))
		console.WriteLine(self:FieldGetId(dataWnd))
		// console.WriteLine(self:FieldGetId(dataFil)) // --> cannot convert from 'DataFile' to 'IFieldGet'

		self:FieldPutId(sqlDyn)
		self:FieldPutId(dataFil) 
		// self:FieldPutId(sqlSel) // --> cannot convert from 'SqlSelect' to 'IFieldPut'
		// self:FieldPutId(dataWnd) // --> cannot convert from 'DataWindow' to 'IFieldPut'

		self:NewIdWithBackup(sqlDyn)
		// self:NewIdWithBackup(dataFil) // --> cannot convert from 'DataFile' to 'IFieldGetAndPut'
		// self:NewIdWithBackup(sqlSel) // --> cannot convert from 'SqlSelect' to 'IFieldGetAndPut'
		// self:NewIdWithBackup(dataWnd) // --> cannot convert from 'DataWindow' to 'IFieldGetAndPut'

		self:NewIdWithBackupGeneric(sqlDyn)
		// self:NewIdWithBackupGeneric(dataFil) // --> There is no implicit reference conversion from 'DataFile' to 'IFieldGet'.
	return

	// In order to function correcty, this method needs an object, that has a FieldGet method.
	method FieldGetId(obj as IFieldGet) as string strict 
		return obj:fieldGet(#ID)

	// In order to function correcty, this method needs an object, that has a FieldGet method.
	method FieldPutId(obj as IFieldPut) as void strict 
		obj:fieldPut(#ID, _Random:Next():ToString())
		return 

	// In order to function correcty, this method needs an object, that has a FieldGet and FieldPut method.
	method NewIdWithBackup(obj as IFieldGetAndPut) as void strict 
		obj:fieldPut(#ID_Backup, obj:FieldGet(#ID))
		self:FieldPutId(obj)
		return 

	// Even more flexible solution, when comining multiple interfaces using a generic method with a where condition
	method NewIdWithBackupGeneric<T>(obj as T) as void where T is IFieldGet, IFieldPut strict 
		obj:fieldPut(#ID_Backup, obj:FieldGet(#ID))
		self:FieldPutId(obj)
		return 

end class
	