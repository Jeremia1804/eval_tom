$(document).ready(function() {
        let penaltyIdToDelete = null;
        let rowIdToDelete = null;

        // Capture the penalty ID and row ID when delete button is clicked
        $('.delete-btn').on('click', function() {
            penaltyIdToDelete = $(this).val();
            rowIdToDelete = 'row'+penaltyIdToDelete;
            console.log(rowIdToDelete)
        });

        // Perform AJAX request to delete the penalty
        $('#confirmDelete').on('click', function() {
            if (penaltyIdToDelete) {
                $.ajax({
                    url: '/delete-penalite/'+penaltyIdToDelete, // Your Flask route for deletion
                    type: 'POST',
                    contentType: false,
                    success: function(response) {
                            $('#' + rowIdToDelete).remove(); // Remove the row from the table
                    },
                    error: function(error) {
                        console.error('Erreur:', error);
                        alert('Erreur lors de la suppression de la pénalité.');
                    }
                });
            }
        });
    });
