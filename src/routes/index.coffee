exports.index = (req, res) ->   
    res.render 'index', {
        title: 'Happy index heat maps',
        teams: ['foxtrot']
    } 
