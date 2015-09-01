package com.bocom.ezcomponent.interfaces
{
	import com.bocom.ezcomponent.model.BizInitializeData;

	public interface IBizDataInitialize
	{
		function bizInitialize(bizInitailizeData:BizInitializeData):void;
		function beforeBizInitialize(bizInitailizeData:BizInitializeData):void;
		function afterBizInitialize(bizInitailizeData:BizInitializeData):void;
	}
}