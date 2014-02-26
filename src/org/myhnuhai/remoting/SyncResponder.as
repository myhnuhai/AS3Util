package org.myhnuhai.remoting
{
	import flash.utils.setTimeout;
	public class SyncResponder extends AbstractResponder
	{
		private var _delay:Number;
		public function SyncResponder(defaultFaultListener:Function=null,delay:Number = 1)
		{
			super(defaultFaultListener);
			if(_delay > 1)throw new Error("Invalid number for delay!");
			_delay = delay;
		}
		
		public function invokeResult(data:Object):void{
			setTimeout(super.notifyResultListeners,1,data);
		}
		
		public function invokeFault(info:Object):void{
			setTimeout(super.addFaultListener,1,info);
		}
	}
}