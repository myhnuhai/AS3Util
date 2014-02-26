package org.myhnuhai.remoting
{
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	
	import mx.rpc.AbstractOperation;
	import mx.rpc.AsyncToken;
	import mx.rpc.remoting.mxml.RemoteObject;
	
	public class RemoteObjectInvoker extends EventDispatcher implements IInvoker
	{
		private var _remoteObject:RemoteObject;
		private var _defaultFaultListener:Function;

		public function get defaultFaultListener():Function
		{
			return _defaultFaultListener;
		}

		public function RemoteObjectInvoker(destination:String,defaultFaultListener:Function = null)
		{
			this._defaultFaultListener = defaultFaultListener;
			this._remoteObject = new RemoteObject(destination);
		}
		
		public function invoke(method:String, args:Array):IInvokeResponder
		{
			var oper:AbstractOperation = this._remoteObject.getOperation(method);
			var token:AsyncToken = oper.send.apply(oper,args);
			
			return new AsyncResponder(token,defaultFaultListener);
		}
	}
}