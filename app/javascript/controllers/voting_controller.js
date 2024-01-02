import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="voting"
export default class extends Controller {
  static targets = ["upVote", "downVote"];

  connect() {
  }

  disable(event) {
    // console.log(this.upVoteTarget);
    this.upVoteTarget.disabled = "true";
    // console.log(this.downVoteTarget);
    // this.upVoteTarget.setAttribute("disabled", "");
    // this.downVoteTarget.setAttribute("disabled", "");
    // event.preventDefault();
  }
}
