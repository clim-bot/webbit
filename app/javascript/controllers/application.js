import { Application } from "@hotwired/stimulus";
import { definitionsFromContext } from "stimulus-loading";

const application = Application.start();

// Configure Stimulus development experience
application.debug = false;  // Set to true if you need to debug
window.Stimulus = application;

// Automatically load all controllers from the controllers directory
const context = require.context("controllers", true, /\.js$/);
application.load(definitionsFromContext(context));

export { application };
