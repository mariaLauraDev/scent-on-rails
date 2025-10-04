import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["modal", "title", "message", "confirmButton", "cancelButton", "form"]
  static values = { 
    title: String,
    message: String, 
    confirmText: String,
    confirmClass: String,
    cancelText: String,
    url: String,
    method: String
  }
  
  connect() {
    this.boundHandleClickOutside = this.handleClickOutside.bind(this)
    this.boundHandleKeydown = this.handleKeydown.bind(this)
  }
  
  disconnect() {
    this.removeEventListeners()
  }
  
  // Método principal: abrir modal
  show(event) {
    event.preventDefault()
    
    // Pegar dados do elemento que disparou
    const trigger = event.currentTarget
    this.extractDataFromTrigger(trigger)
    
    // Atualizar conteúdo do modal
    this.updateModalContent()
    
    // Configurar form
    this.setupForm()
    
    // Mostrar modal
    this.showModal()
  }
  
  // Extrair dados do elemento que disparou o modal
  extractDataFromTrigger(trigger) {
    this.titleValue = trigger.dataset.confirmTitle || 'Confirmação'
    this.messageValue = trigger.dataset.confirmMessage || 'Tem certeza?'
    this.confirmTextValue = trigger.dataset.confirmText || 'Confirmar'
    this.confirmClassValue = trigger.dataset.confirmClass || 'bg-blue-600 hover:bg-blue-700'
    this.cancelTextValue = trigger.dataset.cancelText || 'Cancelar'
    this.urlValue = trigger.dataset.confirmUrl || trigger.href
    this.methodValue = trigger.dataset.confirmMethod || 'DELETE'
  }
  
  // Atualizar conteúdo visual do modal
  updateModalContent() {
    this.titleTarget.textContent = this.titleValue
    this.messageTarget.innerHTML = this.messageValue
    this.confirmButtonTarget.textContent = this.confirmTextValue
    this.cancelButtonTarget.textContent = this.cancelTextValue
    
    // Atualizar classe do botão de confirmação
    this.confirmButtonTarget.className = `px-4 py-2 text-white rounded-md focus:outline-none focus:ring-2 transition-colors ${this.confirmClassValue}`
  }
  
  // Configurar formulário
  setupForm() {
    this.formTarget.action = this.urlValue
    
    // Atualizar method input
    const methodInput = this.formTarget.querySelector('input[name="_method"]')
    if (methodInput) {
      methodInput.value = this.methodValue
    }
  }
  
  // Mostrar modal
  showModal() {
    this.modalTarget.classList.remove('hidden')
    document.body.classList.add('overflow-hidden')
    
    this.addEventListeners()
    
    // Focar no botão cancelar por padrão
    this.cancelButtonTarget?.focus()
  }
  
  // Fechar modal
  hide() {
    this.modalTarget.classList.add('hidden')
    document.body.classList.remove('overflow-hidden')
    this.removeEventListeners()
  }
  
  // Confirmar ação
  confirm() {
    // Se tem URL, submeter form
    if (this.urlValue) {
      this.formTarget.requestSubmit()
    }
    
    // Disparar evento customizado para casos especiais
    this.dispatch('confirmed', { 
      detail: { 
        url: this.urlValue, 
        method: this.methodValue,
        title: this.titleValue,
        message: this.messageValue
      } 
    })
    
    this.hide()
  }
  
  // Event listeners
  addEventListeners() {
    document.addEventListener('click', this.boundHandleClickOutside)
    document.addEventListener('keydown', this.boundHandleKeydown)
  }
  
  removeEventListeners() {
    document.removeEventListener('click', this.boundHandleClickOutside)
    document.removeEventListener('keydown', this.boundHandleKeydown)
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
    // Enter para confirmar (opcional)
    if (event.key === 'Enter' && event.target !== this.cancelButtonTarget) {
      this.confirm()
    }
  }
}