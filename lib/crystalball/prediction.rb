# frozen_string_literal: true

module Crystalball
  # Class for Crystalball prediction results
  class Prediction
    def initialize(records)
      @records = records
    end

    # When the records are something like:
    #   ./spec/foo ./spec/foo/bar_spec.rb
    # this returns just ./spec/foo
    def compact
      sort_by(&:length).each_with_object([]) do |c, result|
        result << c unless result.any? { |r| c.start_with?(r) }
      end.compact
    end

    def to_a
      records
    end

    def method_missing(*, &block)
      records.respond_to?(*) ? records.public_send(*, &block) : super
    end

    def respond_to_missing?(*)
      records.respond_to?(*)
    end

    private

    attr_reader :records
  end
end
