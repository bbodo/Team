function data_post(url, data) {

	fetch(url, {
		method: "POST",
		body: data
	})
	.then(data => {
		alert('성공:' + data );
	}).catch(error => {
		console.log(error);
		alert('오류:' + error );
	});

}
alert("d");


window.onload = function () {
	
	/*<c:set var="receiver_usercode" var = '${request.getParameter("receiver_usercode")}' />
*/	
	   
	const  notetitle = document.getElementByName('notetitle').value;
	const  notecont = document.getElementByName('notecont').value;
	/*const  notetitle = document.getElementByName('보내는 사람코드 보내야 함').value;*/
	/*const  receiver_usercode = document.getElementByName('receiver_usercode').value; 유저코드 받아야 함*/
	
	let  data  =  new FormData();
	data.append( "notetitle",   notetitle );
	data.append( "notecont",   notecont );
	data.append( "receiver_usercode", 2 );
	

	data_post(url, data);
}