(function (pts) {
    window.onload = function() {
        var heatmapElement = document.getElementById('heatmap'),
            xcoeff = heatmapElement.clientWidth  / 4.0,
            ycoeff = heatmapElement.clientHeight / 4.0,
            data   = [],
            config = {
                element: heatmapElement,
                radius:  75,
                opacity: 50
            },
            heatmap = h337.create(config);

        pts.forEach( function( point ) { 
            data.push({
                x: xcoeff * (point.p-1), 
                y: heatmapElement.clientHeight - ycoeff * (point.m-1)
            });
        });

        heatmap.store.setDataSet({max: 5, data: data});
    }
})(points);