Rails.application.config.middleware.use OmniAuth::Builder do
  OmniAuth.config.allowed_request_methods = [:post, :get]
  provider :google_oauth2, "387798037987-utmv3p575t3dm88bggq6rr06m0ank0sj.apps.googleusercontent.com", "JL3IY2NB_i7E9-dzgbloQYcE",  :client_options => {:ssl => {:ca_file => '#{Rails.root}/lib/assets/cacert.pem'}, :scope => 'userinfo.profile,youtube'}, provider_ignores_state: true
end
