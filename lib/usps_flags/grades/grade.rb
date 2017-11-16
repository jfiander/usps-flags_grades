# Core SVG data for grade insignia.
#
# This class should never need to be called directly.
# @private
class USPSFlags::Grades::Grade
  def self.s
    <<~SVG
      <rect x="0" y="0" width="100" height="25" fill="#{USPSFlags::Config::GOLD}" stroke-width="5" stroke="#000000" />
    SVG
  end
end