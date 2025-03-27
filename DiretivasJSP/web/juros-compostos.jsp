<%-- 
    Document   : juros-compostos
    Created on : Mar 26, 2025, 11:40:31 PM
    Author     : Milla
--%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="java.text.DecimalFormat" %>

<%
    String capitalStr = request.getParameter("capital");
    String taxaStr = request.getParameter("taxa");
    String mesesStr = request.getParameter("meses");

    double capital = 0;
    double taxa = 0;
    int meses = 0;
    boolean calculado = false;

    if (capitalStr != null && taxaStr != null && mesesStr != null) {
        capital = Double.parseDouble(capitalStr);
        taxa = Double.parseDouble(taxaStr) / 100;
        meses = Integer.parseInt(mesesStr);
        calculado = true;
    }
%>

<html>
<head>
    <title>Juros Compostos</title>
    <style>
        body {
            text-align: center;
        }
    </style>
</head>
<body>
    <%@ include file="menu.jspf" %>

    <h2>Cálculo de Juros Compostos</h2>
    <form method="GET">
        Capital: <input type="number" name="capital" step="0.01" min="1" required><br>
        Taxa de Juros (% ao mês): <input type="number" name="taxa" step="0.01" min="1" required><br>
        Meses: <input type="number" name="meses" min="1" required><br>
        <input type="submit" value="Calcular">
    </form>

    <% if (calculado) { %>
<h3 style="text-align: center;">Resultados:</h3>
<table border="2" style="margin: auto; text-align: center;">
    <tr>
        <th>Mês</th>
        <th>Montante</th>
    </tr>
    <%
        double montante = capital;
        DecimalFormat df = new DecimalFormat("#,##0.00");
        for (int i = 1; i <= meses; i++) {
            montante *= (1 + taxa);
    %>
    <tr>
        <td><%= i %></td>
        <td>R$ <%= df.format(montante) %></td>
    </tr>
    <% } %>
</table>
<% } %>

