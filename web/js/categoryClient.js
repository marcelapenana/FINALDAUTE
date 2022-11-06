/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */


$('body').on("click", "#editar", function () {

    llenarFormulario($(this).closest("tr"));
});

$('body').on("click", "#eliminar", function () {

    llenarFormulario($(this).closest("tr"));

});

function llenarFormulario(fila) {
    var codigo = $(fila).children("td:eq(0)").html();
    var categoria = $(fila).children("td:eq(1)").html();

    $("#txtCodigo").val(codigo);
    $("#txtCategoria").val(categoria);

}