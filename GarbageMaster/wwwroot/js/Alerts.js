$(document).ready(function () {
    $(".table").prepend($("<thead></thead").append($(this).find("tr:first"))).DataTable()({
        columnDefs: [
            { width: 300, targets: 0 }
        ],
        fixedColumns: false
    });
});
function AlertforTruckSent() {
    const Toast2 = Swal.mixin({
        toast: true,
        position: 'top-end',
        showConfirmButton: false,
        timer: 3000,
        timerProgressBar: true,
        didOpen: (toast) => {
            toast.addEventListener('mouseenter', Swal.stopTimer)
            toast.addEventListener('mouseleave', Swal.resumeTimer)
        }
    })

    Toast2.fire({
        icon: 'success',
        title: 'Mail Sent',
        text: 'Mail has been sent to all the users and concerned authorities regarding the garbage disposal'
    })
}
function AlertforCheckedOut(loc1) {
    const Toast3 = Swal.mixin({
        toast: true,
        position: 'top-end',
        showConfirmButton: false,
        timer: 3000,
        timerProgressBar: true,
        didOpen: (toast) => {
            toast.addEventListener('mouseenter', Swal.stopTimer)
            toast.addEventListener('mouseleave', Swal.resumeTimer)
        }
    })

    Toast3.fire({
        icon: 'success',
        title: 'Checked Out',
        text: 'The data for all the users are set to default value'
    })
    setTimeout(() => { window.location = loc1; }, 3000);
}