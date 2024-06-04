$(document).ready(function() {
    function filterResult() {
        var etapeId = $('#etape').val();
        var categorieId = $('#categorie').val();
        $.ajax({
            url: '/filter_by_equipe',
            type: 'POST',
            data: { etape: etapeId, categorie: categorieId },
            success: function(data) {
                var rows = '';
                $.each(data.results, function(index, equipe) {
                    rows += '<tr>'
                          + '<td>' + equipe.nomequipe + '</td>'
                          + '<td>' + equipe.point + '</td>'
                          + '</tr>';
                });
                $('#result-table tbody').html(rows);
            }
        });
    }

    $('#etape').change(filterResult);
    $('#categorie').change(filterResult);
});