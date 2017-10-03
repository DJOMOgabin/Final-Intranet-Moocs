
<%@ include file="../WEB-INF/jspf/bean/teacher.jspf"%>

	<jsp:useBean id="teachers" class="Modele.Teachers">
	
		<jsp:setProperty name="teachers" property="name" param="name"/>
		<jsp:setProperty name="teachers" property="surname" param="surname"/>
		<jsp:setProperty name="teachers" property="password" param="password"/>
        <jsp:setProperty name="teachers" property="status" param="status"/>
		<jsp:setProperty name="teachers" property="sexe" param="sexe"/>
		<jsp:setProperty name="teachers" property="email" param="email"/>
		
                
	</jsp:useBean>

       
        <%teachers.enregistreBD();%>
        <%System.out.println("{success: 'ok'}");%>
       
      