module Rapidfire
  class Survey < ActiveRecord::Base
    has_many  :attempts
    has_many  :questions, dependent: :destroy

    has_rich_text :introduction

    validates :name, :presence => true
    
    amoeba do
      enable
      include_association :questions
    end
  end
end
