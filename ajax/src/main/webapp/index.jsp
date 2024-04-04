<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>Insert title here</title>

<script src="http://code.jquery.com/jquery-latest.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">

<script>
	var request = new XMLHttpRequest();
	var registerRequest = new XMLHttpRequest();

	function registerFunction() {
		var registerName = encodeURIComponent(document
				.getElementById("registerName").value);
		var registerAge = encodeURIComponent(document
				.getElementById("registerAge").value);
		var registerGender = encodeURIComponent($(
				'input[name=registerGender]:checked').val());
		var registerEmail = encodeURIComponent(document
				.getElementById("registerEmail").value);

		var url = "./UserRegisterServlet?userName=" + registerName
				+ "&userAge=" + registerAge + "&userGender=" + registerGender
				+ "&userEmail=" + registerEmail;
		console.log(url);

		registerRequest.open("POST", "./UserRegisterServlet?userName="
				+ registerName + "&userAge=" + registerAge + "&userGender="
				+ registerGender + "&userEmail=" + registerEmail, true);

		registerRequest.onreadystatechange = registerProcess;
		registerRequest.send(null);
	}

	function registerProcess() {
		if (registerRequest.readyState == 4 && registerRequest.status == 200) {
			var result = registerRequest.responseText;
			if (result != 1) {
				alert("등록에 실패했습니다.");
			} else {
				alert("회원이 등록되었습니다.");
				$('#registerName').val("");
				$('#registerAge').val("");
				$('#registerEmail').val("");
				searchFunction();
			}
		}
	}

	/* function searchFunction() {
		var userName = document.getElementById("userName").value;
		console.log(userName);

		request.open("POST", "./UserSearchServlet?userName="
				+ encodeURIComponent(userName), true);
		request.onreadystatechange = searchProcess;
		request.send(null);
	}
	 */

	function searchFunction() {
		var userName = $('#userName').val();
		var URL = "UserSearchServlet?userName=" + userName;
		$.ajax({
			method : "POST",
			url : URL,
			success : searchProcess
		});
	}

	function searchProcess(data) {
		var table = $('#ajaxTable');

		table.innerHTML = "";
		var object = eval("(" + data + ")");
		var result = object.result;
		var out = "";

		$.each(result, function(i, a) {
			out += "<tr>";
			out += "<td>" + a[0].name + "</td>";
			out += "<td>" + a[1].age + "</td>";
			out += "<td>" + a[2].gender + "</td>";
			out += "<td>" + a[3].email + "</td>";
			console.log(a[0].name, a[1].age, a[2].gender, a[3].email);

			out += '</tr>';

		});

		table.empty();

		$(out).appendTo(table);

	}

	/* function searchProcess() {
		var table = document.getElementById("ajaxTable");

		table.innerHTML = "";
		if (request.readyState == 4 && request.status == 200) {
			console.log(request.responseText);

			var object = eval('(' + request.responseText + ')'); // string->object			 

			console.log(object);
			var result = object.result;
			for (var i = 0; i < result.length; i++) {
				var row = table.insertRow(0); // tr
				for (var j = 0; j < result[i].length; j++) {
					var cell = row.insertCell(j); // td
					cell.innerHTML = result[i][j].value;
				}
			}

		}

	}
	 */
	window.onload = function() {
		searchFunction();
	}
</script>
</head>

<body>

	<div class="container" style="margin-top: 10px">

		<div class="form-group row pull-right mb-2">
			<!-- 실시간 검색 -->
			<div class="col-6">
				<input class="form-control" type="text" size="20" id="userName"
					onkeyup="searchFunction()" />
			</div>
			<div class="col-2">
				<button class="btn btn-primary" type="button"
					onclick="searchFunction()">검색</button>
			</div>
		</div>

		<table class="table"
			style="text-align: center; border: 1px solid #ddd">
			<thead>
				<tr>
					<th style="background-color: #fafafa; text-align: center">이름</th>

					<th style="background-color: #fafafa; text-align: center">나이</th>

					<th style="background-color: #fafafa; text-align: center">성별</th>

					<th style="background: #fafafa; text-align: center">이메일</th>

				</tr>

			</thead>

			<tbody id="ajaxTable">
				<tr>
					<td>나동빈</td>
					<td>2</td>
					<td>남자</td>
					<td>anc@daum.net</td>
			</tbody>

		</table>
	</div>

	<!-- 회원등록양식 -->

	<div class="container">
		<table class="table"
			style="text-align: center; border: 1px solid #ddd">
			<thead>
				<tr>
					<th colspan="2"
						style="background-color: #fafafa; text-align: center">회원 등록
						양식</th>

				</tr>

			</thead>

			<tbody>

				<tr>

					<td style="background: #fafafa; text-align: center"><h5>이름</h5></td>

					<td><input class="form-control" type="text" id="registerName"
						size="20"></td>

				</tr>

				<tr>

					<td style="background: #fafafa; text-align: center"><h5>나이</h5></td>

					<td><input class="form-control" type="text" id="registerAge"
						size="20"></td>

				</tr>

				<tr>

					<td style="background: #fafafa; text-align: center"><h5>성별</h5></td>

					<td>

						<div class="form-group"
							style="text-align: center; margin: 0 auto;">

							<div class="btn-group" data-toggle="buttons">

								<label class="btn btn-primary active"> <input
									type="radio" name="registerGender" autocomplete="off"
									value="남자" checked>남자
								</label> <label class="btn btn-primary active"> <input
									type="radio" name="registerGender" autocomplete="off"
									value="여자" checked>여자
								</label>

							</div>

						</div>

					</td>

				</tr>

				<tr>

					<td style="background: #fafafa"; text-align:center"><h5>이메일</h5></td>

					<td><input class="form-control" type="text" id="registerEmail"
						size="20"></td>

				</tr>

				<td colspan="2"><button class="btn btn-primary pull-right"
						onclick="registerFunction()" type="button">등록</button></td>

			</tbody>

		</table>

	</div>

</body>

</html>