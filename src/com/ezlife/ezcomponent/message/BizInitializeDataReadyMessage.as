package com.ezlife.ezcomponent.message
{
	import com.ezlife.ezcomponent.model.BizInitializeData;

	public class BizInitializeDataReadyMessage extends BaseMessage
	{
		public static const NAME:String="BizInitializeDataReadyMessage"
		public function BizInitializeDataReadyMessage(data:BizInitializeData)
		{
			super(NAME, data);
		}
	}
}