package com.ezlife.ezcomponent.util
{
	import flash.utils.describeType;

	public class LogFormatter
	{
		public function LogFormatter()
		{
		}
		
		public static function appendClassname(msg:String,caller:Object):String{
			return "[" +describeType(caller).@name+
				"]"+msg;
		}
	}
}