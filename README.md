# USPSFlags Grades

[![Gem Version](https://img.shields.io/gem/v/usps_flags-grades.svg)](https://rubygems.org/gems/usps_flags-grades)
[![Build Status](https://travis-ci.org/jfiander/usps-flags_grades.svg)](https://travis-ci.org/jfiander/usps-flags_grades)
[![Test Coverage](https://api.codeclimate.com/v1/badges/760b824f0edac3316a11/test_coverage)](https://codeclimate.com/github/jfiander/usps-flags_grades/test_coverage)
[![Maintainability](https://api.codeclimate.com/v1/badges/760b824f0edac3316a11/maintainability)](https://codeclimate.com/github/jfiander/usps-flags_grades/maintainability)

An extension for [USPSFlags](https://github.com/jfiander/usps-flags) to generate
grade insignia.

## Usage

```ruby
insignia = USPSFlags::Grades.new do |g|
  g.grade = :sn
  g.membership = :senior
  g.merit_marks = 20
  g.outfile = "/path/to/svg/output.svg"
end

insignia.svg #=> Generates SVG file at "/path/to/svg/output.svg"
```

## Security

This gem is cryptographically signed. To be sure the gem code hasn’t been
tampered with:

Add my public key as a trusted certificate:

```sh
gem cert --add <(curl -Ls https://raw.github.com/jfiander/usps-flags_grades/master/certs/jfiander.pem)
```

Then install the gem securely:

```sh
gem install usps_flags-grades -P HighSecurity
```

## License

Actual images generated may be registered trademarks of their
respective squadrons.

This project is released under the
[GPLv3](https://raw.github.com/jfiander/usps-flags-grades/master/LICENSE).
