function createAJAX()
{
    var ajax=null;
    try
    {
    	ajax= new ActiveXObject("micosoft.xmlhttp");
    }catch(ex)
    {
    	try
    	{
    		ajax = new XMLHttpRequest();
    	}catch(ex)
    	{
    		alert("该浏览器不支持Ajax");
    	}	
    }
    return ajax;
}