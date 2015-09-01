package com.bocom.ezcomponent.interfaces
{
	public interface IBizDataCollect
	{
		function getBizId():String
		function bizDataCollect():Object;
		function beforeBizDataCollect(data:Object):void;
		function afterBizDataCollect(data:Object):void;
	}
}