import { Controller } from "@hotwired/stimulus"

  export default class extends Controller {
    static values = {
      apiKey: String,
      markers: Array
    }

  connect() {

    // if (navigator.geolocation) {
    //  navigator.geolocation.getCurrentPosition(this.showPosition, this.showError)
    // } else {
    //  alert('La géolocalisation n\'est pas prise en charge par ce navigateur.')
    // }

    mapboxgl.accessToken = this.apiKeyValue
    this.map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/mapbox/streets-v12"
    })
    this.#addMarkersToMap()
    this.#fitMapToMarkers()

  }

  showPosition(position) {
    console.log(`Latitude: ${position.coords.latitude}, Longitude: ${position.coords.longitude}`)
  }

  showError(error) {
    switch (error.code) {
      case error.PERMISSION_DENIED:
        alert('L\'utilisateur a refusé la demande de géolocalisation.')
        break
      case error.POSITION_UNAVAILABLE:
        alert('Les informations de position sont indisponibles.')
        break
      case error.TIMEOUT:
        alert('La demande de géolocalisation a expiré.')
        break
      default:
        alert('Une erreur inconnue est survenue lors de la demande de géolocalisation.')
        break
    }
  }

  #addMarkersToMap() {
    this.markersValue.forEach((marker) => {
      // Create a HTML element for your custom marker
      const customMarker = document.createElement("div")
      customMarker.innerHTML = marker.marker_html

      // Pass the element as an argument to the new marker
      new mapboxgl.Marker(customMarker)
        .setLngLat([marker.lng, marker.lat])
        .addTo(this.map)
    })
  }

  #fitMapToMarkers() {
    const bounds = new mapboxgl.LngLatBounds()
    this.markersValue.forEach(marker => bounds.extend([ marker.lng, marker.lat ]))
    this.map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 })
  }
}
