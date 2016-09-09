# encoding utf-8

require_relative './style.rb'
require_relative '../cartography.rb'

module Carto::CartoCSS::Styles
  class Polygon < Style
    def initialize(definition: default_definition)
      super(definition)
    end

    def self.accepted_geometry_types
      ['polygon', 'multipolygon']
    end

    private

    def default_definition
      Carto::CartoCSS::Cartography.new.to_hash[:simple][:polygon]
    end

    def parse_fill(fill)
      color = fill[:color][:fixed]
      opacity = fill[:color][:opacity]

      ["polygon-fill: #{color};",
       "polygon-opacity: #{opacity};",
       "polygon-gamma: 0.5;"]
    end

    def parse_stroke(stroke)
      width = stroke[:size][:fixed]
      color = stroke[:color][:fixed]
      opacity = stroke[:color][:opacity]

      ["line-width: #{width};",
       "line-color: #{color};",
       "line-opacity: #{opacity};",
       "line-comp-op: soft-light;"]
    end
  end
end
