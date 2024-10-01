// Import and register all your controllers from the importmap via controllers/**/*_controller
import { application } from "controllers/application"
import { eagerLoadControllersFrom } from "@hotwired/stimulus-loading"
import TabsController from "./tabs_controller"
application.register("tabs", TabsController)
import DropdownController from "./dropdown_controller"
application.register("dropdown", DropdownController)
eagerLoadControllersFrom("controllers", application)
