class Consultant < ActiveRecord::Base
  unloadable
  belongs_to :user
  belongs_to :company
end
