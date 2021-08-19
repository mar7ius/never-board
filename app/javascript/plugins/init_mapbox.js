import mapboxgl from 'mapbox-gl';
import 'mapbox-gl/dist/mapbox-gl.css';

const initMapbox = () => {
  const mapElement = document.getElementById('map');

  if (mapElement) {
    mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
    const map = new mapboxgl.Map({
      container: 'map',
      style: 'mapbox://styles/mapbox/streets-v10'
    });

    const markers = JSON.parse(mapElement.dataset.markers);
    console.log(markers);

    if (markers) {
      addMarkerToMap(map, markers);
      fitMapToMarker(map, markers);
    }
  }
};

const fitMapToMarker = (map, markers) => {
  const bounds = new mapboxgl.LngLatBounds();
  // if markers.length > 1
  // bounds.extend([ markers.lng, markers.lat ])
  // To use if it is for index
  markers.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
  map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 });
};

const addMarkerToMap = (map, markers) => {

  markers.forEach((marker) => {
    const popup = new mapboxgl.Popup().setHTML(marker.info_window);
    new mapboxgl.Marker()
      .setLngLat([ marker.lng, marker.lat ])
      .setPopup(popup)
      .addTo(map);
  })
}


  // markers.forEach((marker) => {
  //   const popup = new mapboxgl.Popup().setHTML(marker.info_window);

  //   // Create a HTML element for your custom marker
  //   const element = document.createElement('div');
  //   element.className = 'marker';
  //   element.style.backgroundImage = `url('${marker.image_url}')`;
  //   element.style.backgroundSize = 'contain';
  //   element.style.width = '25px';
  //   element.style.height = '25px';

  //   // Pass the element as an argument to the new marker
  //   new mapboxgl.Marker(element)
  //     .setLngLat([marker.lng, marker.lat])
  //     .setPopup(popup)
  //     .addTo(map);
  // });
  // }

export { initMapbox };
