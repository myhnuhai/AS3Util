package org.myhnuhai.util
{
	import flash.display.DisplayObject;
	
	import mx.managers.PopUpManager;
	
	import spark.components.Label;

	public class BusyCursorUtil
	{
		private static var _label:Label =  new Label(); 
 
		public static function showBusyCursor(param:String,parent:DisplayObject):void{
			PopUpManager.addPopUp(showLabel(param,parent),parent,true);
		}
		public static function hideBusyCursor():void{
			PopUpManager.removePopUp(_label);
		}
		
		private static function showLabel(param:String,parent:DisplayObject):Label{
			_label.setStyle("fontSize",25);
			_label.setStyle("color",0xFF0000);
			_label.text = param;
			_label.y = 200;
			_label.x = parent.parent.width / 2;
			return _label;
		}
	}
}