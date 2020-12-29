# frozen_string_literal: true

class User < ApplicationRecord
  self.table_name = 'users'
  validates :name, presence: true
  validates :email, presence: true
  validates :password_digest, length: { minimum: 5 }

#sukuriamas naujas naudojas ir atliekama validacija
  def create_user(name, email, password, password_confirmation)
    if password == password_confirmation
      user = User.find_by(email: email)
      return 'Naudotojas jau egzistuoja' unless user.nil?

      user = User.new(name: name, email: email, password_digest: password)
      if user.valid?
        user.save
        'Naudotojas issaugotoas'
      else
        'Slaptazodis per trumpas'
      end
    else
      'Slaptazodis nesutapo'
    end
  end
#Patkrinamas ar yra uzregistruotas naudojas
  def authentification(email, password)
    User.find_by(email: email, password_digest: password)
  end
end
