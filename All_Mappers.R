#Pipe each coordinate data into leaflet.

bw<-leaflet(data = bwcoords) %>%
  addTiles() %>%
  setMaxBounds(17, -9, 35, -30) %>%
  #addProviderTiles(providers$CartoDB.Positron)  %>%
  addMarkers(~long, ~lat, label= ~name)
bw

nw<-leaflet(data = nwcoords) %>%
  addTiles() %>%
  setMaxBounds(13.2781, -16.544627, 16.635832, -28.031361) %>%
  #addProviderTiles(providers$CartoDB.Positron)  %>%
  addMarkers(~long, ~lat, label= ~name)
nw
