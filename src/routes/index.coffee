teams = (require '../config').teams

exports.index = (req, res) ->   
    res.render 'index', {
        title: 'Happy index heat maps',
        teams: for own team, _ of teams 
            team
    } 
