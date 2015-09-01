package com.ezlife.ezcomponent.message
{
	public class BaseMessage
	{
		private var _id:String;
		private var _data:Object;
		
		public function BaseMessage(id:String,data:Object)
		{
			this._id=id;
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