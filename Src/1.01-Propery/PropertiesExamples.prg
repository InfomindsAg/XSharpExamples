/*	
Properties
Usage: Replaces the old definition of access/assign
Documentation: https://www.xsharp.eu/help/command_property.html
*/

class PropertiesExamples
	
	#region This was the old way to define properties
	
	private _oldProperty as int
	access OldProperty as int
		return _oldProperty
	end access
	// maybe some other, unreleased code
	assign OldProperty(new_value as int) as int
		if new_value < 10
			_oldProperty := new_value
		else 
			_oldProperty := 10
		endif 
	end assign 
	
	#endregion
	
	#region This is the new way to define properties
	
	private _newProperty as int
	property NewProperty as int
		get
			return _newProperty
		end get
		set
		if value < 10
			_newProperty := value
		else 
			_newProperty := 10
		endif 
		end set
	end property
	
	#endregion

	#region An alternative new way for properties with one-line access  and assign
	
	private _newPropertyOneLine as int 
	property NewPropertyOneLine as int 
		get => _newPropertyOneLine 		
		set => _newPropertyOneLine := value 
	end property
	
	#endregion

	#region And an even shorter way for properties with one-line access and assign
	
	private _newPropertyOneLineShort as int 
	property NewPropertyOneLineShort as int get _newPropertyOneLineShort set _newPropertyOneLineShort := value 
	
	#endregion

	#region properties with automatic backing field (useful for Data Transition Objects [DTOs])
	
	// Property with automatic backing field
	property AutoProperty as int auto get set

	// Or even shorter
	property AutoPropertyShort as int auto
	

	// Property with automatic backing field with a public access and a private (=hidden) assign
	property AutoPropertyPrivateSet as int auto get private set

	#endregion
	
	method Execute() as void strict
		self:UseProperty()
		return
	
	method UseProperty() as void strict
		// The usage of the new properties is compatible to the assign/access

		self:OldProperty := 1
		Console:WriteLine(self:OldProperty)
		self:OldProperty := 15
		Console:WriteLine(self:OldProperty)
		
		self:NewProperty := 1
		Console:WriteLine(self:NewProperty)
		self:NewProperty := 15
		Console:WriteLine(self:NewProperty)
		
		self:AutoProperty := 1
		Console:WriteLine(self:NewProperty)
		self:AutoPropertyPrivateSet := 1
		Console:WriteLine(self:NewProperty)

		return
	
	
end class