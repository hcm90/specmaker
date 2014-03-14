class Specsheet < ActiveRecord::Base
has_many :bowls
belongs_to :user
attr_accessor :spec

# validates :installation, :corner_radius, :drain_location, :drain_size, :divider, presence: true, if: :active?
# # validates :installation, inclusion: [true, false], if :active_or_step3?
# validates :name, presence: true, if: :active_or_new?
# # validates_associated :bowls, if: :active_or_step2?

end