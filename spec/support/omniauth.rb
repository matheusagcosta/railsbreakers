OmniAuth.config.test_mode = true

OmniAuth.config.mock_auth[:readability] = OmniAuth::AuthHash.new({
  "credentials" => {
    "secret" => "mysecret",
    "token" => "mytoken"
  },
  "info" => {
    "date_joined" => "2014-10-18 19:26:47",
    "first_name" => "",
    "has_active_subscription" => false,
    "last_name" => "",
    "name" => "MarcioJunior",
    "reading_limit" => nil
  },
  "provider" => "readability",
  "uid" => "MarcioJunior"
})
