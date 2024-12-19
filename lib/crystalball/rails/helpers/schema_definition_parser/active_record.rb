# frozen_string_literal: true

module Crystalball
  module Rails
    module Helpers
      class SchemaDefinitionParser
        # This mock will be used during SchemaDefinitionParser.parse
        module ActiveRecord
          # A simple mock to read definition of schema
          class Schema
            def self.define(*_args, &)
              collector = SchemaDefinitionParser.new
              collector.instance_exec(collector, &)
              collector.hash
            end
          end
        end
      end
    end
  end
end
