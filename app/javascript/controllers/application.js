import { Application } from "@hotwired/stimulus";
import Sortable from "stimulus-sortable";
import NestedForm from "stimulus-rails-nested-form";

const application = Application.start();
application.register("sortable", Sortable);
application.register("nested-form", NestedForm);

// Configure Stimulus development experience
application.debug = false;
window.Stimulus = application;

export { application };

