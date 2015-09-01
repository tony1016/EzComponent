package com.ezlife.ezcomponent.model
{
	public class SubmitIdentity
	{
		private var _id:String;

		public function get id():String
		{
			return _id;
		}

		public function SubmitIdentity(id:String)
		{
			this._id=id;
		}
	}
}