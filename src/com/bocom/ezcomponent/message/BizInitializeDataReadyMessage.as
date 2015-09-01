package com.bocom.ezcomponent.message
{
	import com.bocom.ezcomponent.model.BizInitializeData;

	public class BizInitializeDataReadyMessage extends BaseMessage
	{
		public function BizInitializeDataReadyMessage(data:BizInitializeData)
		{
			super("BizInitializeDataReadyMessage", "BizInitializeDataReadyMessage", data);
		}
	}
}