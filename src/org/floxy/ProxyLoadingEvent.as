package org.floxy
{
	import flash.events.Event;
	import flash.system.LoaderContext;
	import flash.utils.ByteArray;
	
	public class ProxyLoadingEvent extends Event
	{
		public static const PROXY_LOADING : String = "proxyLoading";
		
		private var _data : ByteArray;
		private var _context : LoaderContext;
		
		public function get data() : ByteArray { return _data; }
		public function get context() : LoaderContext { return _context; }
		
		public function ProxyLoadingEvent(data : ByteArray, context : LoaderContext, type : String)
		{
			super(type, false, true);
			
			_data = data;
			_context = context;
		}

		public override function clone():Event
		{
			return new ProxyLoadingEvent(_data, _context, type);	
		}
	}
}