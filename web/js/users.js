/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */


$('body').on("click","#editar", function(){
    
    llenarFormulario($(this).closest("tr"));   
    });
    
    $('body').on("click","#eliminar", function(){
    
    llenarFormulario($(this).closest("tr"));
    
    });
    
function llenarFormulario(fila){
    var codigo=$(fila).children("td:eq(0)").html();
    var nombre=$(fila).children("td:eq(1)").html();
    var usuario=$(fila).children("td:eq(2)").html();
    var contra=$(fila).children("td:eq(3)").html();
    var rol=$(fila).children("td:eq(4)").html();
    
    $("#txtCodigo").val(codigo);
    $("#txtNombre").val(nombre);
    $("#txtUsuario").val(usuario);
    $("#txtContra").val(contra);
    $("#sRol option:contains("+rol+ ")").attr("selected", true);
   //constain   contain
      
}