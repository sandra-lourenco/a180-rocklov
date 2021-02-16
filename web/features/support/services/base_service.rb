require "httparty"

class BaseService
  include HTTParty
  base_uri "http://rocklov-web:3000"
end
