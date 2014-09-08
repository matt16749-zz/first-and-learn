class Step < ActiveRecord::Base
  belongs_to :asset
  belongs_to :path

  validates :path_id, :asset_id, :body, presence: true

  def get_position_and_update!
    self.position = sorted_steps.last.position + 1 unless path_steps_last_object_self?
  end

  private

  def path_steps_last_object_self?
    sorted_steps.last.eql?(self)
  end

  def sorted_steps
    self.path.steps.order("position ASC")
  end
end
