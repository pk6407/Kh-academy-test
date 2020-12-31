/**
 * 파일 첨부및 이미지 미리보기
 * 작성일 :2020.12.30
 * 작성자 : it여행자
 */
var fileUpload = function(attZone){
	var zone = document.getElementById(attZone);
	append(zone);
}

function append(zone){
	var style_div = "border:1px solid #00f;width:120px;height:100px;"
		+ "display:inline-block;position:relative;margin-right:4px;";
	var style_delBtn = "position:absolute;bottom:2px;right:2px;border-width:0;"
		+ "font-size:40px;color:#f00;opacity:0.5;background-color:rgba(0,0,0,0)";
	//이미지, file tag, button을 포함하고 있는 div
	var div = document.createElement("div");
	div.setAttribute("style", style_div);
	div.onclick = function(){
		append(zone);
	}
	zone.appendChild(div);
 
	var delBtn = document.createElement("input");
	delBtn.setAttribute("type", "button");
	delBtn.setAttribute("value", "X");
	delBtn.setAttribute("style", style_delBtn);

	div.appendChild(delBtn);
}

