class Step < ActiveRecord::Base
  belongs_to :asset
  belongs_to :path

  validates :path_id, :asset_id, :body, presence: true

  def get_position_and_update!
    self.position = sorted_steps[-2].position + 1 if steps_greater_than_one?
  end

  private

  def steps_greater_than_one?
    self.path.steps.length > 1
  end

  def sorted_steps
    self.path.steps.order("position ASC")
  end
end
