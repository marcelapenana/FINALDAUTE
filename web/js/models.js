/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */
$('body').on('click', '#editar', function () {
    llenarFormulario($(this).closest('tr'));
});
$('body').on('click', '#eliminar', function () {
    llenarFormulario($(this).closest('tr'));
});
function llenarFormulario(fila) {
    var codigo = $(fila).children('td:eq(0)').html();
    var code = $(fila).children('td:eq(1)').html();
    var nombre = $(fila).children('td:eq(2)').html();
    var anio = $(fila).children('td:eq(3)').html();
    var precio = $(fila).children('td:eq(4)').html();
    var color = $(fila).children('td:eq(5)').html();
    var marcas = $(fila).children('td:eq(6)').html();

    //llenar controles de formulario
    $('#txtCodigo').val(codigo);
    $('#txtCodName').val(code);
    $('#txtNombre').val(nombre);
    $('#txtAnio').val(anio);
    $('#txtPrecio').val(precio);
    $('#sMarColors option:contains(' + color + ')').attr('selected', true);
    $('#sMarcas option:contains(' + marcas + ')').attr('selected', true);
}

$(function () {

    const $ventanaModal = $('#mdlFormulario');
    const $botonVentanaModal = $('#mdlFormulario');

    $botonVentanaModal.on('click', function () {
        $ventanaModal.modal('show');
    });

    $ventanaModal.on('hidden.bs.modal', function (event) {

        const $formulario = $ventanaModal.find('form');
        $formulario[0].reset();

    });


});
<<<<<<< HEAD
=======

>>>>>>> be26280f625cdc8200bc07bb745530bfd0a6f8b0

