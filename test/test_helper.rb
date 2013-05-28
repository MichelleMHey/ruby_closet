require 'test/unit'
require_relative '../bootstrap_ar'

connect_to 'test'

ENV['RC_ENV'] = 'test'

module DatabaseCleaner 
  def before_setup
    super
    Clothing.destroy_all
  end
end