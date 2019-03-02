<%@page import="org.pstcl.ea.util.EAUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>


<html>

<head>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<script type="text/javascript">
	function saveOrUpdate() {
		document.forms['saveDailyTxForm'].submit();
	}

</script>

<%-- <c:url value='/previewOilReport-${oilReport.id}' /> --%>


<title>Energy Meters</title>
</head>

<body onload="myFunction()" style="margin: 0;">
	<%@include file="authheader.jsp"%>
	<div class="sticky-top">
		<nav aria-label="breadcrumb" class="sticky-top">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a
					href="javascript:window.location='home'">Home</a></li>

				<li class="breadcrumb-item active" aria-current="page">Upload
					File(s)</li>
			</ol>
		</nav>
	</div>
	<script type="text/javascript">
		$(document).ready(function() {

			$('.modal-content').resizable({
				//alsoResize: ".modal-dialog",
				minHeight : 300,
				minWidth : 600
			});
			$('.modal-dialog').draggable();
		});
	</script>
	<script type="text/javascript">
		$(function() {
			$('.date-picker').datepicker({
				yearRange : '2018:2020',
				changeMonth : true,
				changeYear : true,
				showButtonPanel : false,
				dateFormat : "dd/mm/yy"

			});
		});
	</script>

	<div class="container-fluid">
		<c:if test="${not empty success}">
			<div class="alert alert-success lead">${success}</div>
		</c:if>
		<span class="lead">Upload CMRI File</span>

		<div class="table-responsive">


			<form:form method="POST"
				action="uploadMultiZip?${_csrf.parameterName}=${_csrf.token}"
				modelAttribute="fileModel" enctype="multipart/form-data">
				<table>
					<tr>
						<td colspan="2"><span> <i class="fa fa-warning"
								style="font-size: 18px; color: red;"><i
									class="fas fa-exclamation-circle"></i>Please Upload files generated by the CRMI device only.
									System will not accept any other .zip file.
									</i>
						</span></td>
					</tr>
					<tr>
						<td><label>Select files to upload</label></td>

						<td><input type="file" name="files" accept="application/zip"
							multiple="multiple" /></td>
					</tr>
					<tr>
						<td><input type="submit" value="Upload" /></td>
					</tr>
				</table>


			</form:form>


		</div>
	</div>


</body>
</html>