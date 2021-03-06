<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String contextPath = request.getContextPath(); %>

<!-- jquery -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- jstl -->
	<%-- Core --%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

	<%-- XML processing --%>
	<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>

	<%-- I18N formatting --%>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

	<%-- SQL --%>
	<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>

	<%-- Functions --%>
	<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
	
	
		<!--   Core JS Files   -->
	<script src="<%=contextPath%>/layout/assets/js/core/jquery.3.2.1.min.js"></script>
	<script src="<%=contextPath%>/layout/assets/js/core/popper.min.js"></script>
 	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
 
	<!-- jQuery UI -->
	<script src="<%=contextPath%>/layout/assets/js/plugin/jquery-ui-1.12.1.custom/jquery-ui.min.js"></script>
	<script src="<%=contextPath%>/layout/assets/js/plugin/jquery-ui-touch-punch/jquery.ui.touch-punch.min.js"></script>

	<!-- jQuery Scrollbar -->
	<script src="<%=contextPath%>/layout/assets/js/plugin/jquery-scrollbar/jquery.scrollbar.min.js"></script>


	<!-- Datatables 메뉴호버 -->
	<script src="<%=contextPath%>/layout/assets/js/plugin/datatables/datatables.min.js"></script>

	<!-- Bootstrap Notify -->
	<script src="<%=contextPath%>/layout/assets/js/plugin/bootstrap-notify/bootstrap-notify.min.js"></script>

	<!-- Atlantis JS -->

	<script src="<%=contextPath%>/layout/assets/js/atlantis.min.js"></script>


	<!-- Chart JS -->
	<script src="<%=contextPath%>/layout/assets/js/plugin/chart.js/chart.min.js"></script>

	<!-- jQuery Sparkline -->
	<script src="<%=contextPath%>/layout/assets/js/plugin/jquery.sparkline/jquery.sparkline.min.js"></script>

	<!-- Chart Circle -->
	<script src="<%=contextPath%>/layout/assets/js/plugin/chart-circle/circles.min.js"></script>

	<!-- jQuery Vector Maps -->
	<script src="<%=contextPath%>/layout/assets/js/plugin/jqvmap/jquery.vmap.min.js"></script>
	<script src="<%=contextPath%>/layout/assets/js/plugin/jqvmap/maps/jquery.vmap.world.js"></script>


</body>
</html>