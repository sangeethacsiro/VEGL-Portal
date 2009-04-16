<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <meta http-equiv="content-type" content="text/html; charset=utf-8"/>
    <title>About AuScope Portal</title>
    <style>
	    body {
			font: normal 11px auto "Trebuchet MS", Verdana, Arial, Helvetica, sans-serif;
			/*color: #4f6b72;*/
			color: #15428B;
			/* background: #E6EAE9;*/
			background: #EAF0F8;
			text-align: center;
		}
		
		#container {
			margin-left: auto;
			margin-right: auto;
			width: 400px;
		}
	
		a { color: #c75f3e; }
				
		#mytable {
			width: 400px;
			padding: 0;
			margin: 0;
		}
		
		caption {
			padding: 0 0 10px 0;
			width: 400px;	 
			font: italic bold 20px "Trebuchet MS", Verdana, Arial, Helvetica, sans-serif;
			text-align: center;
		}
		
		th:first-child {
			text-align: left;
		}
		
		th {
			font: bold 11px "Trebuchet MS", Verdana, Arial, Helvetica, sans-serif;
			/*color: #4f6b72;*/
			color: #15428B;
			border-right: 1px solid #C1DAD7;
			border-bottom: 1px solid #C1DAD7;
			border-top: 1px solid #C1DAD7;
			letter-spacing: 2px;
			text-transform: uppercase;
			text-align: center;
			padding: 6px 6px 6px 12px;
			/*background: #CAE8EA url(images/bg_header.jpg) no-repeat;*/
			background: #C9DBF2
		}
				
		th.nobg {
			border-top: 0;
			border-left: 0;
			border-right: 1px solid #C1DAD7;
			background: none;
		}
		
		td {
			border-right: 1px solid #C1DAD7;
			border-bottom: 1px solid #C1DAD7;
			background: #fff;
			padding: 6px 6px 6px 12px;
			color: #4f6b72;
		}
		
		td.alt {
			background: #F5FAFA;
			/*color: #797268;*/
			color: #F39650;
		}
		
		td.nobg {
			border-top: 0;
			border-left: 0;
			border-right: 0;
			border-bottom: 0;
			background: none;
		}
		
		th.spec {
			border-left: 1px solid #C1DAD7;
			border-top: 0;
			background: #fff url(images/bullet1.gif) no-repeat;
			font: bold 10px "Trebuchet MS", Verdana, Arial, Helvetica, sans-serif;
		}
		
		th.specalt {
			border-left: 1px solid #C1DAD7;
			border-top: 0;
			background: #f5fafa url(images/bullet2.gif) no-repeat;
			font: bold 10px "Trebuchet MS", Verdana, Arial, Helvetica, sans-serif;
			/*color: #797268;*/
			color: #F39650;
		}
    </style>
    <script type="text/javascript">

    //<![CDATA[
        
    function load() {
      //alert(window.location.host);
      //alert(${2+2});
    }

    function getBrowser() {
        var x = navigator;
        return x.appCodeName;
    }

    //]]>
    </script>	
  </head>
  
  <body onload="load()">
    <div id="container">
	 <table id="mytable" cellspacing="0" summary="The technical build specification">
	  <caption>${specificationTitle}</caption>
	  <tr>
	    <th scope="col" class="nobg">Build Information</th>
	    <th scope="col">Specification</th>
	  </tr>
	  <tr>
	    <th scope="row" class="spec">Version</th>
	    <td>${implementationVersion}</td>
	  </tr>
	  <tr>
	    <th scope="row" class="specalt">Build</th>
	    <td class="alt">${implementationBuild}</td>
	  </tr>
	  <tr>
	    <th scope="row" class="spec">Build Date</th>
	    <td>${buildDate}</td>
	  </tr>
	  <tr>
	    <th scope="row" class="specalt">Build Jdk</th>
	    <td class="alt">${buildJdk}</td>
	  </tr>
	  <tr>
	    <th scope="row" class="spec">Java Vendor</th>
	    <td>${javaVendor}</td>
	  </tr>
	  <tr>
	    <th scope="row" class="specalt">Build By</th>
	    <td class="alt">${builtBy}</td>
	  </tr>
	  <tr>
	    <th scope="row" class="spec">OS Name</th>
	    <td>${osName}</td>
	  </tr>
	  <tr>
	    <th scope="row" class="specalt">OS Version</th>
	    <td class="alt">${osVersion}</td>
	  </tr>
	  <tr>
	    <td scope="row" class="nobg">&nbsp;</td>
	    <td scope="row" class="nobg">&nbsp;</td>
	  </tr>
	  <tr>
	    <th scope="row" class="nobg">Runtime Information</th>
	    <th scope="row">Specification</th>
	  </tr>
	  <tr>
	    <th scope="row" class="spec">Server Name</th>
	    <td>${serverName}</td>
	  </tr>
	  <tr>
	    <th scope="row" class="specalt">Server Info</th>
	    <td class="alt">${serverInfo}</td>
	  </tr>
	  <tr>
	    <th scope="row" class="spec">Server Java Version</th>
	    <td>${serverJavaVersion}</td>
	  </tr>
	  <tr>
	    <th scope="row" class="specalt">Server Java Vendor</th>
	    <td class="alt">${serverJavaVendor}</td>
	  </tr>
     <tr>
	    <th scope="row" class="spec">Server OS Architecture</th>
	    <td>${serverOsArch}</td>
	  </tr>
     <tr>
	    <th scope="row" class="specalt">Server OS Name</th>
	    <td class="alt">${serverOsName}</td>
	  </tr>
	 <tr>
	    <th scope="row" class="spec">Server OS Version</th>
	    <td>${serverOsVersion}</td>
	 </tr> 
	</table>
   </div>
  </body>
</html>