package com.bocom.ezcomponent.interfaces
{
	public interface IBizDataSubmit
	{
		function bizDataSubmit():Object;
		function beforeBizDataSubmit(data:Object):void;
		function afterBizDataSubmitSuccess(data:Object):void;
		function afterBizDataSubmitFail(data:Object):void;
	}
}