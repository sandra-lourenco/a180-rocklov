require "httparty"

class BaseApi
  include HTTParty
  base_uri "http://rocklov-web:3333"
end
