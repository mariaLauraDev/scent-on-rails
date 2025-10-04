import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static values = { delay: Number }
  
  connect() {
    // Auto-remove após o tempo especificado
    setTimeout(() => {
      this.element.remove()
    }, this.delayValue)
  }
}