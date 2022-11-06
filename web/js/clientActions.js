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
    var nombre = $(fila).children("td:eq(1)").html();
    var fechaNac = $(fila).children("td:eq(2)").html();
    var dui = $(fila).children("td:eq(3)").html();
    var residencia = $(fila).children("td:eq(4)").html();
    var telefono = $(fila).children("td:eq(5)").html();
    var codeCategoria = $(fila).children("td:eq(6)").html();

    $('#txtCodigo').val(codigo);
    $('#txtNombre').val(nombre);
    $('#txtFechaNac').val(fechaNac);
    $('#txtDUI').val(dui);
    $('#txtResidencia').val(residencia);
    $('#txtCelular').val(telefono);
    $('#sCategorias option:contains('+codeCategoria+')').attr('selected',true);
}
