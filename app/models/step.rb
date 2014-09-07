class Step < ActiveRecord::Base
  belongs_to :asset
  belongs_to :path

  validates :path_id, :asset_id, :body, presence: true

  # before_validation :get_position

  # private
  def get_position
    steps = Path.find(self.path_id).steps
    if steps.length > 1
      sorted_steps = steps.sort_by { |step| step.position }
      self.position = sorted_steps[-2].position + 1
    end
  end
end
