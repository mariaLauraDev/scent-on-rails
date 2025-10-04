import { Controller } from "@hotwired/stimulus"

// Conecta automaticamente com data-controller="toggle"
export default class extends Controller {
  static targets = ["content"]
  
  connect() {
    console.log("Toggle controller connected!")
  }
  
  toggle() {
    this.contentTarget.classList.toggle("hidden")
  }
}