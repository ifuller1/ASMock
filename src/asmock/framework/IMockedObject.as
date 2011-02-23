package asmock.framework
{
	import org.flemit.reflection.*;
	
	[ExcludeClass]
	public interface IMockedObject
	{
		function shouldCallOriginal(method : MethodInfo) : Boolean;
		
		function handleProperty(property : PropertyInfo, method : MethodInfo, args : Array) : Object;
		function isRegisteredProperty(property : PropertyInfo) : Boolean;		
	}
}