# frozen_string_literal: true

require 'spec_helper'

describe USPSFlags::Grades do
  describe 'invalid insignia' do
    it 'should raise USPSFlags::Errors::InvalidInsignia if an invalid grade is specified' do
      @insignia = USPSFlags::Grades.new do |b|
        b.grade = :not_a_grade
        b.outfile = ''
      end

      expect { @insignia.svg }.to raise_error(
        USPSFlags::Errors::InvalidInsignia, 'Unknown grade: not_a_grade'
      )
    end

    it 'should raise USPSFlags::Errors::InvalidInsignia if an invalid edpro is specified' do
      @insignia = USPSFlags::Grades.new do |b|
        b.edpro = nil
        b.outfile = ''
      end

      expect { @insignia.svg }.to raise_error(
        USPSFlags::Errors::InvalidInsignia, 'EdPro must be boolean'
      )
    end

    it 'should raise USPSFlags::Errors::InvalidInsignia if an invalid membership is specified' do
      @insignia = USPSFlags::Grades.new do |b|
        b.membership = :normal
        b.outfile = ''
      end

      expect { @insignia.svg }.to raise_error(
        USPSFlags::Errors::InvalidInsignia, 'Unknown membership level: normal'
      )
    end
  end

  context 'S' do
    before(:each) do
      @insignia = USPSFlags::Grades.new do |g|
        g.grade = :s
        g.outfile = ''
      end
    end

    it 'should have the S insignia' do
      expect(@insignia.svg).to include(
        <<~SVG
          <g transform="translate(0, 50)">
            <rect x="0" y="0" width="100" height="35" fill="#FFBF3F" />
        SVG
      )
    end
  end

  context 'P' do
    before(:each) do
      @insignia = USPSFlags::Grades.new do |g|
        g.grade = :p
        g.outfile = ''
      end
    end

    it 'should have the P insignia' do
      expect(@insignia.svg).to include(
        <<~SVG
          <g transform="translate(0, 50)">
            <rect x="0" y="0" width="100" height="35" fill="#FFBF3F" />

          <g transform="translate(125)"><rect x="0" y="0" width="100" height="35" fill="#FFBF3F" />
          </g>
        SVG
      )
    end
  end

  context 'AP - EdPro' do
    before(:each) do
      @insignia = USPSFlags::Grades.new do |g|
        g.grade = :ap
        g.edpro = true
        g.outfile = ''
      end
    end

    it 'should have the AP insignia' do
      expect(@insignia.svg).to include(
        <<~SVG
          <g transform="translate(0, 50)">
            <rect x="0" y="0" width="100" height="35" fill="#FFBF3F" />

          <g transform="translate(192.5)"><g transform="scale(0.33) translate(0, 150)">
            <path d="M 0 0
          l 117.555 81.805
          l -41.47 -137.085
          l 114.125 -86.525
          l -143.185 -2.915
          l -47.025 -135.28
          l -47.025 135.28
          l -143.185 2.915
          l 114.125 86.525
          l -41.47 137.085
          l 117.555 -81.805
          " fill="#FFBF3F" />

          </g>
          </g>
          <g transform="translate(281.25)"><rect x="0" y="0" width="100" height="35" fill="#FFBF3F" />
          </g>
        SVG
      )
    end

    it 'should have the AP EdPro bar' do
      expect(@insignia.svg).to include(
        <<~SVG
          <rect x="0" y="100" width="381.25" height="20" fill="#FFBF3F" />
        SVG
      )
    end
  end

  context 'JN - 5MM' do
    before(:each) do
      @insignia = USPSFlags::Grades.new do |g|
        g.grade = :jn
        g.merit_marks = 5
        g.edpro = true
        g.outfile = ''
      end
    end

    it 'should have the JN insignia' do
      expect(@insignia.svg).to include(
        <<~SVG
          <g transform="translate(0, 50)">
            <g transform="translate(60)">
            <g transform="scale(0.33) translate(0, 150)">
            <path d="M 0 0
          l 117.555 81.805
          l -41.47 -137.085
          l 114.125 -86.525
          l -143.185 -2.915
          l -47.025 -135.28
          l -47.025 135.28
          l -143.185 2.915
          l 114.125 86.525
          l -41.47 137.085
          l 117.555 -81.805
          " fill="#FFBF3F" />

          </g>

            <g transform="translate(87)"><rect x="0" y="0" width="100" height="35" fill="#FFBF3F" />
          </g>
            <g transform="translate(270)"><g transform="scale(0.33) translate(0, 150)">
            <path d="M 0 0
          l 117.555 81.805
          l -41.47 -137.085
          l 114.125 -86.525
          l -143.185 -2.915
          l -47.025 -135.28
          l -47.025 135.28
          l -143.185 2.915
          l 114.125 86.525
          l -41.47 137.085
          l 117.555 -81.805
          " fill="#FFBF3F" />

          </g>
          </g>
          </g>
        SVG
      )
    end

    it 'should have a 5th position merit mark' do
      expect(@insignia.svg).to include('<rect x="180" y="0" width="35" height="80" fill="#FFBF3F" />')
    end

    it 'should not have a 6th position merit mark' do
      expect(@insignia.svg).to_not include('<rect x="225" y="0" width="35" height="80" fill="#FFBF3F" />')
    end

    it 'should have the JN EdPro bar' do
      expect(@insignia.svg).to include(
        <<~SVG
          <rect x="0" y="100" width="385" height="20" fill="#FFBF3F" />
        SVG
      )
    end
  end

  context 'N - Life Member' do
    before(:each) do
      @insignia = USPSFlags::Grades.new do |g|
        g.grade = :n
        g.membership = :life
        g.outfile = ''
      end
    end

    it 'should have the N insignia' do
      expect(@insignia.svg).to include(
        <<~SVG
          <g transform="translate(0, 50)">
            <g transform="translate(60)">
            <g transform="scale(0.33) translate(0, 150)">
            <path d="M 0 0
          l 117.555 81.805
          l -41.47 -137.085
          l 114.125 -86.525
          l -143.185 -2.915
          l -47.025 -135.28
          l -47.025 135.28
          l -143.185 2.915
          l 114.125 86.525
          l -41.47 137.085
          l 117.555 -81.805
          " fill="#FFBF3F" />

          </g>

            <g transform="translate(87)"><rect x="0" y="0" width="100" height="35" fill="#FFBF3F" />
          </g>
            <g transform="translate(270)"><g transform="scale(0.33) translate(0, 150)">
            <path d="M 0 0
          l 117.555 81.805
          l -41.47 -137.085
          l 114.125 -86.525
          l -143.185 -2.915
          l -47.025 -135.28
          l -47.025 135.28
          l -143.185 2.915
          l 114.125 86.525
          l -41.47 137.085
          l 117.555 -81.805
          " fill="#FFBF3F" />

          </g>
          </g>
            <g transform="translate(365)"><rect x="0" y="0" width="100" height="35" fill="#FFBF3F" />
          </g>
            <g transform="translate(550)"><g transform="scale(0.33) translate(0, 150)">
            <path d="M 0 0
          l 117.555 81.805
          l -41.47 -137.085
          l 114.125 -86.525
          l -143.185 -2.915
          l -47.025 -135.28
          l -47.025 135.28
          l -143.185 2.915
          l 114.125 86.525
          l -41.47 137.085
          l 117.555 -81.805
          " fill="#FFBF3F" />

          </g>
          </g>
          </g>
        SVG
      )
    end

    it 'should have a life member arrow' do
      expect(@insignia.svg).to include(
        'm 107.6,178.2 c -0.2,0.7 -1.2,4.7 -2.1,8.8 -0.9,4.1 -2.2,9.7 -3,12.5 -7.9,29.7 -8.9,51.9 -2.9,67.7 4.5,' \
        '12.2 7,16.7 8.9,16.7 2.4,0.1 12.2,-15.8 16.2,-26.4 6.4,-16.5 6.7,-18 6.7,-33.6 0.1,-15.7 -0.1,-16.4 -6.7,' \
        '-29.7 -2,-3.9 -5.4,-8.5 -8.9,-11.8 -5.7,-5.5 -7.6,-6.4 -8.2,-4.2 z'
      )
    end
  end

  context 'SN - Senior Member - 20 MM' do
    before(:each) do
      @insignia = USPSFlags::Grades.new do |g|
        g.grade = :sn
        g.membership = :senior
        g.merit_marks = 20
        g.outfile = ''
      end
    end

    it 'should have the SN insignia box' do
      expect(@insignia.svg).to include('<rect x="20" y="-10" width="')
      expect(@insignia.svg).to include('" height="155" fill="none" stroke-width="20"')
    end

    it 'should have a senior member arrow' do
      expect(@insignia.svg).to include(
        <<~SVG
          <polyline points="0,250 75,220 75,240 150,240 150,260 75,260 75,280 0,250" fill="#FFBF3F" />
          <polyline points="145,240 350,240 350,260 145,260 145,240" fill="#FFBF3F" />
          <polyline points="400,240 610,240 610,260 400,260 400,240" fill="#FFBF3F" />

          <polyline points="600,240 675,240 675,220 750,250 675,280 675,260 600,260 600,240" fill="#FFBF3F" />

          <polyline points="325,200 350,200 375,275 400,200 425,200 390,300 360,300 325,200" fill="#FFBF3F" />
        SVG
      )
    end

    it 'should have a 20th position merit mark' do
      expect(@insignia.svg).to include('<rect x="855" y="0" width="35" height="80" fill="#FFBF3F" />')
    end
  end

  it 'should generate all without error' do
    expect(USPSFlags::Grades.all).to eql(USPSFlags::Grades::ALL_CONFIGS)
  end

  it 'should raise the correct error with an invalid edpro request' do
    expect { USPSFlags::Grades::EdPro.get(:s) }.to raise_error(
      USPSFlags::Errors::InvalidInsignia, 'EdPro is only valid for grades AP, JN, N'
    )
  end
end
