package org.myhnuhai.remoting
{
	public interface IInvokeResponder
	{
		function addResultListener(handler:Function,...params):IInvokeResponder;
		function addFaultListener(handler:Function,...params):IInvokeResponder;
	}
}