package com.ezlife.ezcomponent.message
{
	import com.ezlife.ezcomponent.model.SubmitIdentity;

	public class SubmitImmediatelyMessage extends BaseMessage
	{
		public static const NAME:String="SubmitImmediatelyMessage"
			
		public function SubmitImmediatelyMessage(identity:SubmitIdentity)
		{
			super(NAME, identity);
		}
		
		public function getID():SubmitIdentity{
			return this.data as SubmitIdentity;
		}
	}
}