package asmock.framework.methodRecorders
{
	import flash.utils.Dictionary;
	
	import org.flemit.reflection.MethodInfo;

	[ExcludeClass]
	public class ProxyMethodExpectationsDictionary
	{
		private var _proxiesDictionary : Dictionary = new Dictionary(true);
		
		public function ProxyMethodExpectationsDictionary()
		{
		}
		
		public function contains(proxy : Object, method : MethodInfo) : Boolean 
		{
			return getExpectations(proxy, method) != null;
		}
		
		public function getExpectations(proxy : Object, method : MethodInfo) : Array
		{
			var proxyMethods : Dictionary = _proxiesDictionary[proxy];
			
			if (proxyMethods == null)
			{
				return null;
			}
			
			return proxyMethods[method] as Array;
		}
		
		public function addExpectations(proxy : Object, method : MethodInfo, expectations : Array) : void
		{
			var proxyMethods : Dictionary = _proxiesDictionary[proxy];
			
			if (proxyMethods == null)
			{
				proxyMethods = new Dictionary(true);
				_proxiesDictionary[proxy] = proxyMethods;
			}
			
			proxyMethods[method] = expectations;
		}
		
		public function remove(proxy : Object) : void
		{
			delete _proxiesDictionary[proxy];
		}
	}
}