# Core SVG data for grade insignia.
#
# This class should never need to be called directly.
# @private
class USPSFlags::Grades::Grade
  class << self
    def get(grade)
      return if grade.nil?
      raise USPSFlags::Errors::InvalidInsignia, "Unknown grade: #{grade}" unless valid_grades.include?(grade)

      send(grade)
    end

    def valid_grades
      %i[s p ap jn n sn]
    end

    def width(grade)
      case grade
      when :ap
        USPSFlags::Config::GRADE_SPACING * 2.25 + 100
      when :jn
        USPSFlags::Config::GRADE_SPACING * 3 + 10
      when :n
        USPSFlags::Config::GRADE_SPACING * 5 + 45
      end
    end

    private

    def bar
      <<~SVG
        <rect x="0" y="0" width="100" height="35" fill="#{USPSFlags::Config::GOLD}" />
      SVG
    end

    def star
      <<~SVG
        <g transform="scale(0.33) translate(0, 150)">
          #{USPSFlags::Core::Icons::Star.new.svg.gsub('fill="#FFFFFF"', "fill=\"#{USPSFlags::Config::GOLD}\"")}
        </g>
      SVG
    end

    def s
      bar
    end

    def p
      <<~SVG
        #{bar}
        <g transform="translate(#{USPSFlags::Config::GRADE_SPACING})">#{bar}</g>
      SVG
    end

    def ap
      <<~SVG
        #{bar}
        <g transform="translate(#{USPSFlags::Config::GRADE_SPACING * 1.5 + 5})">#{star}</g>
        <g transform="translate(#{USPSFlags::Config::GRADE_SPACING * 2.25})">#{bar}</g>
      SVG
    end

    def jn
      <<~SVG
        <g transform="translate(60)">
          #{star}
          <g transform="translate(#{USPSFlags::Config::GRADE_SPACING / 2 + 25})">#{bar}</g>
          <g transform="translate(#{USPSFlags::Config::GRADE_SPACING * 2 + 20})">#{star}</g>
        </g>
      SVG
    end

    def n
      <<~SVG
        <g transform="translate(60)">
          #{star}
          <g transform="translate(#{USPSFlags::Config::GRADE_SPACING / 2 + 25})">#{bar}</g>
          <g transform="translate(#{USPSFlags::Config::GRADE_SPACING * 2 + 20})">#{star}</g>
          <g transform="translate(#{USPSFlags::Config::GRADE_SPACING * 3 - 10})">#{bar}</g>
          <g transform="translate(#{USPSFlags::Config::GRADE_SPACING * 4 + 50})">#{star}</g>
        </g>
      SVG
    end

    def sn
      box_width = USPSFlags::Grades::Grade.width(:n) + 60
      <<~SVG
        <rect x="20" y="-10" width="#{box_width}" height="155" fill=\"none\" stroke-width=\"20\" stroke=\"#{USPSFlags::Config::GOLD}\" />
        <g transform="translate(50, 50)">
          #{n}
        </g>
      SVG
    end
  end
end
