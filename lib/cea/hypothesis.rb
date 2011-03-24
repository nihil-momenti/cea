module CEA
  module Private
    class Hypothesis
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
        "  { #{ @hash.map { |key, value| "#{ key }: #{ (value.to_s + ',').ljust(padding[key] + 1) }" }.join(' ').sub(/,(\s*)$/,' \1') } }\n"
      end

      def inspect
        @hash.inspect
      end

      def covers? other
        @hash.keys.all? do |attr|
          self[attr] == other[attr] || self[attr] == :undefined
        end
      end

      def descendants
        @hash.select { |attr, value| value == :undefined }.map do |attr, value|
          attributes[attr].map do |value|
            hash = @hash.dup
            hash[attr] = value
            self.class.new(hash)
          end
        end.flatten
      end

      def ancestors
        @hash.select { |attr, value| value != :undefined && value != :null }.map do |attr, value|
          hash = @hash.dup
          hash[attr] = :undefined
          self.class.new(hash)
        end + @hash.select { |attr, value| value == :null }.map do |attr, value|
          hash = @hash.dup
          attributes[attr].map do |value|
            hash = @hash.dup
            hash[attr] = value
            self.class.new(hash)
          end
        end.flatten
      end
    end
  end
end
