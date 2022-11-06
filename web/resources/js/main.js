//Generic functions
const showSuccessAlert = msg => {
    Swal.fire({
        icon: 'success',
        title: 'Éxito',
        text: msg,
        background: '#303030',
        color: '#fff'
    });
}

const showConfirmationAlert = (msg) => {
    return Swal.fire({
        icon: 'question',
        title: 'Confimación',
        text: msg,   
        showCancelButton: true,
        background: '#303030',
        cancelButtonText: 'Cancelar',
        showConfirmButton: true,
        confirmButtonText: 'Sí',
        color: '#fff'
    })
}

const showErrorAlert = msg => {
    Swal.fire({
        icon: 'error',
        title: 'Error',
        text: msg,
        background: '#303030',
        color: '#fff'
    });
}   