library(ggplot2)
library(grid)

source("1-load_data_frame_with_lat_lon.R")

plotLatLonRemoveMargins = function( ) {
	dataFrame <- createDataFrame( )
	
	# append a row with a point at the edge of our plot so we can ensure there are no margins
	row1 <- data.frame(Src="ci",Eqid=1,Version=0,Datetime="Wednesday, May 30, 2012 03:00:04 UTC",
						Lat=90,Lon=-180,Magnitude=6,Depth=9,NST=29,Region="Test")
	row2 <- data.frame(Src="ci",Eqid=1,Version=0,Datetime="Wednesday, May 30, 2012 03:00:04 UTC",
						Lat=90,Lon=0,Magnitude=6,Depth=9,NST=29,Region="Test")
	row3 <- data.frame(Src="ci",Eqid=1,Version=0,Datetime="Wednesday, May 30, 2012 03:00:04 UTC",
						Lat=-90,Lon=-180,Magnitude=6,Depth=9,NST=29,Region="Test")
	row4 <- data.frame(Src="ci",Eqid=1,Version=0,Datetime="Wednesday, May 30, 2012 03:00:04 UTC",
						Lat=-90,Lon=0,Magnitude=6,Depth=9,NST=29,Region="Test")					

	dataFrame <- rbind( dataFrame, row1 ) 
	dataFrame <- rbind( dataFrame, row2 ) 
	dataFrame <- rbind( dataFrame, row3 ) 
	dataFrame <- rbind( dataFrame, row4 ) 
	
	p <- ggplot( dataFrame, aes( x = Lon, y = Lat ) )
	p <- p + geom_point( colour = "red", aes( size = Magnitude, alpha = Magnitude ) ) + scale_size( range = c(1,7) ) + scale_alpha( range = c(0.2,0.6) )
	p <- p + opts( panel.background = theme_blank( ),
				   panel.grid.minor = theme_blank( ),
				   panel.grid.major = theme_blank( ),
				   plot.background = theme_blank( ),
				   axis.line=theme_blank(), 
					axis.text.x=theme_blank(), 
					axis.text.y=theme_blank(), 
					axis.ticks=theme_blank(),  
					axis.title.x=theme_blank(), 
					axis.title.y=theme_blank(),	 
					legend.position = "none",
					plot.margin=unit(c(0,0,0,0), "lines") ) #this is where we remove the margin
					
	p <- p + scale_x_continuous(limits = c(-180, 0), expand = c(0, 0)) + scale_y_continuous(limits = c(-90, 90), expand = c(0, 0))
	
	png( "9-remove_margin.png", width = 400, height = 400, units = "px", bg = "transparent" )
	print( p )
	dev.off()
}
