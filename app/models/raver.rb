class Raver < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  after_create :capitalise_town


  private

  def capitalise_town
  	cap = self.town.upcase
  	self.town = cap
  	self.save
  end
end
