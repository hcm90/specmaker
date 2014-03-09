class Specsheet < ActiveRecord::Base
  attr_accessor :bowls
has_many :bowls
belongs_to :user
accepts_nested_attributes_for :bowls
validates :installation, :corner_radius, :drain_location, :drain_size, :divider, presence: true, if: :active?
# validates :installation, inclusion: [true, false], if :active_or_step3?
validates :name, presence: true, if: :active_or_new?
# validates_associated :bowls, if: :active_or_step2?

  def active?
    status == 'active'
  end

  def active_or_new?
  	(status).include?('new') || active? 
  end

  def active_or_step2?
  	(status).include?('step2') || active? 
  end

  def active_or_step3?
  	(status).include?('step3') || active? 
  end

end
