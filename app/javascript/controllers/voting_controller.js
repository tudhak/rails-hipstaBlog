import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="voting"
export default class extends Controller {
  static targets = ["upVote", "downVote", "upForm", "downForm", "postRating", "voteValue"];

  connect() {
  }

  upVote(event) {
    event.preventDefault();
    let rating = this.postRatingTarget.innerText;
    console.log(Number(rating));

    fetch(this.upFormTarget.action, {
      method: "PATCH",
      headers: { "Accept": "text/plain" },
      body: new FormData(this.upFormTarget)
    })
      .then(response => response.text())
      .then((data) => {
        console.log(data.message_rating)
        this.postRatingTarget.innerText = Number(this.postRatingTarget.innerText) + Number(this.voteValueTarget.value);
        this.upVoteTarget.setAttribute("disabled", "true");
        this.downVoteTarget.setAttribute("disabled", "true");
      })
  }

  downVote(event) {
    event.preventDefault();
    let rating = this.postRatingTarget.innerText;
    console.log(Number(rating));

    fetch(this.downFormTarget.action, {
      method: "PATCH",
      headers: { "Accept": "text/plain" },
      body: new FormData(this.downFormTarget)
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
