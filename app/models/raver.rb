class Raver < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :applications,  dependent: :destroy
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :lastseenable

  after_create :capitalise_town, :set_region

  def set_region
    case self.town
    when /TUNIS/  # Region Tunis
      self.region = 'TUNIS'
      self.save
    when /MORNAG/ 
      self.region = 'TUNIS'
      self.save
    when /ARIANA/
      self.region = 'TUNIS'
      self.save
    when /BARDO/
      self.region = 'TUNIS'
      self.save
    when /BEN AROUS/
      self.region = 'TUNIS'
      self.save
    when /MENZAH/
      self.region = 'TUNIS'
      self.save
    when /OMRANE/
      self.region = 'TUNIS'
      self.save
    when /MEGRINE/
      self.region = 'TUNIS'
      self.save
    when /MOUROUJ/
      self.region = 'TUNIS'
      self.save
    when /SIDI BOU SAID/
      self.region = 'TUNIS'
      self.save
    when /RADES/
      self.region = 'TUNIS'
      self.save
    when /EZZAH/
      self.region = 'TUNIS'
      self.save
    when /BOUMHEL/
      self.region = 'TUNIS'
      self.save
    when /IBN SINA/
      self.region = 'TUNIS'
      self.save
    when /AIN ZAGHOUANE/
      self.region = 'TUNIS'
      self.save
    when /NASR/
      self.region = 'TUNIS'
      self.save
    when /SOUKRA/
      self.region = 'TUNIS'
      self.save
    when /LIF/
      self.region = 'TUNIS'
      self.save
    when /CARTHAGE/
      self.region = 'TUNIS'
      self.save
    when /MARSA/
      self.region = 'TUNIS'
      self.save
    when /HAMMEM CHAT/
      self.region = 'TUNIS'
      self.save
    when /HAMMAM CHAT/
      self.region = 'TUNIS'
      self.save
    when /HAMMEM CHAT/
      self.region = 'TUNIS'
      self.save
    when /KRAM/
      self.region = 'TUNIS'
      self.save
    when /AOUINA/
      self.region = 'TUNIS'
      self.save
    when /SOUSSE/
      self.region = 'SOUSSE' # Region Sousse
      self.save
    when /HAMMAM SOUSSE/  
      self.region = 'SOUSSE'
      self.save
    when /SAHLOUL/
      self.region = 'SOUSSE'
      self.save
    when /NABEUL/
      self.region = 'NABEUL' # Region Nabeul
      self.save
    when /BOUZELFA/
      self.region = 'NABEUL' 
      self.save
    when /KORBA/
      self.region = 'NABEUL' 
      self.save
    when /HAMMAMET/
      self.region = 'HAMMAMET' # Region Hammamet
      self.save
    when /BIZERTE/
      self.region = 'BIZERTE' # Region Bizerte
      self.save
    when /MENZEL BOURGUIBA/
      self.region = 'BIZERTE' 
      self.save
    when /TEBOURSOUK/
      self.region = 'BEJA' # Region Beja
      self.save
    else
      self.region = self.town
      self.save
    end
  end
 

  private

  def capitalise_town
  	cap = self.town.upcase
  	self.town = cap
  	self.save
  end

end
