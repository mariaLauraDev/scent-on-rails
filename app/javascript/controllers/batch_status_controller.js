import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["status", "indicator"]
  static values = { url: String }
  
  connect() {
    this.updateIndicator()
  }
  
  // Muda status via AJAX
  async changeStatus(event) {
    const newStatus = event.target.value
    
    try {
      const response = await fetch(this.urlValue, {
        method: 'PATCH',
        headers: {
          'Content-Type': 'application/json',
          'X-CSRF-Token': document.querySelector('[name="csrf-token"]').content
        },
        body: JSON.stringify({ batch: { status: newStatus } })
      })
      
      if (response.ok) {
        this.updateIndicator()
        this.showNotification("Status updated successfully!")
      }
    } catch (error) {
      console.error("Error updating status:", error)
    }
  }
  
  updateIndicator() {
    const status = this.statusTarget.value
    const colors = {
      'draft': 'bg-gray-500',
      'active': 'bg-green-500', 
      'completed': 'bg-blue-500',
      'archived': 'bg-red-500'
    }
    
    this.indicatorTarget.className = `w-3 h-3 rounded-full ${colors[status]}`
  }
  
  showNotification(message) {
    // Cria notificação temporária
    const notification = document.createElement('div')
    notification.textContent = message
    notification.className = 'fixed top-4 right-4 bg-green-500 text-white px-4 py-2 rounded'
    document.body.appendChild(notification)
    
    setTimeout(() => notification.remove(), 3000)
  }
}