var cer = document.getElementById("cert");

$(document).ready(function() {
    function filterResult() {
        var etapeId = $('#etape').val();
        var categorieId = $('#categorie').val();
        cer.href = "/export-pdf/"+categorieId
        $.ajax({
            url: '/filter_by_equipe',
            type: 'POST',
            data: { etape: etapeId, categorie: categorieId },
            success: function(data) {
                var rows = '';
                const labels = []
                const datas = []
                i = 0
                $.each(data.results, function(index, equipe) {
                    labels[i] = equipe.nomequipe;
                    datas[i] = equipe.point;
                    i++;
                    rows += '<tr>'
                          + '<td>' + equipe.nomequipe + '</td>'
                          + '<td>' + equipe.point + '</td>'
                          + '</tr>';
                });
                $('#result-table tbody').html(rows);

                afficher(labels,datas);
            }
        });
    }

    $('#etape').change(filterResult);
    $('#categorie').change(filterResult);
});

var myPieChart = null;

function afficher(labels, data){
    if (myPieChart !== undefined && myPieChart!== null){
        myPieChart.destroy();
    }
    var ctx = document.getElementById('myPieChart').getContext('2d');
        myPieChart = new Chart(ctx, {
            type: 'pie',
            data: {
                labels: labels,
                datasets: [{
                    data: data,
                    borderWidth: 1
                }]
            },
            options: {
                responsive: true,
                plugins: {
                    legend: {
                        position: 'top',
                    },
                    tooltip: {
                        callbacks: {
                            label: function(context) {
                                let label = context.label || '';
                                if (label) {
                                    label += ': ';
                                }
                                label += context.raw;
                                return label;
                            }
                        }
                    }
                }
            }
        });
}

