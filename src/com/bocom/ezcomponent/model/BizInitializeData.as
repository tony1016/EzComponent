package com.bocom.ezcomponent.model
{
	public class BizInitializeData
	{
		private var _data:Object;
		
		public function BizInitializeData()
		{
		}

		public function get data():Object
		{
			return _data;
		}

		public function set data(value:Object):void
		{
			_data = value;
		}
		
		public function isAvailable():Boolean{
			return _data?true:false;
		}
	}
}