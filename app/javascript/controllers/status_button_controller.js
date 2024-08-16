import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="status-button"
export default class extends Controller {
  static targets = ["acptbtn", "rjctbtn", "status", "list"]

  connect(event) {
  }

  accept(event) {
    event.preventDefault();


    fetch(this.acptbtnTarget.action, {
      method: "PATCH",
      body: new FormData(this.acptbtnTarget)
    })
    .then(response => response.json())
    .then((data) => {
      const status = `<i class="fa-solid fa-circle" style="color: #63E6BE;"></i> <span>${data.status}</span>`
      this.statusTarget.innerText = " "
      this.statusTarget.insertAdjacentHTML("afterbegin", status )
      this.acptbtnTarget.classList.add("hidden")
      this.rjctbtnTarget.classList.add("hidden")
    })
  }

  reject(event) {
    event.preventDefault();

    fetch(this.rjctbtnTarget.action, {
      method: "PATCH",
      body: new FormData(this.rjctbtnTarget)
    })
    .then(response => response.json())
    .then((data) => {
      const status = `<i class="fa-solid fa-circle" style="color: #ff3838;"></i> <span>${data.status}</span>`
      this.statusTarget.innerText = " "
      this.statusTarget.insertAdjacentHTML("afterbegin", status )
      this.acptbtnTarget.classList.add("hidden")
      this.rjctbtnTarget.classList.add("hidden")
    })
  }

}
