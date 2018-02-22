class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true


  class User < ApplicationRecord
  validates :name,  presence: true
  validates :email, presence: true
end
end
