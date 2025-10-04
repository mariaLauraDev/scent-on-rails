import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["card", "filter", "modal"]
  
  // Abre modal
  openModal() {
    this.modalTarget.classList.remove('hidden')
  }
  
  // Fecha modal
  closeModal() {
    this.modalTarget.classList.add('hidden')
  }
  
  // Filtra batches
  filter() {
    const selectedStatus = this.filterTarget.value
    
    this.cardTargets.forEach(card => {
      const cardStatus = card.dataset.status
      const shouldShow = !selectedStatus || cardStatus === selectedStatus
      
      card.classList.toggle('hidden', !shouldShow)
    })
  }
  
  // Confirmação de delete com Turbo
  confirmDelete(event) {
    if (!confirm('Are you sure you want to delete this batch?')) {
      event.preventDefault()
    }
  }
}