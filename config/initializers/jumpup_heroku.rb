Jumpup::Heroku.configure do |config|
  config.app = 'arcane-basin-2398'
end if Rails.env.development?
