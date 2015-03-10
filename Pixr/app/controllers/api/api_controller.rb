module Api
  class ApiController < ApplicationController
    before_action :must_be_signed_in
  end
end
