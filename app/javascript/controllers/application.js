import { Application } from "@hotwired/stimulus"
import Subscription from "@subscription"

const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

export { application }
