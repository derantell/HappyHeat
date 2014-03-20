# # happiness module
 
# This module fetches team happines index data from a google spreadsheet.
# The conventions of the spreadsheet are the following:
# 
# - Each spreadsheet contains the happiness index data of a team for a year
# - The spreadsheet has a worksheet for each month of that year named 
#   'Jan', 'Feb' etc
# - The worksheet for a month has two columns named 'motivated' and 'productive'
# - The first row is a heading and the second is the average value of the columns

# ## Example use
#
# ```
# # Import the function that fetches data from Google
# happiness = require './happiness'
#
# # The function expects the name of the team as its first argument
# # An optional month can be specified, default is the current month
# var data = happiness 'foxtrot', 'May'
# 
# # The result is a Promises/A+ promise, let's log the result when done
# data.done (res) -> 
# 	console.log res
# ```	  
 
# ## Imports

# Require the modules 
# - **google-spreadsheet** is used to fetch data from google
# - **promise** makes the async calls easier to handle
# - **lodash** adds a bunch of functional functions 

Gss     = require 'google-spreadsheet'
Promise = require 'promise'
_       = require 'lodash'

# ## Fetching 
 
# We want to fetch the happiness index data for a team
# and month 

getHappiness = (key, month) ->
	# Create a new google-spreadsheet object for the specified team
	# and wrap the `getInfo` method in a promise
	sheet = new Gss key
	fetchInfo = Promise.denodeify sheet.getInfo

	# Fetch the spreadsheet info
	fetchInfo()
		# then get the rows of the specified month
		.then getRowsOf month 
		# and map them to a list of motivated/productive pairs
		.then mapToValues

# The spreadsheet info object contains a list of worksheets. We must
# filter out the worksheet that matches the specified month.

getRowsOf = (month) ->
	(info) ->  
		monthSheet = _(info.worksheets)
			.filter ( ws ) -> ws.title == month
			.first();
		(Promise.denodeify monthSheet.getRows)()

# Each row should have the properties `motivated` and `productive`. 
# These are represented as strings and needs to be converted to numbers

mapToValues = (rows) ->
	_(rows)
		# The first row contains averages an can be skipped
		.drop 1
		# Convert the string values to numbers
		.map (r) ->  
			m: asNumber r.motivated 
			p: asNumber r.productive 
		
		# and return the wrapped value
		.value()

# Numbers are returned from the spreadsheet as strings with swedish format,
# therefore we must replace `,` with `.`

normalizeNumber = (number) ->
	(number or '0').replace ',', '.' 

# We need to convert the string from the spreadsheet to a number. We do 
# this by composing our `normalizeNumber` function with `parseFloat`.

asNumber = _.compose parseFloat, normalizeNumber 


# ## Public interface

# We're exporting the `getHappiness` function, which returns a 
# [promise](http://www.promisejs.org/intro/) of the data for 
# the specified team and month 

module.exports = getHappiness