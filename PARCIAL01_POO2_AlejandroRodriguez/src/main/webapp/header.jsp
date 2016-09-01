<%-- 
    Document   : header
    Created on : 08-10-2016, 10:14:09 PM
    Author     : aleso
--%>
<!DOCTYPE html>
<html>
    <head>
        <title>Guia 3</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link type='text/css' rel='stylesheet' href='css/materialize.min.css'/>
	<link type='text/css' rel='stylesheet' href='css/icons.css'/>
        <link type='text/css' rel='stylesheet' href='css/style.css'/>
        <script type='text/javascript' src='js/jquery-2.2.3.min.js'></script>
        <script type='text/javascript' src='js/jquery.validate.min.js'></script>
        <script type='text/javascript' src='js/messages_es.min.js'></script>
        <script>
            $().ready(function() {
                $("#frmpers").validate({
                    rules: {
                            NombPers: "required",
                            ApelPers: "required",
                            DuiPers: "required",
                            NitPers: "required",
                            fechNaci: {
                                required: true,
                                date: true
                            }
                    },
                    errorElement: 'div'
                });
            });
        </script>
    </head>
    <body>
        <header>
            <nav>
                <div class="nav-wrapper light-blue darken-4">
                    <a href="#!" class="brand-logo">Guia con JPA</a>
                    <a href="#" data-activates="mobile-demo" class="button-collapse"><i class="material-icons">menu</i></a>
                    <ul class="right hide-on-med-and-down">
                      <li><a href="index.jsp">Lugar Acceso</a></li>
                      <li><a href="tipodocu.jsp">Tipo Docu</a></li>
                      <li><a href="tipogafe.jsp">Tipo Gafete</a></li>
                    </ul>
                    <ul class="side-nav" id="mobile-demo">
                      <li><a href="index.jsp">Lugar Acceso</a></li>
                      <li><a href="tipodocu.jsp">Tipo Docu</a></li>
                      <li><a href="tipogafe.jsp">Tipo Gafete</a></li>
                    </ul>
                </div>
            </nav>
        </header>
        <main>
