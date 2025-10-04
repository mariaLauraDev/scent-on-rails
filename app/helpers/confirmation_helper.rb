module ConfirmationHelper
  # Helper para criar botões/links de confirmação facilmente
  def confirm_button(text, options = {})
    # Opções padrão
    defaults = {
      title: 'Confirmação',
      message: 'Tem certeza?',
      confirm_text: 'Confirmar',
      confirm_class: 'bg-blue-600 hover:bg-blue-700',
      cancel_text: 'Cancelar',
      method: 'DELETE',
      class: 'text-blue-600 hover:underline'
    }
    
    opts = defaults.merge(options)
    
    # Extrair atributos HTML
    html_options = opts.except(:title, :message, :confirm_text, :confirm_class, :cancel_text, :url, :method)
    
    # Dados para o modal
    data_attrs = {
      action: 'click->confirmation-modal#show',
      confirm_title: opts[:title],
      confirm_message: opts[:message],
      confirm_text: opts[:confirm_text],
      confirm_class: opts[:confirm_class],
      cancel_text: opts[:cancel_text],
      confirm_url: opts[:url],
      confirm_method: opts[:method]
    }
    
    button_tag(text, html_options.merge(data: data_attrs))
  end
  
  def confirm_link(text, url, options = {})
    options[:url] = url
    confirm_button(text, options)
  end
  
  # Shortcuts para ações comuns
  def delete_button(text, url, options = {})
    delete_defaults = {
      title: 'Confirmar Exclusão',
      message: 'Esta ação não pode ser desfeita.',
      confirm_text: 'Excluir',
      confirm_class: 'bg-red-600 hover:bg-red-700',
      class: 'text-red-600 hover:underline'
    }
    
    confirm_button(text, delete_defaults.merge(options).merge(url: url, method: 'DELETE'))
  end
  
  def archive_button(text, url, options = {})
    archive_defaults = {
      title: 'Arquivar Item',
      message: 'O item será movido para os arquivos.',
      confirm_text: 'Arquivar',
      confirm_class: 'bg-yellow-600 hover:bg-yellow-700',
      class: 'text-yellow-600 hover:underline'
    }
    
    confirm_button(text, archive_defaults.merge(options).merge(url: url, method: 'PATCH'))
  end
  
  def activate_button(text, url, options = {})
    activate_defaults = {
      title: 'Ativar Item',
      message: 'O item será ativado e ficará disponível.',
      confirm_text: 'Ativar',
      confirm_class: 'bg-green-600 hover:bg-green-700',
      class: 'text-green-600 hover:underline'
    }
    
    confirm_button(text, activate_defaults.merge(options).merge(url: url, method: 'PATCH'))
  end
end