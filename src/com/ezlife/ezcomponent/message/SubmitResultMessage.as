package com.ezlife.ezcomponent.message
{
	import com.ezlife.ezcomponent.model.SubmitIdentity;

	public class SubmitResultMessage extends BaseMessage
	{
		public static const NAME:String="SubmitResultMessage"
		
		public function SubmitResultMessage(isSuccess:Boolean, request:Object,response:Object,identity:SubmitIdentity)
		{
			super(NAME,{"isSuccess":isSuccess,"request":request,"response":response,"identity":identity});
			
		}
		
		public function getRequest():Object{
			return data.request;
		}
		
		public function getResponse():Object{
			return data.response;
		}
		
		public function getID():SubmitIdentity{
			return data.identity;
		}
		
		public function isSuccess():Boolean{
			return data.isSuccess;
		}
	}
}