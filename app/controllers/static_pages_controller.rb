class StaticPagesController < ApplicationController
  before_action :must_be_signed_in

  def root
  end
end
