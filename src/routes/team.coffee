happiness = require '../modules/happiness'
config    = require '../config'

thisYear  = new Date().getFullYear()
thisMonth = new Date().getMonth()

months = [
    'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 
    'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec' 
]

exports.happiness = (req,res) ->
    team  = req.params.team
    year  = req.params.year  or thisYear
    month = req.params.month or months[thisMonth]
    key   = config.teams[team][year];

    data = happiness key, month 
    data.done (indexData ) -> 
        res.render 'team', 
            team:  team
            year:  year
            month: month
            data:  indexData
