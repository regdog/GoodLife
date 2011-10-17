class Reward < ActiveRecord::Base
  attr_reader :tag_tokens

  belongs_to :partner
  has_many :user_wishes
  has_many :wanted_users, :through => :user_wishes, :source => :user
  has_many :taggings, :as => :taggable, :dependent => :destroy
  has_many :tags, :through => :taggings

  has_one :image, :as => :attachable, :dependent => :destroy
  accepts_nested_attributes_for :image, :allow_destroy => true

  # local rewards
  def self.local
    Reward.search :partner_category_id_equals => Category.local.id
  end

  #premium rewards
  def self.premium
    Reward.search :partner_category_id_equals => Category.local.id
  end

  def tag_tokens=(ids)
    self.tag_ids = ids.split(",")
  end
end
