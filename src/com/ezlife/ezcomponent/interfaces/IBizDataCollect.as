package com.ezlife.ezcomponent.interfaces
{
	public interface IBizDataCollect
	{
		function getBizId():String
		function bizDataCollect():Object;
		function beforeBizDataCollect():void;
		function afterBizDataCollect(data:Object):void;
	}
}