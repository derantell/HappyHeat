(function (pts) {
    window.onload = function() {
        var heatmapElement = document.getElementById('heatmap'),
            xcoeff = heatmapElement.clientWidth  / 6.0,
            ycoeff = heatmapElement.clientHeight / 6.0,
            data   = [],
            config = {
                element: heatmapElement,
                radius:  75,
                opacity: 50
            },
            heatmap = h337.create(config);

        pts.forEach( function( point ) { 
            data.push({
                x: xcoeff * (point.p), 
                y: heatmapElement.clientHeight - ycoeff * (point.m)
            });
        });

        heatmap.store.setDataSet({max: 5, data: data});
    }
})(points);