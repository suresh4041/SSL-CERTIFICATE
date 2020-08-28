<!-- 
   - JSP file to get the login input from the users.
   -
   - @author : SHABBARI SRINIVASAN
   - @since  : NOV-11, 2019
   -->
<html>
<head>
<title>WES Folder</title>
<link rel="stylesheet" type="text/css" href="css/wes-login.css">
<link rel="stylesheet" type="text/css" href="css/material.min.css">

<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/wes-login.js"></script>
</head>
<body background="resource/image/background/iv-wes-login-bg.jpg" class="bg-body">

<div id="login-div" class="mdl-layout align-center">
<!-- 	<form name="login" action="login" method="POST"> -->
	<form onSubmit="return loginPost()">
			<div id="login-inner-div" class="mdl-shadow--16dp container animate-zoom">
			<div id="title-lbl-div">
				<label id="title-lbl-id" class="mdl-textfield__label">Levenshtein Distance</label>
			</div>
			<div id="tenant-main-div" class="tenant-div">
				<label id="tenant-id-lbl" class="mdl-textfield__label animate-zoom">String 1</label>
				<input id="tenant-id-inp" type="text" class="mdl-textfield__input login-input" name="String 1" autocomplete="off" title="String 1" value="${tenantId}" required oninvalid="this.setCustomValidity('Please enter String 1')">
			</div>
			<div id="login-main-div">
				<label id="login-id-lbl" class="mdl-textfield__label animate-zoom">String 2</label>
				<input id="user-id-inp" type="text" class=" mdl-textfield__input login-input" name="String 2" autocomplete="off" title="String 2" value="${loginId}" required oninvalid="this.setCustomValidity('Please enter String 2')">
			</div>
			<div id="passkey-main-div">	
				<label id="pass-key-lbl" class="mdl-textfield__label animate-zoom">Result</label>
				<input id="pass-key-inp" type="Result" class="mdl-textfield__input login-input" name="Result" value="" title="Result" readonly="readonly"">
			</div>
			<div id="login-btn-div">
				<input type="submit" id="wes-login-btn" name="buttonId" value="Login" class="mdl-button btnPro">
			</div>
		</div>
	</form>
</div>
<div id="tbl">
</div>
</body>
</html>