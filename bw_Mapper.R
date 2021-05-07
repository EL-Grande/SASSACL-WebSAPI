bw<-leaflet(data = bwcoords) %>%
  addTiles() %>%
  setMaxBounds(17, -9, 35, -30) %>%
  #addProviderTiles(providers$CartoDB.Positron)  %>%
  addMarkers(~long, ~lat, label= ~name)
bw