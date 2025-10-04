import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["modal", "name", "deleteForm"]
  static values = { 
    name: String, 
    url: String, 
    message: String 
  }
  
  connect() {
    // Fechar modal ao clicar fora
    this.boundHandleClickOutside = this.handleClickOutside.bind(this)
    // Fechar modal com ESC
    this.boundHandleKeydown = this.handleKeydown.bind(this)
  }
  
  disconnect() {
    document.removeEventListener('click', this.boundHandleClickOutside)
    document.removeEventListener('keydown', this.boundHandleKeydown)
  }
  
  // Abrir modal
  show(event) {
    event.preventDefault()
    
    // Pegar dados do link
    const link = event.currentTarget
    this.nameValue = link.dataset.deleteName
    this.urlValue = link.dataset.deleteUrl
    this.messageValue = link.dataset.deleteMessage || `Tem certeza que deseja excluir "${this.nameValue}"?`
    
    // Atualizar conteúdo do modal
    this.nameTarget.textContent = this.nameValue
    
    // Configurar form de delete
    this.deleteFormTarget.action = this.urlValue
    
    // Mostrar modal
    this.modalTarget.classList.remove('hidden')
    document.body.classList.add('overflow-hidden')
    
    // Adicionar event listeners
    document.addEventListener('click', this.boundHandleClickOutside)
    document.addEventListener('keydown', this.boundHandleKeydown)
    
    // Focar no botão cancelar
    this.modalTarget.querySelector('[data-action*="cancel"]')?.focus()
  }
  
  // Fechar modal
  hide() {
    this.modalTarget.classList.add('hidden')
    document.body.classList.remove('overflow-hidden')
    
    // Remover event listeners
    document.removeEventListener('click', this.boundHandleClickOutside)
    document.removeEventListener('keydown', this.boundHandleKeydown)
  }
  
  // Confirmar exclusão
  confirm() {
    this.deleteFormTarget.requestSubmit()
  }
  
  // Fechar ao clicar fora
  handleClickOutside(event) {
    if (event.target === this.modalTarget) {
      this.hide()
    }
  }
  
  // Fechar com ESC
  handleKeydown(event) {
    if (event.key === 'Escape') {
      this.hide()
    }
  }
}