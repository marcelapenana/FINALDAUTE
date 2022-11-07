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
    var nombre = $(fila).children('td:eq(1)').html();
<<<<<<< HEAD

    $('#txtCodigo').val(codigo);
    $('#txtNombre').val(nombre);
}
=======
>>>>>>> be26280f625cdc8200bc07bb745530bfd0a6f8b0

    $('#txtCodigo').val(codigo);
    $('#txtNombre').val(nombre);
}
