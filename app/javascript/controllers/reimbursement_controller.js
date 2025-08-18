import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="refund"
export default class extends Controller {
  connect() {
    this.ShowHidePrefilledSection;
  }

  ShowHidePrefilledSection() {
    var roadDiv = document.getElementById("divRoad");
    roadDiv.style.display = "none";
    var prefilledCheckbox = document.getElementById("checkboxPrefilled");
    if (prefilledCheckbox.checked) {
      prefilledCheckbox.click();
      var prefilledForm = document.getElementById("formPrefilled");
      prefilledForm.style.display = "block";
    }

    var freeCheckbox = document.getElementById("checkboxFree");
    if (freeCheckbox.checked) {
      freeCheckbox.click();
      var freeForm = document.getElementById("formFree");
      freeForm.style.display = "block";
    }
  }

  disconnect() {}
}
