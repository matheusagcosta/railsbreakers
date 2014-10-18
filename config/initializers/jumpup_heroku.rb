Jumpup::Heroku.configure do |config|
  config.app = 'railsbreakers'
end if Rails.env.development?
