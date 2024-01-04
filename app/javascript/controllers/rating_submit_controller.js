import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="rating-submit"
export default class extends Controller {
  connect() {
  }

  submit() {
    this.element.submit();
  }
}
