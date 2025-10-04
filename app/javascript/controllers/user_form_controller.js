import { Controller } from "@hotwired/stimulus"
import { showNotification } from "../modules/utils"

export default class extends Controller {
  static targets = ["email", "city", "avatar", "preview"]
  
  // Validação em tempo real
  validateEmail() {
    const email = this.emailTarget.value
    const isValid = email.includes('@') && email.includes('.')
    
    this.emailTarget.classList.toggle('border-red-500', !isValid)
    this.emailTarget.classList.toggle('border-green-500', isValid)
  }
  
  // Submissão do formulário
  async submit(event) {
    if (!this.isFormValid()) {
      event.preventDefault()
      showNotification('Please fix the errors before submitting', 'error')
      return false
    }
  }
  
  // Preview de avatar
  previewAvatar() {
    const file = this.avatarTarget.files[0]
    if (file) {
      const reader = new FileReader()
      reader.onload = (e) => {
        this.previewTarget.src = e.target.result
        this.previewTarget.classList.remove('hidden')
      }
      reader.readAsDataURL(file)
    }
  }
  
  // Auto-complete de cidades (usando Stimulus + Turbo)
  async searchCities() {
    const query = this.cityTarget.value
    if (query.length < 2) return
    
    try {
      const response = await fetch(`/cities/search?q=${query}`)
      const cities = await response.json()
      this.showCitySuggestions(cities)
    } catch (error) {
      console.error('Error searching cities:', error)
    }
  }
  
  showCitySuggestions(cities) {
    // Implementar dropdown de sugestões
    // Muito mais organizado que jQuery!
  }
  
  isFormValid() {
    const email = this.emailTarget.value
    return email.includes('@') && email.includes('.')
  }
}