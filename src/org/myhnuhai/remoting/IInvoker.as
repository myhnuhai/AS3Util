package org.myhnuhai.remoting
{
	import mx.rpc.AsyncToken;

	public interface IInvoker
	{
		// 使用args制定的参数调用名为method的方法
		function invoke(method:String,args:Array):IInvokeResponder;
	}
}