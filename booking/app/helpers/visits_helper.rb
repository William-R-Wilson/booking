module VisitsHelper
  def setup_needs(visit)
    visit.needs ||= Need.build(projector: false)
    visit
  end
end
