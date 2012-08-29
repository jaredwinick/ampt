import subprocess
import datetime

############## CONSTANTS ##################

project_name = "ampt-Weather-2011"

# Use http://www.epochconverter.com/ for converting dates to-from unix timestamps
startTime = 1293840000
endTime = 1325376000
interval = 60*60*24

pathToTilemill = "/usr/share/tilemill/index.js"
pathToTilemillConfig = "/etc/tilemill/tilemill.config"
mapBoxHome = "/home/jared/Documents/MapBox/"

bbox_ll_lon = -128.5
bbox_ll_lat = 20.5
bbox_ur_lon = -63.0
bbox_ur_lat = 52.0

width = 1280
height = 720

framesPerSecond = 7

addDateCaption = True
dateCaptionFormat = "%B %02d, %Y"

addLegend = True
legendImage = "legend.png"

######### END CONSTANTS #################


currentTime = startTime

# read the original style.mss. we will update the timestamp conditional for each frame and save it to style_modified.mss
fin = open( "style.mss", "r" )
originalStyleContents = fin.read()
fin.close()

# i is used as the frame index. the first image has an index of 1
i = 1
while currentTime < endTime:
  
  # write out the modified style to update the timestamp conditional 
  modifiedStyleContents = originalStyleContents % (currentTime,currentTime+interval,currentTime,currentTime+interval)
  fout = open( "style_modified.mss", "w" )
  fout.write( modifiedStyleContents )
  fout.close()

  subprocess.call([pathToTilemill, 
      "export", 
      "--bbox=%f,%f,%f,%f" % (bbox_ll_lon, bbox_ll_lat, bbox_ur_lon, bbox_ur_lat), 
      "--width=%d" % width, 
      "--height=%d" % height, 
      "--format=png", 
      "--files=%s" % mapBoxHome, 
      "--config=%s" % pathToTilemillConfig, 
      project_name, 
      "%s_%d.png" % (project_name, i)])
  
  # add a legend image if applicable. tilemill doesn't current support exporting its native legends
  if addLegend == True:
    subprocess.call(["composite","-gravity","southeast","%s" % legendImage,"%s_%d.png" % (project_name, i),"%s_%d.png" % (project_name, i)])
  
  # add the date caption if applicable
  if addDateCaption == True:
    dateString = datetime.datetime.utcfromtimestamp(currentTime).strftime(dateCaptionFormat)
    subprocess.call(["convert","-fill","white","-pointsize","16","-gravity","southeast","%s_%d.png" % (project_name, i),"-annotate","+10+110",dateString,"%s_%d.png" % (project_name, i)])

  print "Finished generating frame: %d" % i

  # increment the time window as well as the frame index
  currentTime += interval
  i = i + 1


# Finally generate the video
subprocess.call(["ffmpeg", "-f" ,"image2", "-r", "%s" % framesPerSecond, "-i", "%s_%s.png" % (project_name,"%d"), "-vcodec", "mpeg4", "-sameq", "%s.mp4" % project_name])
