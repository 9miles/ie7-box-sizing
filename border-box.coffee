###
	Warning: Only run this in less than or equal to IE 7 conditional comments
###


# 	TODO
#
#	- Detect the actual parent width
#	- Detect if the padding is percentage of pixel based
#	- Work out a percentage based padding from a pixel based padding based on the parent
#	- Add support for height
#

$(document).ready ->

	# Fix for getComputedStyle
	if !window.getComputedStyle
		window.getComputedStyle = (el, pseudo) ->
			@.el = el
			@.getPropertyValue = (prop) ->
				re = /(\-([a-z]){1})/g
				if prop == 'float' then prop = 'styleFloat'
				if re.test(prop)
					prop = prop.replace(re, ->
							return arguments[2].toUpperCase()
						)
				if el.currentStyle[prop] then el.currentStyle[prop] else null
			return @

	String.prototype.endsWith = (suffix) ->
		return @.indexOf(suffix, @.length - suffix.length) != -1


	$('*').each ->

		# Cache This
		_this = $(this)

		# Grab all the styles
		style = window.getComputedStyle(@)

		# Find the width
		width = style.getPropertyValue('width')

		# Check if it's a percentage based width
		if width.endsWith('px')
			width = 0 # set to 0 so it fails
		else
			width = parseInt(width, 10)

		# Set the width and check it's a number
		width = if isNaN(width) then 0 else width

		if _this.css('box-sizing') == "border-box" and width != 'auto' and width > 0

			# Gather Values
			paddingLeft = parseInt(style.getPropertyValue('padding-left'), 10)
			paddingRight = parseInt(style.getPropertyValue('padding-right'), 10)
			borderLeft = parseInt(_this.css('border-left'), 10)
			borderRight = parseInt(_this.css('border-right'), 10)

			# Check Variables are Numbers
			paddingLeft = if isNaN(paddingLeft) then 0 else paddingLeft
			paddingRight = if isNaN(paddingRight) then 0 else paddingRight
			borderLeft = if isNaN(borderLeft) then 0 else borderLeft
			borderRight = if isNaN(borderRight) then 0 else borderRight

			# Calculate New Width
			result = width - paddingLeft - paddingRight # - _pixel is a fix for rounding

			# Set new values
			_this.css({
				'box-sizing' : 'content-box'
				'width' : result + '%'
				})