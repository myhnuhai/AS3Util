package org.myhnuhai.util
{
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IOErrorEvent;
	import flash.events.ProgressEvent;
	import flash.net.FileFilter;
	import flash.net.FileReference;
	import flash.utils.ByteArray;
	
	import org.myhnuhai.domain.FileInfo;
	import org.myhnuhai.events.UploadFileEvent;
	
	public class FileUploadUtil extends EventDispatcher
	{
		private var _fileReference:FileReference = new FileReference();
		
		private var _fileInfo:FileInfo;
		
		public static var FILE_COMPLETE_EVENT:String = "File_Complete";
		
		public static var IMAGE_TYPE:FileFilter = new FileFilter("图片 (*.jpg, *.jpeg, *.gif,*.png)", "*.jpg; *.jpeg; *.gif; *.png");
		public static var TEXT_TYPE:FileFilter = new FileFilter("文本文件(*.txt)","*.txt;");
		public static var OFFICE_TYPE:FileFilter = new FileFilter("Office文件(*.doc, *.docx, *.ppt, *.pptx ,*.xls ,*.xlsx)","*.doc; *.docx; *.ppt; *.pptx; *.xls; *.xlsx");
		public static var OFFICE_DOC_DOCX_TYPE:FileFilter = new FileFilter("Word文件(*.doc, *.docx)","*.doc; *.docx");
		public static var ALL_TYPE:FileFilter = new FileFilter("所有文件(*.*)","*.*");
		
		 
		public function get fileInfo():FileInfo
		{
			return _fileInfo;
		}

		public function get fileReference():FileReference
		{
			return _fileReference;
		}
	 
		public function browse(fileType:FileFilter):void{
			
			_fileReference.addEventListener(Event.SELECT, selectHandler);
			_fileReference.addEventListener(Event.COMPLETE, completeHandler);
			_fileReference.addEventListener(ProgressEvent.PROGRESS, progressHandler);
			_fileReference.addEventListener("ioError", ioerrorHandler);
			
			_fileReference.browse(getFileFilter(fileType));
		}
		
		//
		private function getFileFilter(fileType:FileFilter):Array{
			
			var fileTypes:Array = new Array(fileType);
			
			return fileTypes;
		}
		
		private function ioerrorHandler(event:IOErrorEvent):void{
			trace("Unable to upload file."+event);
		}
		
		private function progressHandler(event:ProgressEvent):void{
			trace("progressHandler name = " + _fileReference.name);
		}
		
		private function selectHandler(event:Event):void{
			trace("selectHandler: name = " + _fileReference.name);
			_fileReference.load();
		}
		
		private function completeHandler(event:Event):void{
			_fileInfo = new FileInfo();
			
			_fileInfo.creationDate = _fileReference.creationDate;
			_fileInfo.creator = _fileReference.creator;
			_fileInfo.data = _fileReference.data;
			_fileInfo.modificationDate = _fileReference.modificationDate;
			_fileInfo.name = _fileReference.name;
			_fileInfo.size = _fileReference.size;
			_fileInfo.type = _fileReference.type;
			
			var dispatchEvt:UploadFileEvent = new UploadFileEvent(UploadFileEvent.FILE_COMPLETE_EVENT);
			dispatchEvt.fileInfo = _fileInfo;
			this.dispatchEvent(dispatchEvt);
		}
	}
}