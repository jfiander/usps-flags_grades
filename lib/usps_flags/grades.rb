# frozen_string_literal: true

require 'usps_flags'
require 'usps_flags/grades/config'
require 'usps_flags/grades/errors'

# Main class for generating grade and other insignia.
class USPSFlags
  class Grades
    require 'usps_flags/grades/grade'
    require 'usps_flags/grades/membership'
    require 'usps_flags/grades/edpro'
    require 'usps_flags/grades/merit_marks'

    ALL_CONFIGS ||= [
      [:s, false, nil], [:p, false, nil], [:ap, false, nil], [:ap, true, nil],
      [:jn, false, nil], [:jn, true, nil], [:n, false, nil], [:n, true, nil],
      [:sn, false, nil], [nil, false, :senior], [nil, false, :life]
    ].freeze

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
    def initialize(options = {})
      @grade = options[:grade]
      @edpro = options[:edpro] || false
      @membership = options[:membership]
      @merit_marks = options[:merit_marks] || 0
      @outfile = options[:outfile]
      @generated_at = Time.now.strftime('%Y%m%d.%H%S%z')
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
        #{USPSFlags::Core.headers(title: title).gsub('0 0 3072 2048', '0 0 1024 682')}
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

    # Generates the constructed file as PNG.
    #
    # @return [String] Returns the PNG file output path.
    def png(outfile: nil)
      USPSFlags::Generate.png(svg, outfile: outfile)
      outfile
    end

    # Generates the descriptive title for the SVG.
    #
    # @return [String] Returns the descriptive title.
    def title
      grade = @grade.to_s.upcase
      edpro = ' - EdPro' if @edpro && @grade != :sn
      membership = case @membership
                   when :senior
                     ' - Senior Member'
                   when :life
                     ' - Life Member'
      end

      "#{grade}#{edpro}#{membership}"
    end

    def self.all(dir = nil)
      dir ||= USPSFlags.configuration.flags_dir

      ALL_CONFIGS.each do |grade, edpro, membership|
        path = "#{dir}/#{grade}"
        path += '_edpro' if edpro

        insignia = USPSFlags::Grades.new(
          grade: grade, edpro: edpro, membership: membership,
          outfile: "#{path}.svg"
        )

        USPSFlags::Generate.png(insignia.svg, outfile: "#{path}.png", trim: true)
      end
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

      raise USPSFlags::Errors::InvalidInsignia, 'EdPro must be boolean'
    end

    def validate_membership
      return if [nil, :senior, :life].include?(@membership)

      raise USPSFlags::Errors::InvalidInsignia, "Unknown membership level: #{@membership}"
    end
  end
end
