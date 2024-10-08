// Import and register all your controllers from the importmap via controllers/**/*_controller
import { application } from "./application"  // Fix path if necessary
import { eagerLoadControllersFrom } from "@hotwired/stimulus-loading"

// Import and register individual controllers
import TabsController from "./tabs_controller"
import DropdownController from "./dropdown_controller"

// Register controllers with Stimulus application
application.register("tabs", TabsController)
application.register("dropdown", DropdownController)

// Eager load all other controllers from the controllers folder
eagerLoadControllersFrom("controllers", application)
