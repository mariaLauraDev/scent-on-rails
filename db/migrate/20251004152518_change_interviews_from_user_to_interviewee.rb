class ChangeInterviewsFromUserToInterviewee < ActiveRecord::Migration[8.0]
  def change
    # Remover foreign key e index antigo
    remove_foreign_key :interviews, :users
    remove_index :interviews, :user_id
    
    # Renomear coluna
    rename_column :interviews, :user_id, :interviewee_id
    
    # Adicionar nova foreign key e index
    add_foreign_key :interviews, :interviewees
    add_index :interviews, :interviewee_id
  end
end
