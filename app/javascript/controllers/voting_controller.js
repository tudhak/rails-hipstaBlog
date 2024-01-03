import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="voting"
export default class extends Controller {
  static targets = ["upVote", "downVote", "form", "postRating", "voteValue"];

  connect() {
    console.log(this.updateButtonTarget);
  }

  vote(event) {
    event.preventDefault();
    let rating = this.postRatingTarget.innerText;
    console.log(Number(rating));

    fetch(this.formTarget.action, {
      method: "PATCH",
      headers: { "Accept": "text/plain" },
      body: new FormData(this.formTarget)
    })
      .then(response => response.text())
      .then((data) => {
        console.log(data.message_rating)
        this.postRatingTarget.innerText = Number(this.postRatingTarget.innerText) + Number(this.voteValueTarget.value);
        this.upVoteTarget.setAttribute("disabled", "true");
        this.downVoteTarget.setAttribute("disabled", "true");
      })
  }
}
