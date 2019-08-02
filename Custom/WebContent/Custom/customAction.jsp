<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>

<%
  String DocumentId = request.getParameter("DocumentId");

System.out.println("DocumentId>>>>>>>>>>$$$$$$$$$$$$$$$***********>>>>>>>>>>>>>>>"+DocumentId);
  String OD_UID = request.getParameter("OD_UID");

System.out.println("OD_UID>>>>>>>>>>$$$$$$$$$$$$$$$***********>>>>>>>>>>>>>>>"+OD_UID);
String USERDBID= request.getParameter("USERDBID");
System.out.println("USERDBID>>>>>>>>>>$$$$$$$$$$$$$$$***********>>>>>>>>>>>>>>>"+USERDBID);

String Fulldataval= request.getParameter("Fulldataval");
System.out.println("Fulldataval>>>>>>>>>>$$$$$$$$$$$$$$$***********>>>>>>>>>>>>>>>"+Fulldataval);


%>
<script >


var DocumentId="<%=DocumentId%>";


function GetXmlHttpObject()
{
var xmlHttp=null;
try
  {
  // Firefox, Opera 8.0+, Safari
  xmlHttp=new XMLHttpRequest();
  }
catch (e)
  {
  // Internet Explorer
  try
    {
    xmlHttp=new ActiveXObject("Msxml2.XMLHTTP");
    }
  catch (e)
    {  
    xmlHttp=new ActiveXObject("Microsoft.XMLHTTP");
    }
  }
  return xmlHttp;  	
  	
}




    
</script>
<body>
<h1>This is a sample customAction jsp that is called from custom.war</h1>
<div id="customdiv"  style="height:100%;width:90%;overflow:no;" ></div>

</body>
</html>