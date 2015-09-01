package com.bocom.ezcomponent.message
{
	public class BaseMessage
	{
		private var _id:String;
		private var _type:String;
		private var _data:Object;
		
		public function BaseMessage(id:String,type:String,data:Object)
		{
			this._id=id;
			this._type=type;
			this._data=data;
		}
		
		
		public function get id():String
		{
			return _id;
		}

		public function set id(value:String):void
		{
			_id = value;
		}

		public function get type():String
		{
			return _type;
		}

		public function set type(value:String):void
		{
			_type = value;
		}

		public function get data():Object
		{
			return _data;
		}

		public function set data(value:Object):void
		{
			_data = value;
		}


	}
}