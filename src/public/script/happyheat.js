(function (pts) {
    window.onload = function() {
        var heatmapElement = document.getElementById('heatmap'),
            xcoeff = heatmapElement.clientWidth  / 5.0,
            ycoeff = heatmapElement.clientHeight / 5.0,
            data   = [],
            config = {
                element: heatmapElement,
                radius:  30,
                opacity: 50
            },
            heatmap = h337.create(config);

        pts.forEach( function( point ) { 
            data.push({
                x: xcoeff * point.p, 
                y: heatmapElement.clientHeight - ycoeff * point.m
            });
        });

        heatmap.store.setDataSet({max: 4, data: data});
    }
})(points);