module CEA
  class Algorithm
    attr_reader :S, :G

    def initialize attributes
      hyp = Class.new(Private::Hypothesis)

      hyp.class_eval <<-END
        def attributes
          #{ attributes.inspect }
        end

        def padding
          #{ Hash[attributes.map { |key, values| [key, (values + [:undefined]).map { |v| v.to_s.length }.max] }].inspect }
        end
      END

      @S = [ hyp.new(Hash[attributes.map { |key, value| [key, :null] }]) ]
      @G = [ hyp.new(Hash[attributes.map { |key, value| [key, :undefined] }]) ]
    end

    def add_positive_example example
      @G -= @G.reject { |hyp| hyp.covers? example }
      until (temp = @S.reject { |hyp| hyp.covers? example }).empty?
        @S -= temp
        @S += temp.map { |hyp| hyp.ancestors }.flatten
        @S -= @S.select { |hyp| (@S - [hyp]).any? { |test| hyp.covers? test } }
      end
    end

    def add_negative_example example
      @S -= @S.select { |hyp| hyp.covers? example }
      until (temp = @G.select { |hyp| hyp.covers? example }).empty?
        @G -= temp
        @G += temp.map { |hyp| hyp.descendants }.flatten
        @G -= @G.select { |hyp| (@G - [hyp]).any? { |test| test.covers? hyp } }
      end
    end

    def classify example
      ((not @S.empty?) and @S.all? { |hyp| hyp.covers? example }) ? :positive : @G.any? { |hyp| hyp.covers? example } ? :unknown : :negative
    end
  end
end
