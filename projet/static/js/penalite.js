document.addEventListener('DOMContentLoaded', (event) => {
    let rowToDelete = '';

    // Listener for opening the modal and setting the row to delete
    const deleteButtons = document.querySelectorAll('button[data-row-id]');
    deleteButtons.forEach(button => {
        button.addEventListener('click', () => {
            rowToDelete = button.getAttribute('data-row-id');
        });
    });

    // Listener for the confirmation button in the modal
    const confirmDeleteButton = document.getElementById('confirmDelete');
    confirmDeleteButton.addEventListener('click', () => {
        if (rowToDelete) {
            document.getElementById(rowToDelete).remove();
            rowToDelete = '';
        }
    });
});