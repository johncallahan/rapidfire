module Rapidfire
  class Survey < ActiveRecord::Base
    has_many  :attempts
    has_many  :questions, dependent: :destroy

    has_rich_text :introduction

    validates :name, :presence => true
    
    amoeba do
      enable
      prepend :name => "Copy of "
      include_association :questions
      customize(lambda {|original,new_object|
        new_object.introduction = original.introduction.dup
      })
    end
  end
end
