class Book < ActiveRecord::Base
 attr_accessible :title, :author, :description

      validates_presence_of :title, :author
      validates_uniqueness_of :title
end
