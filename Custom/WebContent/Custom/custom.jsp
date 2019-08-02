<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>

<%!

public static int escapeHtml(int str) {
	 return str;
}  

public static String escapeHtml(String str) {
     if(str!=null && !"".equalsIgnoreCase(str)){
    StringBuilder out = new StringBuilder(Math.max(16, str.length()));
    for (int i = 0; i < str.length(); i++) {
        char c = str.charAt(i);
        //if (c > 127 || c == '"' || c == '<' || c == '>' || c == '&'|| c == '\'') {
		if ((c > 127 && (!(c>1535 && c<1792)))|| c == '"' || c == '<' || c == '>' ||  c == '\'' ||  c == '`' ||  c == '!' ||  c == '[' ||  c == ']' || c == '{' ||  c == '}' ||  c == '&') {
            out.append("&#");
            out.append((int) c);
            out.append(';');
        } else {
            out.append(c);
        }
    }
    return out.toString();
     }
     else
         return str;
}
     %>

<%
  String docId = escapeHtml(request.getParameter("docId"));
String destinationFolderPath = escapeHtml(request.getParameter("DestFolderPath"));
String dataDefName           = escapeHtml(request.getParameter("dataDefName"));
String configurationType=escapeHtml(request.getParameter("confType"));
String ddestinationFolderPath=destinationFolderPath;
String globalIndexdetails=escapeHtml(request.getParameter("globalIndexdetails"));	
String generalTextShow=escapeHtml(request.getParameter("generalTextShow"));
String userdbid = escapeHtml(request.getParameter("userDbId"));
String rid = escapeHtml(request.getParameter("rid"));
String CabinetName = escapeHtml(request.getParameter("CabinetName"));


%>
<script >


var docId="<%=docId%>";
var globalIndexdetails="<%=globalIndexdetails%>";
var generalTextShow="<%=generalTextShow%>";
//alert("generalTextShow>>>>>>>in >>>>>custom.jsp"+generalTextShow);
var userdbid="<%=userdbid%>";
var rid="<%=rid%>";

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


function modifyDocumentprop()
{
  alert("This method is called from custom.jsp");
  
  var docName="",docIndex="",keywords="",comments="";
  
  var xmlHttp=null;
 	xmlHttp = GetXmlHttpObject();
	if(xmlHttp==null)
  	{
 	 	alert(XMLHTTP_NOT_SUPPORTED);
  		return false;
  	}
	var url= location.protocol + "//" + location.host +"/"+"Custom/Component/omniProcess/documentPropertyOP?documentIndex=<%= docId%>&CabinetName=<%=CabinetName%>&UserDBID=<%=userdbid%>&rid=<%=rid%>&DataAlsoFlag=Y&OptionalParameters=&";
	xmlHttp.open("POST",url,false);
	xmlHttp.send(null);
	if (xmlHttp.status ==200 && xmlHttp.readyState==4) 
	{  
		 textToShow = eval('('+xmlHttp.responseText+')');
		docIndex=textToShow[0].DocumentIndex;
		 docName=textToShow[1].DocumentName;
		 keywords= textToShow[18].Keywords;
		comments= textToShow[19].Comment;	

		}
  

             var customdivText="";
	   		                           
            customdivText=        '<table>' +
		                        '<tr>'+							                 	
								'<td class="EWLabelGrey" valign="top">Document Name :'+
                                '</td>'+
								'<td class="EWLabelGrey" valign="top">'+docName+
                                '</td>'+
                             '</tr>'+
                                '<tr>'+							                 	
								'<td class="EWLabelGrey" valign="top">Document Index :'+
                                '</td>'+
								'<td class="EWLabelGrey" valign="top">'+docIndex+
                                '</td>'+
                             '</tr>'+
                                 '<tr>'+							                 	
								'<td class="EWLabelGrey" valign="top">Keywords :'+
                                '</td>'+
								'<td class="EWLabelGrey" valign="top">'+keywords+
                                '</td>'+
                             '</tr>'+
                                '<tr>'+							                 	
								'<td class="EWLabelGrey" valign="top">Comments :'+
                                '</td>'+
								'<td class="EWLabelGrey" valign="top">'+comments+
                                '</td>'+
                             '</tr>'+
							 
							 '<table>' ;
							 
  document.getElementById("customdiv").innerHTML=customdivText;
	

    }

    
</script>
<body>
<h1>This is a sample custom jsp that is called from custom.war</h1>
<div id="customdiv"  style="height:100%;width:90%;overflow:no;" ></div>

</body>
</html>