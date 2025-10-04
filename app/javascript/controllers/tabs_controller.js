import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["tab", "panel"]
  static values = { activeIndex: Number }

  connect() {
    this.showTab(0) // Show first tab by default
  }

  tabClicked(event) {
    const clickedTab = event.currentTarget
    const tabIndex = this.tabTargets.indexOf(clickedTab)
    this.showTab(tabIndex)
  }

  showTab(index) {
    // Reset all tabs
    this.tabTargets.forEach((tab, i) => {
      if (i === index) {
        // Active tab
        tab.classList.add('text-blue-600', 'border-b-2', 'border-blue-600', 'bg-blue-50')
        tab.classList.remove('text-gray-500')
      } else {
        // Inactive tab
        tab.classList.remove('text-blue-600', 'border-b-2', 'border-blue-600', 'bg-blue-50')
        tab.classList.add('text-gray-500')
      }
    })

    // Reset all panels
    this.panelTargets.forEach((panel, i) => {
      if (i === index) {
        panel.classList.remove('hidden')
      } else {
        panel.classList.add('hidden')
      }
    })
  }
}