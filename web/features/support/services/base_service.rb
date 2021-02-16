require "httparty"

class BaseService
  include HTTParty
  base_uri "http://rocklov-api:3000"
end
