## Usage

To use this script, just include it in your page like this.

I recommend using conditional comments to target IE less than version 7.

````
<!--[if lte IE 8 ]>
	<script type="text/javascript" src="/javascript/border-box.js"></script>
<![endif]-->
````

You may also want to link to a CSS file in the IE conditional comment to clean up any additional problems with IE7.

## How it works

This works, allowing you to build fluid layouts using ````box-sizing: border-box```` with percentage widths and paddings. It takes the calculated withs and paddings in pixels, and then takes away the padding from the width allowing IE7 to emulate ````box-sizing: border-box````.

It only does this once, so your fluid/responsive layouts won't be so fluid/responsive in IE7 but they should at least work in the size at which the page loaded. This is because there's no function to update the widths once it's done the opperation resulting in them being converted to pixels not percentages. I'm not making myself very clear. If you are better at writing, feel free to update this. It's all open source including the documentation!

Let me know how this works out for you.

## jQuery

Note, this script requires jQuery is present on the page.

## Links

	- http://paulirish.com/2012/box-sizing-border-box-ftw/