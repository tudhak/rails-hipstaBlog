import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="rating-submit"
export default class extends Controller {
  connect() {
    console.log("yapouf")
  }

  submit() {
    this.element.submit();
  }
}
