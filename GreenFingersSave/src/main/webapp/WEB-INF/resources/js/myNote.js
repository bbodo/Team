function data_post(url) {

	fetch(url, {
		method: "POST",
		body: JSON.stringify({
			title : "dd"
		}),
		headers: {
			"content-type": "application/x-www-form-urlencoded; charset=UTF-8",
		},
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
	let url = "/myNoteWrite";
	data_post(url);

}