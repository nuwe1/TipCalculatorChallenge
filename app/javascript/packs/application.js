import Rails from "@rails/ujs";
import "@hotwired/turbo-rails";  // Turbo for faster navigation
import * as ActiveStorage from "@rails/activestorage";

// Start Rails UJS, Turbo, and ActiveStorage
Rails.start();
ActiveStorage.start();
Turbo.start();  // Starting Turbo

// Import and initialize Stimulus
import { Application } from "stimulus";
import { definitionsFromContext } from "stimulus/webpack-helpers";  // Use webpack helper to import all controllers

// Import Stimulus controllers from the controllers directory
const application = Application.start();
const context = require.context("../controllers", true, /\.js$/);  // Automatically load all controllers
application.load(definitionsFromContext(context));

// Import other assets like Bulma for styles
import "controllers";  // Optional if you're dynamically loading controllers
import "bulma";  // For CSS framework

console.log("Stimulus and Webpacker setup complete!");