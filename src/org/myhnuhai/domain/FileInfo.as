package org.myhnuhai.domain
{
	import flash.utils.ByteArray;

	public class FileInfo
	{
		private var _creationDate:Date;
		private var _creator:String;
		private var _data:ByteArray;
		private var _modificationDate:Date;
		private var _name:String;
		private var _size:Number;
		private var _type:String;
		
		public function get creationDate():Date
		{
			return _creationDate;
		}

		public function set creationDate(value:Date):void
		{
			_creationDate = value;
		}

		public function get creator():String
		{
			return _creator;
		}

		public function set creator(value:String):void
		{
			_creator = value;
		}

		public function get data():ByteArray
		{
			return _data;
		}

		public function set data(value:ByteArray):void
		{
			_data = value;
		}
 
		public function get modificationDate():Date
		{
			return _modificationDate;
		}

		public function set modificationDate(value:Date):void
		{
			_modificationDate = value;
		}

		public function get name():String
		{
			return _name;
		}

		public function set name(value:String):void
		{
			_name = value;
		}

		public function get size():Number
		{
			return _size;
		}

		public function set size(value:Number):void
		{
			_size = value;
		}

		public function get type():String
		{
			return _type;
		}

		public function set type(value:String):void
		{
			_type = value;
		}
 
	}
}