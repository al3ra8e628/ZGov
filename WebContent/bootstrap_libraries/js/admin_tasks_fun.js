function setUserValues(user_id , person_id){
	
	var userId = document.getElementsByName('user_id')[0];
	var first_name = document.getElementById("first_name") ;
	var last_name = document.getElementById("last_name") ;
	check_icon	
	var check_icon = document.getElementById("check_icon") ;
	
	userId.value = +user_id ; 
	
		$.post("/ZGov/GovSystem?HU$CMD=GET_PERSON_BY_ID&person_id="+person_id
				, function(request) {
			var obj = JSON.parse(request + "");
			first_name.value = obj.first_name ; 	
			last_name.value = obj.last_name ;	
			});
		
	check_icon.onclick = "" ; 	
	userId.readOnly = true ;  		
	activeSubmit();
	
}


function getUser(source) {
	var user_id = document.getElementsByName('user_id')[0];
	var pp = user_id.value;
	
	if (!isNaN(pp) && pp != "") {
		$.post("/ZGov/GovSystem?HU$CMD=GET_USER_BY_ID&USER_ID="+pp
				, function(request) {
			
			var obj = JSON.parse(request);
			if (request != -1) {
					var form = document.createElement('form');
					
					if(source == 1)
						form.setAttribute('action','/ZGov/GovSystem?HU$CMD=OPEN_FILE&DIS=ADD_PRIVILEGE');
					else if (source == 0)
						form.setAttribute('action','/ZGov/GovSystem?HU$CMD=OPEN_FILE&DIS=REMOVE_PRIVILEGE');
					 
					
					form.setAttribute('method', 'POST');

					var user_id = document.createElement('input');
					user_id.setAttribute('type', 'text');
					user_id.setAttribute('name', 'user_id');
					user_id.setAttribute('value', pp);

					var person_id = document.createElement('input');
					person_id.setAttribute('type', 'text');
					person_id.setAttribute('name', 'person_id');
					person_id.setAttribute('value', obj.person_id);

					form.appendChild(user_id);
					form.appendChild(person_id);
					document.body.appendChild(form);
					form.submit();

			} else {
				alert("الرقم الوظيفيس غير صحيح");
			}
		});
	} else {
		alert("الرقم الوظيفي غير صحيح");
	}

}


function getProccessNum() {

	var select = document.getElementsByName('department_id')[0];

	$.post("/ZGov/GovSystem?HU$CMD=GET_DEPARTMENT_BY_ID&department_id="
			+ select.value, function(request) {

		var obj = JSON.parse(request + "");
		var processNum = document.getElementsByName("process_num")[0];
		var number = +obj.max_num_of_process;
		processNum.value = (number != 0) ? number + 1 : select.value + "01";
	});
}


function getPerson(arg) {

	var person_id = document.getElementsByName('person_id')[0];

	if (!isNaN(person_id.value) && person_id.value != "") {
		$.post("/ZGov/GovSystem?HU$CMD=GET_PERSON_BY_ID&person_id="
				+ person_id.value, function(request) {

			if (request != -1) {

				var obj = JSON.parse(request + "");

				if (arg == 1) {
					if (obj.employee_id != 0) {
						var user_id = document.getElementsByName('user_id')[0];
						user_id.value = obj.employee_id;
					} else {
						alert("يجب اضافة صاحب هذا السجل كموظف");
						return;
					}

				}

				person_id.readOnly = true;

				var first_name = document.getElementsByName('first_name')[0];
				var last_name = document.getElementsByName('last_name')[0];

				first_name.value = obj.first_name;
				last_name.value = obj.last_name;
				
					activeSubmit();

				
			} else {
				alert("الرقم الوطني غير صحيح");
			}

		});

	} else {
		alert("الرقم الوطني غير صحيح");
	}

}
function activeSubmit() {
	var btn = document.getElementsByName('submit')[0];
	btn.onclick = "";
	btn.type = "submit";
}


function setResultText(src, msg) {
	var resText = document.getElementById("result");

	switch (src) {
	case 1:
		if (msg == 1) {
			resText.innerHTML = "تمت اضافة السجل بنجاح";
			resText.classList = "text-success";

		} else {
			resText.innerHTML = "لم تتم العملية يرجى التأكد من المعلومات والمحاولة مرة اخرى";
			resText.classList = "text-danger";
		}
		break;

	case 2:
		if (msg == 1) {
			resText.innerHTML = "تمت اضافة الموظف بنجاح";
			resText.classList = "text-success";

		} else {
			resText.innerHTML = "لم تتم العملية يرجى التأكد من المعلومات والمحاولة مرة اخرى";
			resText.classList = "text-danger";
		}
		break;

	case 3:
		if (msg == 1) {
			resText.innerHTML = "تمت اضافة المستخدم بنجاح";
			resText.classList = "text-success";

		} else {
			resText.innerHTML = "لم تتم العملية يرجى التأكد من المعلومات والمحاولة مرة اخرى";
			resText.classList = "text-danger";
		}
		break;

	case 4:
		if (msg == 1) {
			resText.innerHTML = "تمت اضافة الدائرة بنجاح";
			resText.classList = "text-success";

		} else {
			resText.innerHTML = "لم تتم العملية يرجى التأكد من المعلومات والمحاولة مرة اخرى";
			resText.classList = "text-danger";
		}
		break;

	case 5:
		if (msg == 1) {
			resText.innerHTML = "تمت اضافة المعاملة  بنجاح";
			resText.classList = "text-success";

		} else {
			resText.innerHTML = "لم تتم العملية يرجى التأكد من المعلومات والمحاولة مرة اخرى";
			resText.classList = "text-danger";
		}
		break;

	case 6:
		if (msg == 1) {
			resText.innerHTML = "تمت  االعملية  بنجاح";
			resText.classList = "text-success";

		} else {
			resText.innerHTML = "لم تتم العملية يرجى التأكد من المعلومات والمحاولة مرة اخرى";
			resText.classList = "text-danger";
		}
		break;

	case 7:
		resText.innerHTML = "اسم المستخدم او كلمة المرور غير صحيحة";
		break;
	}

}


function clearResult() {

	var resTexts = document.getElementById("result");
	resTexts.innerHTML = "";

}

function errorMsg(arg) {

	if (arg == "notPerson") {

		alert("يجب التاكد من صحة الرقم الوطني");

	} else if (arg == "notPerson||department") {

		alert("يجب التأكد من صحة الرقم الوطني و رقم الدائرة");

	} else if (arg == "notEmployee") {

		alert("يجب التأكد من صحة الرقم الوظيفي");

	}
	
	
}
