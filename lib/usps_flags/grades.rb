require 'usps_flags'
require 'usps_flags/grades/config'
require 'usps_flags/grades/errors'

# Main class for generating burgees.
class USPSFlags::Grades
  require 'usps_flags/grades/grade'
  require 'usps_flags/grades/membership'
  require 'usps_flags/grades/edpro'

  # Constructor for generating grade insignia.
  #
  # @example Generate JN with EdPro and Senior Member
  #  insignia = USPSFlags::Grades.new do |b|
  #    b.grade = :jn
  #    b.edpro = :edpro
  #    b.membership = :senior
  #    b.outfile = "/path/to/svg/output.svg"
  #  end
  #
  #  insignia.svg #=> Generates SVG file at "/path/to/svg/output.svg"
  def initialize
    @grade = nil
    @edpro = false
    @membership = nil
    @outfile = nil
    @generated_at = Time.now.strftime("%Y%m%d.%H%S%z")
    yield self if block_given?
    validate
  end

  attr_accessor :grade
  attr_accessor :edpro
  attr_accessor :membership
  attr_accessor :outfile

  # Generates the constructed file as SVG.
  #
  # @return [String] Returns the SVG file output path, or the svg data if no path was specified.
  def svg
    @svg = <<~SVG
      #{USPSFlags::Core.headers(title: self.title)}
      #{USPSFlags::Grades::Grade.send(@grade)}
      #{USPSFlags::Grades::EdPro.get(@grade) if @edpro}
      #{USPSFlags::Grades::Membership.send(@membership) unless @membership.nil?}
      #{USPSFlags::Core.footer}
    SVG

    USPSFlags::Helpers.output(@svg, outfile: @outfile)
  end

  def title
    grade = @grade.to_s.upcase
    edpro = " - EdPro" if @edpro && @grade != :sn
    membership = case @membership
    when :senior
      " - Senior Member"
    when :life
      " - Life Member"
    end

    "#{grade}#{edpro}#{membership}"
  end

  private
  def validate
    raise USPSFlags::Errors::InvalidInsignia, "Unknown grade: #{@grade}" unless [:s, :p, :ap, :jn, :n, :sn].include?(@grade)
    raise USPSFlags::Errors::InvalidInsignia, "EdPro must be boolean" unless [true, false].include?(@edpro)
    raise USPSFlags::Errors::InvalidInsignia, "Unknown membership level: #{@membership}" unless [nil, :senior, :life].include?(@membership)
  end
end
