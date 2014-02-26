package org.myhnuhai.events
{
	import flash.events.Event;
	import flash.events.EventDispatcher;
	
	import org.myhnuhai.domain.FileInfo;
	
	public class UploadFileEvent extends Event
	{
		public static var FILE_COMPLETE_EVENT:String = "File_Complete";
		private var _fileInfo:FileInfo;

		public function get fileInfo():FileInfo
		{
			return _fileInfo;
		}

		public function set fileInfo(value:FileInfo):void
		{
			_fileInfo = value;
		}
		
		public function UploadFileEvent(type:String)
		{
			super(type);
		}
 
	}
}