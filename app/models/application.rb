class Application < ActiveRecord::Base
  belongs_to :raver
   mount_uploaders :portfolios, PortfolioUploader
end
