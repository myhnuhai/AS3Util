package org.myhnuhai.util
{
	import spark.formatters.DateTimeFormatter;

	public class DateUtil
	{
		private static var  dateTimeFormatter:DateTimeFormatter = new DateTimeFormatter();
		public static var DATE_DAY_FMT:String = "YYYY-MM-DD";
		public static var DATE_HOUR_FMT:String = "yyyy-MM-dd HH:00:00";
		public static var DATE_MIN_FMT:String = "yyyy-MM-dd HH:mm:00";
		public static var DATE_SECOND_FMT:String = "yyyy-MM-dd HH:mm:ss";
		
		public function DateUtil(){}
		
		
		public static function string2Date(param:String):Date{
			new Date().seconds
			return new Date(Date.parse(param));
		}
		
		public static function date2String(param:Date,fmt:String):String{
			if(fmt == null){
				dateTimeFormatter.dateTimePattern = DATE_SECOND_FMT;
			}else{
				dateTimeFormatter.dateTimePattern = fmt;
			}
			return dateTimeFormatter.format(param);
		}
	}
}