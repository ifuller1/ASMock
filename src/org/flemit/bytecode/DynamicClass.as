package org.flemit.bytecode
{
	import flash.utils.Dictionary;
	
	import org.flemit.reflection.FieldInfo;
	import org.flemit.reflection.MethodInfo;
	import org.flemit.reflection.PropertyInfo;
	import org.flemit.reflection.Type;
		
	public class DynamicClass extends Type
	{
		//public var instanceInitialiser : DynamicMethod;
		
		public var methodBodies : Dictionary = new Dictionary();
		
		public function DynamicClass(qname : QualifiedName, baseClass : Type, interfaces : Array)
		{
			super(qname);
			
			super._baseClass = baseClass;
			
			_interfaces = interfaces;
		}
		
		public function addMethodBody(method : MethodInfo, methodBody : DynamicMethod) : void
		{
			this.methodBodies[method] = methodBody;
		}
		
		public function getMethodBody(method : MethodInfo) : DynamicMethod
		{
			return methodBodies[method] as DynamicMethod;
		}
		
		public function addMethod(method : MethodInfo) : void
		{
			_methods.push(method);
		}
		
		public function addProperty(property : PropertyInfo) : void
		{
			_properties.push(property);
		}
		
		public function addSlot(field : FieldInfo) : void
		{
			_fields.push(field);
		}
		
		public function set constructor(value : MethodInfo) : void
		{
			_constructor = value;
		}
		
		public static function fromType(type : Type) : DynamicClass
		{
			var cls : DynamicClass = new DynamicClass(type.qname, type.baseType, type.getInterfaces());
			
			for each(var method : MethodInfo in type.getMethods(true, true))
			{
				cls.addMethod(method);
			}
			
			for each(var property : PropertyInfo in type.getProperties(true, true))
			{
				cls.addProperty(property);
			}
			
			for each(var field : FieldInfo in type.getFields(true, true))
			{
				cls.addSlot(field);
			}
			
			cls._isInterface = type.isInterface;
			
			return cls; 
		}

	}
}