package org.myhnuhai.util
{
	import flash.display.DisplayObject;
	
	import mx.core.FlexGlobals;
	import mx.managers.PopUpManager;
	
	import spark.components.Label;
	import spark.formatters.DateTimeFormatter;

	public class StringUtil 
	{
	  
		public static function subStr2EndChar(subStr:String):String{
			if(subStr != null && subStr.length > 0){
				return subStr.substr(0,subStr.length-1);
			}
			
			return subStr;
		}
	}
}