package org.myhnuhai.remoting
{
	public class AbstractResponder implements IInvokeResponder
	{
		private var resultListener:Array;
		private var faultListener:Array;
		private var _defaultFaultListener:Function;
		
		public function AbstractResponder(defaultFaultListener:Function = null)
		{
			_defaultFaultListener = defaultFaultListener;
		}
		
		public function addResultListener(handler:Function, ...params):IInvokeResponder
		{
			if(!resultListener){
				resultListener = new Array();
			}
			resultListener.push(new Listener(handler,params));
			return this;
		}
		
		public function addFaultListener(handler:Function, ...params):IInvokeResponder
		{
			if(!faultListener){
				faultListener = new Array();
			}
			faultListener.push(new Listener(handler,params));
			return this;
		}
		
		protected function notifyResultListeners(result:Object,first:int = 0):void{
			if(resultListener){
				for(var i:int = 0; i < resultListener.length; i++){
					var listener:Listener = resultListener[i];
					var func:Function = listener.handler;
					var params:Array = listener.arguments;
					params.unshift(result);
					func.apply(null,params);
				}
			}
		}
		protected function notifyFaultListeners(fault:Object,first:int = 0):void{
			if(faultListener){
				for(var i:int = 0; i < faultListener.length; i++){
					var listener:Listener = faultListener[i];
					var func:Function = listener.handler;
					var params:Array = listener.arguments;
					params.unshift(fault);
					func.apply(null,params);
				}
			}else if(_defaultFaultListener != null){
				_defaultFaultListener.apply(null,[fault]);
			}
		}
		
		protected function clear():void{
			resultListener = [];
			faultListener = [];
		}
	}
}

class Listener{
	private var _handler:Function;
	private var _args:Array;
	
	public function Listener(handler:Function,args:Array){
		this._args = args;
		this._handler = handler;
	}
	
	public function get handler():Function{
		return _handler;
	}
	public function get arguments():Array{
		return _args;
	}
}