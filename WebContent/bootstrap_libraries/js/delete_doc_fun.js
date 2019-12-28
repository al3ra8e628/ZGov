function deleteAction(documentId , dataSourceId) {
	if (confirm('هذا الخيار سيقوم بحذف كافة المعلومات المتعلقة بهذه المعاملة , هل انت متأكد ؟')) {
		$.post("/ZGov/GovSystem?HU$CMD=DELETE_DOCUMENT&doc_id="+documentId,function(request){
			
			window.location.replace("http://localhost:8085/ZGov/GovSystem?HU$CMD=OPEN_APPLICATION&dataSourceId="+dataSourceId);

		});

	} else {
		alert("لم يتم حذف العملية") ; 
	} 
	
}
