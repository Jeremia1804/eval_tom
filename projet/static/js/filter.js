$(document).ready(function() {
    function filterResults() {
        var etapeId = $('#etape').val();
        var categorieId = $('#categorie').val();
        $.ajax({
            url: '/filter_by_etape',
            type: 'POST',
            data: { etape: etapeId, categorie: categorieId },
            success: function(data) {
                var rows = '';
                $.each(data.results, function(index, equipe) {
                    rows += '<tr>'
                          + '<td>' + equipe.rang + '</td>'
                          + '<td>' + equipe.nom + '</td>'
                          + '<td>' + equipe.numero + '</td>'
                          + '<td>' + equipe.nomequipe + '</td>'
                          + '<td>' + equipe.duree_formatted + '</td>'
                          + '<td>' + equipe.pen_formatted + '</td>'
                          + '<td>' + equipe.new_duree_formatted + '</td>'
                          + '<td>' + equipe.point + '</td>'
                          + '</tr>';
                });
                $('#result-table2 tbody').html(rows);
            }
        });
    }

    $('#etape').change(filterResults);
    $('#categorie').change(filterResults);
});