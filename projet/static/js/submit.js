$(document).ready(function() {
    $('#formulaire').submit(function(event) {
        event.preventDefault();

        var formData = new FormData($(this)[0]);
        var idetape = document.getElementById('myetape').value
        $.ajax({
            url: '/etape-coureur/'+idetape,
            type: 'POST',
            dataType: 'json',
            processData: false,
            contentType:false,
            data: formData,
            success: function(response) {
                swal("GG", "Ajout reussi !!", "success")
            },
            error: function(xhr, status, error) {
                sweetAlert("Oops...", xhr.responseJSON.error, "error")
            }
        });

    });
});

