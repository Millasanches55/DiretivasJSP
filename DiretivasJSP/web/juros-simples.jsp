<%-- 
    Document   : juros-simples
    Created on : Mar 26, 2025, 11:39:37 PM
    Author     : Milla
--%>

<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="java.text.DecimalFormat" %>

<%
    String capitalStr = request.getParameter("capital");
    String taxaStr = request.getParameter("taxa");
    String mesesStr = request.getParameter("meses");
    double montante = 0;

    if (capitalStr != null && taxaStr != null && mesesStr != null) {
        double capital = Double.parseDouble(capitalStr);
        double taxa = Double.parseDouble(taxaStr) / 100;
        int meses = Integer.parseInt(mesesStr);
        montante = capital * (1 + (taxa * meses));
    }
%>

<html>
<head>
    <title>Juros Simples</title>
    <style>
        body {
            text-align: center;
        }
    </style>
</head>
<body>
    <%@ include file="menu.jspf" %>

    <h2>Cálculo de Juros Simples</h2>
    <form method="GET">
        Capital: <input type="number" name="capital" step="0.01" min="1" required><br>
        Taxa de Juros (% ao mês): <input type="number" name="taxa" step="0.01" min="1" required><br>
        Meses: <input type="number" name="meses" min="1" required><br>
        <input type="submit" value="Calcular">
    </form>

    <% if (capitalStr != null) { %>
        <h3>Resultado:</h3>
        <p>Montante Futuro: R$ <%= new DecimalFormat("#,##0.00").format(montante) %></p>
    <% } %>
</body>
</html>

