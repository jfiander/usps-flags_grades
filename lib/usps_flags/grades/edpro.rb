# frozen_string_literal: true

# Core SVG data for the Educational Proficiency insignia.
#
# This class should never need to be called directly.
# @private
class USPSFlags
  class Grades
    class EdPro
      class << self
        def get(grade)
          raise USPSFlags::Errors::InvalidInsignia, 'EdPro is only valid for grades AP, JN, N' unless for_grade(grade)

          <<~SVG
            <rect x="0" y="100" width="#{USPSFlags::Grades::Grade.width(grade)}" height="20" fill="#{USPSFlags::Config::GOLD}" />
          SVG
        end

        def for_grade(grade)
          %i[ap jn n].include?(grade)
        end
      end
    end
  end
end
