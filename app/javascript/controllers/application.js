import { Application } from "@hotwired/stimulus"
import * as THREE from "three";

const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application
window.THREE       = THREE

export { application }
