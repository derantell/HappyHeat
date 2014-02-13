happiness = require '../modules/happiness'

exports.happiness = (req,res) ->
    data = happiness req.params.team, 'Jan'
    data.done (indexData ) -> 
        res.render 'team', 
            team: req.params.team
            data: indexData
