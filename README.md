AS3Util
=======
############Project Constructor#####################
org.myhnuhai
		domain
		  .
		  ..FileInfo.as  //文件上传的数据保存对象
		events
		  .
		  ..UploadFileEvent.as //文件上传派发事件
		util
		  .
		  ..BusyCursorUtil.as  //加载等在功能
		  .
		  ..ContextUtil.as     //获取当前文件的路径
		  .
		  ..FileUploadUtil.as  //文件上传
		  . 
		  ..DateUtil.as        //日期处理工具
		  .
		  ..StringUtil.as      //字符串处理工具
		remoting
		  ..BaseService.as     //使用RemoteObject请求远程服务器数据

-----------------------------------------------------------------------------------------
1、FileInfo.as  //文件上传
例子：
protected function uploadbtn_clickHandler(event:MouseEvent):void
{
	var file:FileUploadUtil = new FileUploadUtil();
	file.addEventListener(FileUploadUtil.FILE_COMPLETE_EVENT,onComplete);
	file.browse(FileUploadUtil.OFFICE_DOC_DOCX_TYPE);
				
	function onComplete():void{
		var fileInfo:FileInfo = new FileInfo();
		fileInfo = file.fileInfo;
		showInfo("文件上传成功！");
		filename.text = fileInfo.name ;
	}
}
2、
//显示加载等待
BusyCursorUtil.showBusyCursor("数据加载中....",this);  //this是一个DisplayObject及其子类
//加载完成后隐藏
BusyCursorUtil.hideBusyCursor();
3、



AS3Util
