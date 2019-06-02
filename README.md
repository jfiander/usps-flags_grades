# USPSFlags Grades

[![Gem Version](https://img.shields.io/gem/v/usps_flags-grades.svg)](https://rubygems.org/gems/usps_flags-grades)
[![Build Status](https://travis-ci.org/jfiander/usps-flags_grades.svg)](https://travis-ci.org/jfiander/usps-flags_grades)
[![Test Coverage](https://api.codeclimate.com/v1/badges/760b824f0edac3316a11/test_coverage)](https://codeclimate.com/github/jfiander/usps-flags_grades/test_coverage)
[![Maintainability](https://api.codeclimate.com/v1/badges/760b824f0edac3316a11/maintainability)](https://codeclimate.com/github/jfiander/usps-flags_grades/maintainability)

An extension for [USPSFlags](https://github.com/jfiander/usps-flags) to generate
regrade insignia.

## Usage

```ruby
insignia = USPSFlags::Grades.new do |g|
  g.grade = :sn
  g.membership = :senior
  g.merit_marks = 20
  g.outfile = "/path/to/svg/output.svg"
end

insignia = USPSFlags::Grades.new(
  grade: :sn,
  membership: :senior,
  merit_marks: 20,
  outfile: "/path/to/svg/output.svg"
)

insignia.svg #=> Generates SVG file at "/path/to/svg/output.svg"
```

## License

Actual images generated are
[registered trademarks](http://www.usps.org/national/itcom/trademark.html) of
United States Power Squadrons.

This project is released under the
[GPLv3](https://raw.github.com/jfiander/usps-flags-grades/master/LICENSE).
