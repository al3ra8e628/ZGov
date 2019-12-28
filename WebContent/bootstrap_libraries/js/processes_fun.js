


function addProcess() {
	var personId = document.getElementsByName("PERSON_ID")[0].value ; 

	if(personId.length == 0){
		alert("ادخل الرقم الوطني") ;
		return ; 
	}

	var regex = new RegExp("[^0-9]");
	if(regex.test(personId)){ 
		alert("لا يجب ان يحتوي الرقم الوطني على احرف او رموز") ;
		return ; 
	}

	if(personId.length != 10){
		alert("يجب ان يتكون الرقم الوطني من عشرة ارقام") ;
		return ; 
	}

	$.post("/ZGov/GovSystem?HU$CMD=GET_PERSON_BY_ID&person_id="+personId
			, function(request) {
		if(request == -1){
			if(confirm("الرقم الوطني غير صحيح هل ترغب في اضافة سجل فرد ؟")) {
				  var win = window.open("/ZGov/User/add_person.jsp" , '_blank');
				  win.focus();	
			} 
		}else{
			var obj = JSON.parse(request + "");
			if(confirm(" الرقم الوطني يعود الى "+"(("+obj.first_name+"  "+obj.last_name+"))"+" هل انت متأكد من اجراء العملية ؟ ")){
				document.getElementById("form").submit();
			}  	
		}
	});

	
	//1) 
	//2)   
	
	/**
	 * 0) add this file into /ZGov/WebContent/bootstrap_libraries/js with file name = processes_fun.js
	 *	@_@ @_@ @_@ @_@ @_@ @_@ @_@ @_@ @_@ @_@ @_@ @_@ @_@ @_@ @_@ @_@ @_@ @_@ @_@ @_@ @_@ @_@ @_@ @_@
	 * 1) change the input type from "submit" to "button" and add onclick="addProcess()"
	 * 2) add ---id--- attribute to form tag with value "form" ----> id="form"
	 * 3) add scripts files links into the head tag
	 * <script src="/ZGov/bootstrap_libraries/js/jquery-3.2.1.js"/></script>
	   <script src="/ZGov/bootstrap_libraries/js/processes_fun.js"/></script>
	 */
}


