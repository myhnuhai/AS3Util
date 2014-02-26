package org.myhnuhai.remoting
{
	public class BaseService
	{
		private var _destination:String;
		private var _invoker:IInvoker;

		public function BaseService(destination:String){
			this._destination = destination;
		}
		
		public function get destination():String
		{
			return _destination;
		}
		public function get invoker():IInvoker
		{
			if(!_invoker){
				_invoker = new RemoteObjectInvoker(destination);
			}
			return _invoker;
		}
		
		public function set invoker(value:IInvoker):void
		{
			_invoker = value;
		}
		
		protected function invoke(method:String,...args):IInvokeResponder{
			return invoker.invoke(method,args);
		}
	}
}