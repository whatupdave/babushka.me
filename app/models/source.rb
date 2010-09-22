class Source < ActiveRecord::Base

  has_many :deps

  validates_presence_of :uri
  validates_uniqueness_of :uri

end
