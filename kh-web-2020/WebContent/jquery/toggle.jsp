<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>toggle</title>
<style>
	#target{
	 border:2px solid black;
	 width: 250px;
	 height: 100px;
	 font-weight: bolder;
	 text-align: center;
	 line-height: 100px;
	
	}
	
	#btnToggle{
		width: 120px;
		height: 30px;
		line-height:30px;
		cursor: pointer;
	}
	
	.target_on{
		background-color:#ff0;
		color:#f00;
	}
	
	.target_off{
		background-color:#000;
		color:#fff;

	}
	
	#parent{
		width:250px;
		height:100px;
	}
</style>
</head>
<body>
<div id = 'toggle'>
	<div id = 'parent'>
		<div id = 'target'>
			<p>HRD 잘하자</p>
		</div>
	</div>
	<br/>
	 <input type="button" value ='ON/OFF' id= 'btnToggle'/>
</div>

<script>
$('#btnToggle').on('click', function(){
	$('#target').toggle(even, odd);
});

function even(){
	$('#target').attr('class','target_on');
}

function odd(){
	$('#target').attr('class','target_off');
}


/* 실패
$('#btnToggle').toggle(
		function(){
			$('#toggle>#target').attr('class','target_on');
		}, 
		function(){
			$('#toggle>#target').attr('class','target_off');
		});
*/		
		
/* 실패
$('#toggle>#btnToggle').on('click', function(){
	$('#toggle>#target').toggle('target_on', 'target_off');
});*/

</script>
</body>
</html>