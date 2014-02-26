package org.myhnuhai.remoting
{
	import mx.rpc.AsyncResponder;
	import mx.rpc.AsyncToken;

	public class AsyncResponder extends AbstractResponder
	{
		private var _token:AsyncToken;
		public function AsyncResponder(token:AsyncToken,defaultFaultListener:Function=null)
		{
			super(defaultFaultListener);
			this._token = token;
			token.addResponder(new mx.rpc.AsyncResponder(resultHandler,faultHandler));
		}
		
		private function resultHandler(data:Object,token:Object = null):void{
			super.notifyResultListeners(data);
		}
		
		private function faultHandler(info:Object,token:Object = null):void{
			super.notifyFaultListeners(info);
		}
			
	}
}