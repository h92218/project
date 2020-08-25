<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><tiles:getAsString name="title"/></title>
<!-- Compiled and minified CSS -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">

</head>
<body>
<div id="clubmanage" class="row">
	<div id="clubmanage_header" class="col s12">
		<tiles:insertAttribute name="header"/>
	</div>
	<div id="clubmanage_sidebar" class="col s12 m4 l3">
			<tiles:insertAttribute name="sidebar"/>
	</div>
	<div id="clubmanage_body" class="col s12 m8 l9">
			<tiles:insertAttribute name="body"/>
	</div>
	<div id="clubmanage_footer">
		<tiles:insertAttribute name="footer"/>
	</div>
</div>
<!-- Compiled and minified JavaScript -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>	
</body>
</html>

