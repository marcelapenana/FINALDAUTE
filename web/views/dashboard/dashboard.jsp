<%-- 
    Document   : dashboard      
    Created on : 05-Nov-2022, 08:52:31
    Author     : Luis   
--%> 

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="../../template/auth.jsp" %>
<%@include file="../../template/menu.jsp" %>

<div class="container pt-4 text-center">
    <div class="row text-center mb-1 mt-4">
        <div class="col-md-12">
            <h2>Dashboard</h2>            
        </div>
    </div>   

    <div class="row">
        <div class="col-md-12 col-lg-6"> 
            <div id="chart_div"></div>
        </div>
        
        <div class="col-md-12 col-lg-6"> 
            <div id="chart_div2"></div>
        </div>
    </div>

</div>    

<script type="text/javascript">
    // Load the Visualization API and the corechart package.
    google.charts.load('current', {'packages': ['corechart']});

// Set a callback to run when the Google Visualization API is loaded.
    google.charts.setOnLoadCallback(drawChart);

// Callback that creates and populates a data table,
// instantiates the pie chart, passes in the data and
// draws it.
    function drawChart() {

        // Create the data table.
        var data = new google.visualization.DataTable();
         data.addColumn('string', 'Fecha');
         data.addColumn('number', 'Ventas');
         data.addRows([
             <c:forEach items="${data}" var="d">
                ['${d.dateSale}', ${d.salTotal}],
            </c:forEach>
         ]);
        /*var data = google.visualization.arrayToDataTable([
            ['Fecha', 'Total'],
            
        ]);*/

        // Set chart options
        var options = {'title': 'Ventas por dia',
            'width': 600,
            'height': 600,
            'is3D': true,

        };
        console.log(data.cache);
        // Instantiate and draw our chart, passing in some options.
        var chart = new google.visualization.PieChart(document.getElementById('chart_div'));
        chart.draw(data, options);
        var chart2 = new google.visualization.ColumnChart(document.getElementById('chart_div2'));
        chart2.draw(data, options);
    }
</script>
<script src="${pageContext.servletContext.contextPath}/resources/js/dashboard.js" type="text/javascript"></script>

</body>
</html>   