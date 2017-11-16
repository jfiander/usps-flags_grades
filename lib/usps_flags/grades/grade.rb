# Core SVG data for grade insignia.
#
# This class should never need to be called directly.
# @private
class USPSFlags::Grades::Grade
  class << self
    def get(grade)
      raise USPSFlags::Errors::InvalidInsignia, "Unknown grade: #{grade}" unless valid_grades.include?(grade)

      send(grade)
    end

    def valid_grades
      [:s, :p, :ap, :jn, :n, :sn]
    end

    private
    def bar
      <<~SVG
        <rect x="0" y="0" width="100" height="35" fill="#{USPSFlags::Config::GOLD}" stroke-width="5" stroke="#000000" />
      SVG
    end

    def star
      <<~SVG
        <g transform="scale(0.25) translate(0, 150)">
          #{USPSFlags::Core::Star.new.svg.gsub("fill=\"#FFFFFF\"", "fill=\"#{USPSFlags::Config::GOLD}\" stroke-width=\"15\" stroke=\"#000000\"")}
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
        <g transform="translate(50)">
          #{star}
          <g transform="translate(#{USPSFlags::Config::GRADE_SPACING / 2 + 25})">#{bar}</g>
          <g transform="translate(#{USPSFlags::Config::GRADE_SPACING * 2 + 20})">#{star}</g>
        </g>
      SVG
    end

    def n
      <<~SVG
        <g transform="translate(50)">
          #{star}
          <g transform="translate(#{USPSFlags::Config::GRADE_SPACING / 2 + 25})">#{bar}</g>
          <g transform="translate(#{USPSFlags::Config::GRADE_SPACING * 2 + 20})">#{star}</g>
          <g transform="translate(#{USPSFlags::Config::GRADE_SPACING * 3 - 10})">#{bar}</g>
          <g transform="translate(#{USPSFlags::Config::GRADE_SPACING * 4 + 50})">#{star}</g>
        </g>
      SVG
    end

    def sn
      box_width = USPSFlags::Grades::Grade.width(:n) + 85
      <<~SVG
        <polyline points="20,-10 #{box_width},-10 #{box_width},150 20,150 20,-10" fill=\"none\" stroke-width=\"15\" stroke=\"#{USPSFlags::Config::GOLD}\" />
        <g transform="translate(50, 50)">
          #{n}
        </g>
      SVG
    end
  end
end
