module CEA
  module Private
    class Hypothesis
      # +args+ should be a hash of attribute to value mappings.
      def initialize args
        @hash = args.dup
      end

      def [] key
        @hash[key]
      end

      def <=> other
        @hash.sort <=> other.instance_variable_get(:@hash).sort
      end

      def == other
        @hash == other.instance_variable_get(:@hash)
      end

      def to_s
        "  { #{ @hash.map { |key, value| key.to_s.yellow + ": #{ (value.to_s.cyan + ',').ljust(padding[key] + 1) }" }.join(' ').sub(/,(\s*)$/,' \1') } }\n"
      end

      def inspect
        @hash.inspect
      end

      # A hypothesis covers an example or another hypothesis when this
      # hypothesis has either the same value or :undefined for all attributes.
      def covers? other
        @hash.keys.all? do |attr|
          self[attr] == other[attr] || self[attr] == :undefined || other[attr] == :null
        end
      end

      # Finds all hypotheses that are one step more specific than this
      # hypothesis.  Can simply replace all :undefined attributes one at a time
      # with each of their possible values.
      def descendants
        @hash.select { |attr, value| value == :undefined }.map do |attr, value|
          attributes[attr].map do |value|
            self.class.new(@hash.merge({ attr => value }))
          end
        end.flatten
      end

      # Finds all hypotheses that are one step more general than this
      # hypothesis.  If this is the null hypothesis then construct the entire
      # set of most specific hypotheses.  Otherwise simply generates all single
      # replacements of an attribute with :undefined.
      def ancestors
        if @hash.values.include? :null
          s = []
          build_hash = proc do |attributes, current_hypothesis|
            if attributes.empty?
              s << self.class.new(Hash[*current_hypothesis])
            else
              attributes[0].each do |value|
                build_hash[attributes[1..attributes.length], current_hypothesis + value]
              end
            end
          end
          build_hash[attributes.map { |key, values| values.map { |value| [key, value] } }, []]
          return s
        else
          @hash.select { |attr, value| value != :undefined }.map do |attr, value|
            self.class.new(@hash.merge({ attr => :undefined }))
          end
        end
      end
    end
  end
end
