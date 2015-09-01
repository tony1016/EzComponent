package com.ezlife.ezcomponent.interfaces
{
	import com.ezlife.ezcomponent.model.BizInitializeData;

	public interface IBizDataInitialize
	{
		function bizInitialize(bizInitailizeData:BizInitializeData):void;
		function beforeBizInitialize(bizInitailizeData:BizInitializeData):void;
		function afterBizInitialize(bizInitailizeData:BizInitializeData):void;
	}
}