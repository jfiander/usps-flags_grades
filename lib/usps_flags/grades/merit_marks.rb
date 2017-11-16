# Core SVG data for merit marks.
#
# This class should never need to be called directly.
# @private
class USPSFlags::Grades::MeritMarks
  class << self
    def get(number)
      return if number < 1

      svg = ""
      new_lines = 0

      top_row = number % 20
      svg << generate_top_row(top_row)
      number -= top_row

      while number > 0
        number -= 20
        new_lines += 1
        svg << <<~SVG
          <g transform="translate(0,90)">
          #{generate_full_row}
        SVG
      end
      new_lines.times { svg << "</g>" }

      svg
    end

    private
    def bar(offset = 0)
      <<~SVG
        <rect x="#{offset}" y="0" width="35" height="80" fill="#{USPSFlags::Config::GOLD}" />
      SVG
    end

    def generate_top_row(number)
      svg = ""

      number.times do |i|
        svg << bar(45 * i)
      end

      svg
    end

    def generate_full_row
      svg = ""

      20.times do |i|
        svg << bar(45 * i)
      end

      svg
    end
  end
end
