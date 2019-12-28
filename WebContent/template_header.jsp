<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<meta charset="UTF-8">

<head>

<style>

@media ( max-width :500px) {
    #minstryLogo img{
    display: none ;   
    }
    #HUlogo img{
    display: none ;   
    }
    header{
    
    width: 483px; 
    
    }
}



@media ( min-width :768px) {
    #minstryLogo{
		margin-right:15%;
    }
    #HUlogo{
		margin-left:15%;
    }
}

@media ( min-width :992px) {
    #minstryLogo{
		margin-right:24%;
    }
    #HUlogo{
		margin-left:24%;
    }
}

   
@media ( min-width :1200px) {
    #minstryLogo{
		margin-right:27%;
    }
    #HUlogo{
		margin-left:27%;
    }
}



header{
	height:180px;
	width:100%;
	padding:10px;  
	margin-bottom:50px;  
	background-image: linear-gradient(to bottom, #337ab7 60%, #265a88 80%);
}

header div.logo{ 
	text-align: center;

}

#minstryLogo{
	float: right; 
	margin-top: 10px ;    
}


#HUlogo{
	float: left; 
	margin-top: 10px ;    
}

#title{
	float: none; 
	margin-left:auto;
	margin-top: auto;
	margin-top:60px; 
	text-align: center;    
	font-weight:bold;
	color:#eff4ff;

}
div img{
    width:150px;
	height:150px;
}





</style>

</head>

	<header>

			<div  id="HULogo">
				<img alt="hu logo"  src="/ZGov/photos/hu_logo.png">
			</div>


			<div  id="minstryLogo">
				<img alt="ministry logo"  src="/ZGov/photos/minstry_logo.png">
			</div>

            <div id="title">
				<h2>محافظة الزرقاء <br> نظام متابعة سير العمليات </h2>
			</div>	
	</header>
