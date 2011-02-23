package org.floxy
{
	public interface IProxyListener
	{
		function methodExecuted(target : Object, methodType : uint, methodName : String, arguments : Array, baseMethod : Function) : *;
	}
}