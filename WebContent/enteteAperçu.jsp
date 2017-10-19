
	<div class="wrapper">
		<header class="main-header">

    <!-- Logo -->
    <a href="#" class="logo" data-toggle="modal" data-target="#myModal">
      <!-- mini logo for sidebar mini 50x50 pixels -->
      <span class="logo-mini"><b>MO</b>OCs</span>
      <!-- logo for regular state and mobile devices -->
      <span class="logo-lg"><b>INTRANET</b> MOOCs</span>
    </a>

    <!-- Header Navbar: style can be found in header.less -->
    <nav class="navbar navbar-static-top" role="navigation">
      <!-- Sidebar toggle button-->
      <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
        <span class="sr-only">Toggle navigation</span>
      </a>
      <!-- Navbar Right Menu -->
      <div class="navbar-custom-menu">
        <ul class="nav navbar-nav">
          <!-- Messages: style can be found in dropdown.less-->
          
          <!-- Notifications: style can be found in dropdown.less -->
          <!-- Tasks: style can be found in dropdown.less -->
          <!-- User Account: style can be found in dropdown.less -->
          <li class="dropdown user user-menu">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
              <img src="dist/img/user.png" class="user-image" alt="User Image">
              <span class="hidden-xs"><%=teacher.getLogin()%></span>
            </a>
            <ul class="dropdown-menu">
              <!-- User image -->
              <li class="user-header">
                <img src="dist/img/user.png" class="img-circle" alt="User Image">

              <p>
                   <%=teacher.getLogin()%> - ADMIN
                  <small id="heure"></small>
                </p>
              </li>
              <%@include file="real-time.jsp"%>
              <!-- Menu Body -->
              <!-- Menu Footer-->
              <li class="user-footer">
                <div class="pull-right">
                  <a href="index.jsp" class="btn btn-default btn-flat">Sign out</a>
                </div>
              </li>
            </ul>
          </li>
        
        </ul>
      </div>

    </nav>
  </header>
  <aside class="main-sidebar">
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">
      <!-- Sidebar user panel -->
      <div class="user-panel">
        <div class="pull-left image">
          <img src="dist/img/user.png" class="img-circle" alt="User Image">
        </div>
        <div class="pull-left info">
          <p><%=teacher.getLogin()%></p>
          <a href="#"><i class="fa fa-circle text-success"></i> Connect&eacute; </a>
        </div>
      </div>
     
       <ul class="sidebar-menu">
        <li class="header"> NAVIGATION</li>
        <li>
          <a href="present_e.jsp?title=<%= request.getParameter("title")%>">
            <i class="fa fa-book"></i> <span>Aperçu</span> 
          </a>	
        </li>
        <li>
          <a href="ForumMenu_e.jsp?title=<%= request.getParameter("title")%>">
            <i class="fa fa-comments"></i>
            <span>Le Forum </span>
            <span class="label label-primary pull-right"></span>
          </a>
        </li>                
        <li>
          <a href="Enseignant/index.jsp">
            <i class="fa fa-home"></i>
            <span>Go Back Home</span>
          </a>
        </li>
       </ul>
    </section>

  </aside>
  <div class="content-wrapper">
   <section class="content-header">
      <h1>
        <small>Version 2.0</small>
      </h1>
    </section>