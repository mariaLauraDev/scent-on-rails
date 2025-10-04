// Substitui as funções globais do Rails 4

// Função para mostrar notificações
export function showNotification(message, type = 'success') {
  const notification = document.createElement('div')
  notification.className = `fixed top-4 right-4 px-6 py-3 rounded-lg text-white z-50 ${
    type === 'success' ? 'bg-green-500' : 'bg-red-500'
  }`
  notification.textContent = message
  
  document.body.appendChild(notification)
  
  // Auto-remove após 3 segundos
  setTimeout(() => {
    notification.remove()
  }, 3000)
}

// Função para formatação de datas
export function formatDate(date, format = 'dd/mm/yyyy') {
  const d = new Date(date)
  const day = String(d.getDate()).padStart(2, '0')
  const month = String(d.getMonth() + 1).padStart(2, '0')
  const year = d.getFullYear()
  
  switch(format) {
    case 'dd/mm/yyyy':
      return `${day}/${month}/${year}`
    case 'mm/dd/yyyy':
      return `${month}/${day}/${year}`
    default:
      return d.toLocaleDateString()
  }
}

// Função para fazer requests AJAX
export async function apiRequest(url, options = {}) {
  const defaults = {
    headers: {
      'Content-Type': 'application/json',
      'X-CSRF-Token': document.querySelector('[name="csrf-token"]').content
    }
  }
  
  const config = { ...defaults, ...options }
  const response = await fetch(url, config)
  
  if (!response.ok) {
    throw new Error(`HTTP error! status: ${response.status}`)
  }
  
  return response.json()
}