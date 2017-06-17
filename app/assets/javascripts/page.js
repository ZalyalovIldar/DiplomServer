
$(document).ready(function () {

    Chartkick.configure({language: "ru"});

    // var modal = $('.modal-content .image')

    $('.image_preview').on('click',function () {
        $('#video').hide();

        $('.modal-content .image').show();
        $('.modal-content .image').css('background-image', 'url(' + this.src +  ')');

        $('.modal-content .emoji').html( $(this).data('emoji') );

    });

    timeline_chart = false;

    $('.video_preview').on('click',function () {
        $('.modal-content .image').hide();
        $('#video')[0].src = this.src;
        $('#video').show();

        video_id = $(this).data('id');
        chart_data = JSON.parse($('#video_' + video_id).html());
        emoji = $('.modal-content .emoji');

        emoji.html('');
        if( chart_data.length > 0) {
            if( chart_data[0].length > 0) {
                chart_id = 'timeline-chart';
                emoji.html('<div id=' + chart_id + '></div>');
                chart = new Chartkick.Timeline(chart_id, chart_data[0], {});
                $('.modal').on('shown.bs.modal', function () {
                    chart.redraw();
                });

                chart_id = "pie-chart";
                emoji.append("<div id='" + chart_id +  "' style=' width: 100%; height: 400px;'></div>");
                new Chartkick.PieChart(chart_id, chart_data[1], {});
            }
        }

    });

});