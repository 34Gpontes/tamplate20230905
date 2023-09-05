<%@ page contentType="text/html;charset=UTF-8" language="java"  %>
<%@ page import="java.util.Hashtable" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%
    Hashtable tarefas;
    if(session.getAttribute("tarefas" ) instanceof Hashtable){
        Tarefas = session.getAttribute("tarefas");
    } else{
        tarefas = new Hashtable<Integer, String>();
     }
    

    tarefas.put(1, "Teste");
    tarefas.put(2, "Teste 2");

    String tarefa = "";
    if(request.getMethod().equals("POST")){
        tarefa = request.getParameter("tarefa");
    }
    request.setAttribute("tarefa",tarefa);

    session.setAttribute("tarefas", tarefas);
    %>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Tarefas</title>
    </head>
    <body>
        <form action="index.jsp" method="post">
            <input type="text" name="tarefa"/>
            <button type="submit">Salvar</button>
        </form>
        <hr />
        ${tarefa}<br />

        <ul>
            <c:forEach var="item" items="${tarefas}">
                <li>${item.value}</li>

            </c:forEach>
        </ul>
    </body>
</html>