require 'usps_flags'
require 'usps_flags/grades/config'
require 'usps_flags/grades/errors'

# Main class for generating burgees.
class USPSFlags::Grades
  require 'usps_flags/grades/grade'
  require 'usps_flags/grades/membership'
  require 'usps_flags/grades/edpro'
  require 'usps_flags/grades/merit_marks'

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
    @merit_marks = 0
    @outfile = nil
    @generated_at = Time.now.strftime("%Y%m%d.%H%S%z")
    yield self if block_given?
  end

  attr_accessor :grade
  attr_accessor :edpro
  attr_accessor :membership
  attr_accessor :merit_marks
  attr_accessor :outfile

  # Generates the constructed file as SVG.
  #
  # @return [String] Returns the SVG file output path, or the svg data if no path was specified.
  def svg
    validate
    @svg = <<~SVG
      #{USPSFlags::Core.headers(title: title)}
      <g transform="translate(0, 50)">
        #{USPSFlags::Grades::Grade.get(@grade)}
        #{USPSFlags::Grades::EdPro.get(@grade) if @edpro && USPSFlags::Grades::EdPro.for_grade(@grade)}
        #{USPSFlags::Grades::Membership.get(@membership) unless @membership.nil?}
      </g>
      <g transform="translate(0, 450)">
         #{USPSFlags::Grades::MeritMarks.get(@merit_marks)}
      </g>
      #{USPSFlags::Core.footer}
    SVG

    USPSFlags::Helpers.output(@svg, outfile: @outfile)
  end

  # Generates the descriptive title for the SVG.
  #
  # @return [String] Returns the descriptive title.
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
    validate_grade
    validate_edpro
    validate_membership
  end

  def validate_grade
    return if @grade.nil? || USPSFlags::Grades::Grade.valid_grades.include?(@grade)

    raise USPSFlags::Errors::InvalidInsignia, "Unknown grade: #{@grade}"
  end

  def validate_edpro
    return if [true, false].include?(@edpro)

    raise USPSFlags::Errors::InvalidInsignia, "EdPro must be boolean"
  end

  def validate_membership
    return if [nil, :senior, :life].include?(@membership)

    raise USPSFlags::Errors::InvalidInsignia, "Unknown membership level: #{@membership}"
  end
end
