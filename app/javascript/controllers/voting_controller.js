import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="voting"
export default class extends Controller {
  static targets = ["upVote", "downVote", "upForm", "downForm", "postRating", "upVoteValue", "downVoteValue"];

  connect() {
  }

  upVote(event) {
    event.preventDefault();

    fetch(this.upFormTarget.action, {
      method: "PATCH",
      headers: { "Accept": "text/plain" },
      body: new FormData(this.upFormTarget)
    })
      .then(response => response.text())
      .then((data) => {
        this.postRatingTarget.innerText = Number(this.postRatingTarget.innerText) + Number(this.upVoteValueTarget.value);
        this.upVoteTarget.setAttribute("disabled", "true");
        this.downVoteTarget.setAttribute("disabled", "true");
      })
  }

  downVote(event) {
    event.preventDefault();

    fetch(this.downFormTarget.action, {
      method: "PATCH",
      headers: { "Accept": "text/plain" },
      body: new FormData(this.downFormTarget)
    })
      .then(response => response.text())
      .then((data) => {
        this.postRatingTarget.innerText = Number(this.postRatingTarget.innerText) + Number(this.downVoteValueTarget.value);
        this.upVoteTarget.setAttribute("disabled", "true");
        this.downVoteTarget.setAttribute("disabled", "true");
      })
  }
}
