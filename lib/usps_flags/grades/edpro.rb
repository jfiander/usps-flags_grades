# Core SVG data for the Educational Proficiency insignia.
#
# This class should never need to be called directly.
# @private
class USPSFlags::Grades::EdPro
  class << self
    def get(grade)
      raise USPSFlags::Errors::InvalidInsignia, "EdPro is only valid for grades AP, JN, N" unless for_grade(grade)

      <<~SVG
        <rect x="0" y="100" width="#{length(grade)}" height="15" fill="#{USPSFlags::Config::GOLD}" stroke-width="5" stroke="#000000" />
      SVG
    end

    def for_grade(grade)
      [:ap, :jn, :n].include?(grade)
    end

    private
    def length(grade)
      case grade
      when :ap
        USPSFlags::Config::GRADE_SPACING * 2.25 + 100
      when :jn
        USPSFlags::Config::GRADE_SPACING * 3 - 10
      when :n
        USPSFlags::Config::GRADE_SPACING * 5 + 25
      end
    end
  end
end
