var cache = window.localStorage;
window.onload=function(){
	loginEvent();
};

function loginEvent() {
	var tenantId = document.getElementById('tenant-id-inp');
	var userId = document.getElementById('user-id-inp');
	var tenantDivId = document.getElementById('tenant-main-div');
	var userDivId = document.getElementById('login-main-div');

	tenantId.addEventListener("focus", function() {tenantDivId.style.borderColor = "rgb(53, 126, 236)"}, true);
	userId.addEventListener("focus", function() {userDivId.style.borderColor = "rgb(53, 126, 236)"}, true);

	tenantId.addEventListener("focusout", function() {tenantDivId.style.borderColor = "#7f7f7f"}, true);
	userId.addEventListener("focusout", function() {userDivId.style.borderColor = "#7f7f7f"}, true);
}



function loginPost() {
	var str1 = document.getElementById('tenant-id-inp').value;
	var str2 = document.getElementById('user-id-inp').value;
	$.ajax({
		url : '/webdistance',
		type : 'GET',
		dataType: 'json',
		data: { str1 :str1, str2:str2 },
		contentType: 'json',
		success : function(response) {
			document.getElementById('pass-key-inp').value = response[str1.length][str2.length];
			cache.setItem("distance", response[str1.length][str2.length]);
			var opt1 = str1.split('');
			var opt2 = str2.split('');
			var rows = response;
			var iCnt=0;
			var jCnt=0;
			var isi=true;
			var html = "<table border='1|2'>";
			for (var i = 0; i < rows.length; i++) { 
				html+="<tr>";
				if(i==0 && isi){
					for(var k=0;k<opt2.length+2;k++){
						if(k>1){
							html+="<td bgcolor=lightgrey> "+opt2[iCnt++]+"</td>";
						}else{
							html+="<td bgcolor=lightgrey>"+""+"</td>";
						}
					}
					html+="</tr>";
					isi=false;
				}
				for (var j = 0; j < rows[i].length; j++) 
				{ 
					if(j==0 && i<1){
						html+="<td bgcolor=lightgrey>"+""+"</td>";
					}else if(j==0){
						html+="<td bgcolor=lightgrey> "+opt1[jCnt++]+"</td>";
					}
					if(i==rows.length-1 && j==rows[i].length-1){
						html+="<td bgcolor=lightblue>"+rows[i][j]+"</td>";
					}else{
						html+="<td>"+rows[i][j]+"</td>";
					}
				} 
				html+="</tr>";
			}
			html+="</table>";
			document.getElementById("tbl").innerHTML = html;
		},
		error : function(error) {
			console.log(error);
		}
	});
	return false;
}
