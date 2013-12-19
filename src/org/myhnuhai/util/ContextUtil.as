package org.myhnuhai.util
{
	import mx.core.FlexGlobals;

	public class ContextUtil
	{
		public function ContextUtil(){}
		
		public static function getConextUrl():String{
			return getUrl();
		}
		
		private static function getUrl():String{
			var params:String = FlexGlobals.topLevelApplication.url;
			
			var temp:Array = params.split("/");
			
			var returnStr:String = "";
			
			for(var i:int = 0; i < temp.length; i++){
				if(i < 4) returnStr += temp[i] + "/"; 
			}
			return returnStr;
		}
	}
}