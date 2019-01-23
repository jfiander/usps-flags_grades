# Core SVG data for the membership level insignia.
#
# This class should never need to be called directly.
# @private
class USPSFlags::Grades::Membership
  class << self
    def get(type)
      <<~SVG
        #{arrow { send("#{type}_bar") }}
        #{send(type)}
      SVG
    end

    private

    def arrow
      <<~SVG
        <polyline points="0,250 75,220 75,240 150,240 150,260 75,260 75,280 0,250" fill="#{USPSFlags::Config::GOLD}" />
        #{yield}
        <polyline points="600,240 675,240 675,220 750,250 675,280 675,260 600,260 600,240" fill="#{USPSFlags::Config::GOLD}" />
      SVG
    end

    def senior_bar
      <<~SVG
        <polyline points="145,240 350,240 350,260 145,260 145,240" fill="#{USPSFlags::Config::GOLD}" />
        <polyline points="400,240 610,240 610,260 400,260 400,240" fill="#{USPSFlags::Config::GOLD}" />
      SVG
    end

    def life_bar
      <<~SVG
        <polyline points="145,240 275,240 275,260 145,260 145,240" fill="#{USPSFlags::Config::GOLD}" />
        <polyline points="400,240 610,240 610,260 475,260 475,240" fill="#{USPSFlags::Config::GOLD}" />
      SVG
    end

    def senior
      <<~SVG
        <polyline points="325,200 350,200 375,275 400,200 425,200 390,300 360,300 325,200" fill="#{USPSFlags::Config::GOLD}" />
      SVG
    end

    def life
      <<~SVG
        #{senior}
        <g transform="translate(285, 170) scale(0.2)">
          #{laurel}
        </g>
      SVG
    end

    def laurel
      <<~SVG
        <g transform="matrix(1.1420287,0,0,1.1420287,-54.210052,-119.65049)">
          <path
            d="m 107.6,178.2 c -0.2,0.7 -1.2,4.7 -2.1,8.8 -0.9,4.1 -2.2,9.7 -3,12.5 -7.9,29.7 -8.9,51.9 -2.9,67.7 4.5,12.2 7,16.7 8.9,16.7 2.4,0.1 12.2,-15.8 16.2,-26.4 6.4,-16.5 6.7,-18 6.7,-33.6 0.1,-15.7 -0.1,-16.4 -6.7,-29.7 -2,-3.9 -5.4,-8.5 -8.9,-11.8 -5.7,-5.5 -7.6,-6.4 -8.2,-4.2 z"
            fill="#{USPSFlags::Config::GOLD}" />
          <path
            d="m 768.8,181.2 c -7.6,7.2 -11.6,13.2 -14.9,23 -2.9,8.4 -3.1,30.1 -0.4,39.3 5.1,17.5 17.6,40.9 21.4,40.2 1.4,-0.2 5.4,-7.2 8,-13.7 2.2,-5.7 5.1,-21.5 5.1,-28 0,-7.7 -2.9,-24.7 -7.5,-43 -0.7,-3 -2.2,-9.1 -3.2,-13.4 -1.1,-4.4 -2.3,-8.1 -2.9,-8.3 -0.5,-0.2 -3,1.6 -5.6,3.9 z"
            fill="#{USPSFlags::Config::GOLD}" />
          <path
            d="m 59.6,251.7 c -1,1 -0.7,12.5 0.4,18.4 0.6,3 1.5,9 2,13.4 2.2,20.1 8,40.9 15.4,55.5 5.7,11.4 18.8,24.9 24.3,25 1.9,0 2.2,-0.7 2.9,-6.8 1.6,-15.4 -0.7,-41 -5.3,-57.2 -6.1,-21.9 -17.6,-39.3 -29.5,-44.8 -7.1,-3.2 -9.6,-4.1 -10.2,-3.5 z"
            fill="#{USPSFlags::Config::GOLD}" />
          <path
            d="m 819,252.6 c -8.7,2.8 -18.3,11.3 -24.3,21.3 -11.8,19.9 -18.4,52.9 -16.2,81.1 0.8,10.2 1.7,11 7.8,6.8 14.4,-10 23.3,-25.6 30,-52.3 2.8,-10.9 4.7,-21 4.7,-24 0,-1.7 0.7,-6.5 1.5,-10.8 0.8,-4.3 1.5,-11.2 1.5,-15.3 0,-7.8 -0.4,-8.3 -5,-6.8 z"
            fill="#{USPSFlags::Config::GOLD}" />
          <path
            d="m 151.5,300.7 c -13.2,16.6 -25.4,40.2 -30.8,59.3 -4.2,14.6 -4.7,17.9 -4.7,31.1 0,17.1 1.9,23.5 9.9,33.8 3.2,4.1 3.5,4.2 4.8,2.5 1.4,-1.9 17.3,-34.1 20.1,-40.4 0.8,-1.9 2.1,-4.8 2.8,-6.3 0.8,-1.6 1.4,-3.5 1.4,-4.4 0,-0.8 0.6,-2.7 1.4,-4.1 1.5,-2.9 3.5,-9.3 5.9,-18.7 3.9,-15.2 4.7,-29.2 2.3,-40.5 -1.4,-7 -6.1,-18 -7.7,-18 -0.5,0 -2.9,2.6 -5.4,5.7 z"
            fill="#{USPSFlags::Config::GOLD}" />
          <path
            d="m 724.3,297.7 c -3.9,5.9 -7.3,19.8 -7.3,29.3 0.1,9.6 3.6,28.6 6.6,35.8 0.8,1.8 1.4,3.9 1.4,4.7 0,0.8 0.6,2.9 1.4,4.7 0.8,1.8 2.4,5.8 3.6,8.8 6,15 22,47 23.5,47 2.7,0 8.9,-9.3 11.9,-17.8 1.5,-4.2 1.9,-8.3 1.8,-18.8 0,-14.2 -1.2,-21.1 -5.9,-34.9 -1.4,-3.9 -2.8,-8.4 -3.3,-10 -3.6,-11.7 -27.8,-51.5 -31.4,-51.5 -0.3,0 -1.4,1.2 -2.3,2.7 z"
            fill="#{USPSFlags::Config::GOLD}" />
          <path
            d="m 50.6,328.8 c -1.2,1.1 -0.6,20.7 1,31.1 1.9,13.4 4.2,25.3 6,31.1 2.6,8.7 5.4,17.1 6.3,18.8 4.5,8.9 6,11.6 9.7,17.3 4.5,6.8 19.7,22.2 23.7,23.9 1.2,0.6 4.1,2.2 6.5,3.6 6.2,3.6 7.4,2.8 6.6,-4.3 -1.7,-17.2 -8.6,-47.5 -14.1,-61.8 -0.8,-2.2 -2.2,-5.8 -3.1,-8 -1.8,-4.7 -4.8,-11.2 -6.5,-14 -7,-11.6 -11.1,-17.1 -17.1,-23.4 -7,-7.2 -17.9,-15.5 -19,-14.3 z"
            fill="#{USPSFlags::Config::GOLD}" />
          <path
            d="m 825,333.2 c -8.9,6.7 -13.2,11 -19.5,19.4 -12.6,16.6 -21.9,39.9 -27.9,69.4 -2.2,10.8 -4.4,23.7 -5,29.3 -0.7,6.3 0.6,6.7 8.1,2.6 12,-6.6 24.1,-18.5 32,-31.4 2.1,-3.4 8.3,-16.5 8.3,-17.5 0,-0.5 0.6,-2.4 1.4,-4.2 3.1,-7.2 6.4,-21.6 9.1,-39.5 1.6,-10.6 2.1,-31.9 0.8,-32.6 -0.5,-0.3 -3.7,1.8 -7.3,4.5 z"
            fill="#{USPSFlags::Config::GOLD}" />
          <path
            d="m 156.5,407.4 c -0.8,1.9 -1.5,4.7 -1.5,6.2 0,1.4 -0.8,5.4 -1.7,8.8 -2.5,9.4 -2.5,54.1 0,64.6 4.4,17.9 6.5,23.8 12.7,37 6,12.8 18.7,32 21.1,32 2.2,0 5,-7.9 6.9,-19.5 0.4,-2.8 1.3,-7 2.1,-9.5 2,-7.2 1.7,-45.7 -0.5,-54 -5.1,-19.5 -10.2,-32.5 -16.6,-42.5 -1.1,-1.7 -2.4,-3.9 -2.9,-5 -1.6,-3.3 -15.5,-20.8 -16.9,-21.3 -0.7,-0.2 -1.9,1.2 -2.7,3.2 z"
            fill="#{USPSFlags::Config::GOLD}" />
          <path
            d="m 717.2,411.7 c -6,7.5 -14.4,20.3 -16.3,24.7 -0.5,1.1 -1.3,2.8 -1.8,3.6 -3.6,6.1 -8.4,20.1 -11.7,33.9 -2.1,9 -2.4,44.7 -0.4,52.1 0.7,2.5 1.6,7 2.1,10 1.4,9.2 4.3,18.2 6.1,19.4 1.4,0.8 2.1,0.6 3.3,-0.9 1.9,-2.5 10.6,-15.4 12.1,-18 2.7,-4.6 11.4,-22.4 11.4,-23.4 0,-0.6 0.6,-2.5 1.4,-4.3 7.3,-17.2 10.5,-44.7 8.2,-70.3 -0.8,-8.8 -2,-17.6 -2.5,-19.5 -0.6,-1.9 -1.1,-4.8 -1.1,-6.5 0,-3.3 -1.9,-7.6 -3.6,-8.2 -0.6,-0.2 -3.9,3.1 -7.2,7.4 z"
            fill="#{USPSFlags::Config::GOLD}" />
          <path
            d="m 50.6,442.8 c -0.9,1.4 3.4,14.8 7.7,24.2 7.1,15.7 22.4,31 42.4,42.5 4.3,2.5 8.5,5 9.3,5.5 6.4,3.8 39.6,20 41.1,20 1.7,0 1.9,-0.5 1.4,-3.8 -1.1,-6.5 -3.6,-13.8 -8.2,-23.7 C 136.9,491.4 121.1,475.9 98.5,462.3 93.3,459.2 75,450.6 66,447 c -3,-1.1 -6.8,-2.8 -8.3,-3.6 -3.2,-1.6 -6.3,-1.8 -7.1,-0.6 z"
            fill="#{USPSFlags::Config::GOLD}" />
          <path
            d="m 825,443.7 c -1.9,0.9 -5,2.2 -6.7,2.9 -7.4,3.1 -10.5,4.4 -13.6,5.7 -4.8,2.1 -16.9,8.3 -20.8,10.6 -1.9,1.2 -4.1,2.4 -4.9,2.8 -1.4,0.6 -4.6,2.9 -13.5,9.5 -5.5,4.2 -17.5,16.9 -21,22.3 -3.9,6.2 -10.5,19.9 -10.5,21.9 0,0.7 -0.7,3 -1.5,4.9 -2,4.7 -2,10.7 -0.1,10.7 1.2,0 37.9,-18.2 46.6,-23.1 18.3,-10.4 34.6,-25 42.7,-38.4 5,-8.2 12.1,-28.4 10.8,-30.5 -0.9,-1.4 -3.4,-1.1 -7.5,0.7 z"
            fill="#{USPSFlags::Config::GOLD}" />
          <path
            d="m 73.6,520.9 c -0.6,0.9 0.3,4.2 1.3,5.1 0.3,0.3 1.7,2.1 3.1,4 12.2,17.5 35.9,39.9 52.5,49.6 2.7,1.6 5.9,3.4 7,4.1 1.1,0.7 3,1.7 4.3,2.3 1.3,0.5 4.6,2 7.5,3.3 14.6,6.7 28.5,10.3 47.7,12.7 10.8,1.3 11,1.3 11,-0.5 0,-2 -10.4,-17.8 -17.5,-26.5 -7.9,-9.6 -29,-28.8 -34.5,-31.3 -0.8,-0.4 -2.8,-1.6 -4.5,-2.7 -4.3,-2.7 -14.6,-8.1 -17.5,-9 -1.4,-0.5 -4.9,-1.8 -7.9,-2.9 C 117.9,526 105.7,523.3 94,522 75.3,520 74.2,519.9 73.6,520.9 z"
            fill="#{USPSFlags::Config::GOLD}" />
          <path
            d="m 802,520.6 c -28.5,2.6 -41.7,5.9 -60.5,15.1 -14.3,7.1 -23.7,13.7 -35.7,25.6 -14.2,13.9 -32.8,39 -30.6,41.3 0.8,0.7 18.4,-1.3 27.3,-3.2 15.7,-3.3 24.8,-6.5 39.5,-13.9 6.6,-3.3 20.6,-11.9 22,-13.5 0.3,-0.3 2.5,-2.1 5,-4 10.6,-8 24,-21.9 33.9,-35 7.7,-10.3 8.4,-11.7 6.5,-12.4 -0.9,-0.3 -2.1,-0.5 -2.7,-0.4 -0.7,0 -2.8,0.3 -4.7,0.4 z"
            fill="#{USPSFlags::Config::GOLD}" />
          <path
            d="m 209.6,524.7 c -1.9,2 2.3,27.3 6.5,39.8 0.6,1.6 1.5,4.3 1.9,6 1.8,6.3 7.4,20.1 10,24.5 0.5,0.8 2,3.6 3.4,6.2 3.2,5.9 9.1,15.1 10.8,16.9 0.7,0.8 3.3,3.9 5.8,6.9 8.9,10.8 21.7,22.3 34.1,30.3 5.9,3.9 7.8,4.5 8,2.4 1.2,-13.8 -4.2,-42.4 -11.2,-59.2 -2.2,-5.4 -8,-16.9 -9.9,-20 -1.1,-1.7 -2.3,-3.7 -2.7,-4.5 -1.6,-3.6 -10.3,-14.1 -17.7,-21.6 -7.4,-7.4 -23.5,-20.4 -25.2,-20.4 -0.4,0 -1.5,-0.6 -2.3,-1.4 -2.7,-2.3 -10.9,-6.5 -11.5,-5.9 z"
            fill="#{USPSFlags::Config::GOLD}" />
          <path
            d="m 669.5,526.1 c -1.6,1 -3.7,2.2 -4.5,2.6 -0.8,0.4 -3.5,2 -6,3.7 -16.4,10.9 -33,27.1 -41.6,40.6 -8,12.7 -16,30.5 -18.4,41 -0.4,1.9 -1.2,5.5 -1.8,8 -2.9,11.8 -4.2,20.8 -4.2,28.4 0,4.5 0.3,8.5 0.6,8.9 1.5,1.5 22.3,-14.1 32.9,-24.8 14.9,-14.9 24.3,-29.1 33.9,-51 8,-18.2 16.2,-55.5 13,-58.5 -0.5,-0.4 -2.2,0.1 -3.9,1.1 z"
            fill="#{USPSFlags::Config::GOLD}" />
          <path
            d="m 144.5,604.1 c -6.5,0.8 -12.9,2.9 -14.7,4.7 -0.7,0.7 -1.7,1.2 -2.3,1.2 -1.6,0 -5.5,4.3 -5.5,6.2 0,1.2 14.9,11.9 21,15.1 0.8,0.4 2.9,1.6 4.5,2.7 1.7,1.1 3.9,2.4 5,3 1.1,0.6 4.7,2.6 8,4.5 7.2,4.2 30.2,15.5 36.5,18 2.5,1 5.9,2.3 7.5,3 1.7,0.7 5.5,2 8.5,2.8 3,0.9 8.2,2.3 11.5,3.3 8.9,2.5 32.4,2.6 38.5,0 6.8,-2.8 7.5,-3.2 7.8,-4.9 0.4,-2 -12.6,-13.5 -28.6,-25.1 -3.4,-2.5 -6.4,-4.6 -6.6,-4.6 -0.3,0 -3.1,-1.7 -6.3,-3.8 -6.2,-4.2 -7.1,-4.7 -19,-10.5 -13.4,-6.7 -24.9,-11.3 -30.3,-12.4 -1.4,-0.3 -4.5,-1.1 -7,-1.8 -5.7,-1.7 -20.7,-2.4 -28.5,-1.4 z"
            fill="#{USPSFlags::Config::GOLD}" />
          <path
            d="m 719.5,604 c -7.7,0.8 -16.1,2.9 -24.5,6.1 -3,1.1 -6.7,2.4 -8.1,2.9 -1.4,0.4 -3.4,1.2 -4.5,1.8 -1,0.6 -5.3,2.7 -9.4,4.7 -18.5,9 -40.1,23.7 -55.5,37.8 -6.8,6.3 -6.8,7.8 0,10.4 16,6 43.6,2.7 69,-8.2 6.3,-2.8 17.1,-7.7 18.5,-8.5 0.8,-0.5 5.1,-2.7 9.5,-5 4.4,-2.2 9.4,-5 11,-6 1.7,-1.1 3.9,-2.4 5,-3 1.1,-0.6 3.4,-1.9 5,-3 1.7,-1.1 3.7,-2.3 4.5,-2.7 0.8,-0.4 4.3,-2.6 7.8,-5 3.5,-2.4 6.5,-4.3 6.8,-4.3 0.3,0 1.8,-1 3.4,-2.2 4.4,-3.2 3.9,-5.8 -1.9,-9.6 -2.8,-1.7 -5.5,-3.2 -6.1,-3.2 -0.6,0 -2.3,-0.6 -3.8,-1.4 -3.4,-1.7 -17.6,-2.6 -26.7,-1.6 z"
            fill="#{USPSFlags::Config::GOLD}" />
          <path
            d="m 305.5,607.5 c -0.5,0.2 -2.2,0.6 -3.7,0.9 -3.6,0.8 -3.6,3.3 -0.2,8.3 1.4,2.1 3,4.7 3.5,5.8 0.5,1.1 1.8,3.3 2.9,5 1.1,1.6 2.4,3.9 3,5 0.6,1.1 1.9,3.3 3,5 1.1,1.6 2.4,3.9 3,5 0.6,1.1 1.8,3.2 2.8,4.7 0.9,1.5 3.5,5.5 5.6,9 9.8,15.7 25.3,33.5 36.6,42.2 6.9,5.3 16.7,9.9 24.6,11.5 7.9,1.7 10.8,1.2 11.2,-1.7 0.5,-3.1 -3.1,-15 -7.3,-24.7 -3.9,-9 -5.9,-12.7 -10.7,-20.3 -1.6,-2.4 -2.8,-4.5 -2.8,-4.8 0,-0.3 -3.3,-4.9 -7.4,-10.2 -12.6,-16.5 -28.7,-30.6 -41.1,-36.1 -6.6,-2.9 -20,-5.6 -23,-4.6 z"
            fill="#{USPSFlags::Config::GOLD}" />
          <path
            d="m 564.5,609 c -10.5,2.7 -13.5,4.2 -25,12.7 -13,9.5 -26.9,25.5 -37.2,42.8 -2.1,3.5 -11,21.9 -12.6,26 -2.5,6.5 -5,17.2 -4.4,18.9 0.8,1.9 4.9,2 12.7,0.2 19.2,-4.2 39.3,-22.1 59.2,-52.6 4.1,-6.3 17.1,-27.7 18.1,-30 0.4,-0.8 1.6,-2.9 2.7,-4.5 1.1,-1.7 2.3,-3.7 2.7,-4.5 0.3,-0.8 1.4,-2.5 2.4,-3.8 2.4,-3.1 1.5,-4.9 -2.9,-6.2 -4.9,-1.3 -7.4,-1.2 -15.7,1 z"
            fill="#{USPSFlags::Config::GOLD}" />
          <path
            d="m 220.5,683 c -3.3,0.5 -9.1,1.4 -13,1.9 -23.2,3.4 -40.7,14.3 -47.2,29.3 -0.7,1.5 -0.9,2.9 -0.5,3.1 1.4,0.8 19.1,3.7 32.7,5.3 20,2.5 64.6,2.5 76.5,0 19.1,-3.9 33.4,-10 41.8,-17.9 5.6,-5.4 6.3,-7.1 3.3,-8.6 -4.1,-2.3 -21.6,-7 -34.6,-9.5 -18.7,-3.5 -47.8,-5.3 -59,-3.6 z"
            fill="#{USPSFlags::Config::GOLD}" />
          <path
            d="m 637,682.5 c -0.8,0.2 -6.9,0.9 -13.5,1.5 -11.4,1.1 -21.5,2.7 -31.5,5.2 -2.5,0.6 -6.1,1.4 -8,1.8 -7.8,1.8 -17,5.6 -17,7.1 0,1.3 7.1,8.5 11.5,11.5 3.9,2.6 14.1,7.5 18,8.5 1.7,0.4 4.4,1.2 6,1.7 1.7,0.6 7.3,1.9 12.5,2.8 13.1,2.5 55.5,2.5 75.5,0 16.1,-1.9 31.7,-4.6 32.8,-5.5 2.6,-2.3 -10.2,-18.4 -17.7,-22.1 -2.2,-1.2 -4.8,-2.5 -5.6,-2.9 -5.2,-3 -17.9,-6.5 -29.5,-8.1 -8.3,-1.1 -30.9,-2.2 -33.5,-1.5 z"
            fill="#{USPSFlags::Config::GOLD}" />
          <path
            d="m 341,719.6 c -12.2,2.1 -22.9,4.4 -27.5,6 -2.3,0.8 -4.8,1.4 -5.7,1.4 -1,0 -3.2,0.6 -5,1.4 -1.8,0.8 -5.3,2.2 -7.8,3.1 -32.4,12.6 -54.1,32.5 -56.5,51.9 -0.6,4.3 -0.4,5.6 0.6,5.6 2,0 24.1,-4 36.4,-6.6 3.9,-0.8 7.9,-1.4 9,-1.4 1.9,0 8.3,-1.3 22,-4.7 29.4,-7.1 51,-16.7 64.7,-28.9 8.4,-7.4 19.1,-23.5 17,-25.6 -3.7,-3.7 -30.4,-5 -47.2,-2.2 z"
            fill="#{USPSFlags::Config::GOLD}" />
          <path
            d="m 500,719.8 c -3,1 -5.5,2.2 -5.5,2.7 0,0.6 1.4,3.7 3,6.9 3.6,7.1 14.5,19.1 22,24.1 5.7,3.7 20.8,11.8 24.1,12.8 1,0.3 5.1,1.6 8.9,3 6.5,2.2 9.2,3 23.6,7.1 3.1,0.9 6.4,1.6 7.5,1.6 1,0 4.8,0.6 8.4,1.4 13.2,3 21.6,4.6 23.8,4.6 1.3,0 5.1,0.6 8.5,1.4 9.5,2.2 20.7,4 21.2,3.4 0.7,-0.7 -1.9,-11.4 -3.7,-15.3 -5.5,-12.2 -19.8,-25.8 -34.8,-33.4 -2.5,-1.2 -5.2,-2.6 -6,-3 -2.1,-1.2 -7.8,-3.6 -12.5,-5.4 -2.2,-0.8 -5.8,-2.1 -8,-3 -24.2,-8.9 -65.7,-13.5 -80.5,-8.9 z"
            fill="#{USPSFlags::Config::GOLD}" />
          <path
            d="m 422.5,740 c -3.3,1.7 -8.1,4.3 -10.7,5.8 -15.6,9.1 -28,23.9 -29,34.7 l -0.3,3 6.1,0.3 c 7.9,0.4 15.9,-3.2 22.6,-10 5.4,-5.5 9.9,-14.2 17.9,-34.6 1.1,-2.9 0.5,-2.8 -6.6,0.8 z"
            fill="#{USPSFlags::Config::GOLD}" />
          <path
            d="m 455,740.7 c 1.5,4.8 4,11.3 4.9,13.1 0.5,0.9 2,3.9 3.3,6.5 4.1,8.6 4.8,9.5 10.7,14.9 6.9,6.2 13.2,8.8 21.4,8.8 l 5.9,0 -0.7,-4 c -0.4,-2.2 -1.8,-5.9 -3.1,-8.3 -1.3,-2.3 -2.8,-5.1 -3.3,-6.2 -2.2,-5 -16.7,-16.6 -29.3,-23.4 -9.2,-5 -11,-5.2 -9.8,-1.4 z"
            fill="#{USPSFlags::Config::GOLD}" />
        </g>
      SVG
    end
  end
end
