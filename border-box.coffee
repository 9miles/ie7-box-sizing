borderBox = (maxWidth) ->
	$('*').each ->

		# Cache This
		_this = $(this)

		width = parseInt(_this.css('width'), 10)

		if _this.css('box-sizing') == "border-box" and width < maxWidth

			paddingLeft = parseInt(_this.css('padding-left'), 10)
			paddingRight = parseInt(_this.css('padding-right'), 10)
			borderLeft = parseInt(_this.css('border-left'), 10)
			borderRight = parseInt(_this.css('border-right'), 10)

			# Check Variables are Numbers
			paddingLeft = if isNaN(paddingLeft) then 0 else paddingLeft
			paddingRight = if isNaN(paddingRight) then 0 else paddingRight
			borderLeft = if isNaN(borderLeft) then 0 else borderLeft
			borderRight = if isNaN(borderRight) then 0 else borderRight
			width = if isNaN(width) then 0 else width

			# Calculate New Width
			result = width - paddingLeft - paddingRight - borderLeft - borderRight - 1 # fix for rounding

			# Set new values
			_this.css({
				'box-sizing' : 'content-box'
				'width' : result
				'padding-left' : paddingLeft
				'padding-right' : paddingRight
				})