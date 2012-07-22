library(ggplot2)

source("5-transparent_background.R")

plotLatLonSetAxisRange = function() {
	p <- plotLatLonWithTransparentBackground()
	p <- p + opts(
			 axis.line=theme_blank(), 
             axis.text.x=theme_blank(), 
             axis.text.y=theme_blank(), 
             axis.ticks=theme_blank(),  
             axis.title.x=theme_blank(), 
             axis.title.y=theme_blank(),
			 
			 legend.position = "none"
			 )
	#p <- p + xlim(-180,0) + ylim(-90,90)
	p <- p + scale_x_continuous(limits = c(-180, 0), expand = c(0, 0)) + scale_y_continuous(limits = c(-90, 90), expand = c(0, 0))
	
	png( "8-set_axis_ranges.png", width = 400, height = 400, units = "px", bg = "transparent" )
	print( p )
	dev.off()
}