import { Application } from "@hotwired/stimulus"
import * as THREE from "three";
import $ from "jquery";

const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application
window.THREE      = THREE
window.$          = $

export { application }
