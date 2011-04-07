module CEA
  class Algorithm
    attr_reader :S, :G

    def initialize attributes
      # Here we're creating a new subclass of Hypothesis and defining the two 
      # methods required to make it work.
      hyp = Class.new(Private::Hypothesis)
      hyp.class_eval <<-END
        def attributes
          #{ attributes.inspect }
        end

        def padding
          #{ Hash[attributes.map { |key, values| [key, (values + [:undefined]).map { |v| v.to_s.cyan.length }.max] }].inspect }
        end
      END

      # We generate the two starting hypotheses
      @S = [ hyp.new(Hash[attributes.map { |key, value| [key, :null] }]) ]
      @G = [ hyp.new(Hash[attributes.map { |key, value| [key, :undefined] }]) ]
    end

    def add_positive_example example
      # First remove all hypotheses from G that do not cover the example
      @G -= @G.reject { |hyp| hyp.covers? example }
      # Then while there are hypotheses in S that do not cover the example
      until (temp = @S.reject { |hyp| hyp.covers? example }).empty?
        # Remove these hypotheses from S
        @S -= temp
        # Find all ancestors of these hypotheses and add them to S
        @S += temp.map { |hyp| hyp.ancestors }.flatten
        # Remove any hypotheses in S that cover another hypothesis in S
        @S -= @S.select { |hyp| (@S - [hyp]).any? { |test| hyp.covers? test } }
      end
    end

    def add_negative_example example
      # First remove all hypotheses from S that cover the example
      @S -= @S.select { |hyp| hyp.covers? example }
      # Then while there are hypotheses in G that cover the example
      until (temp = @G.select { |hyp| hyp.covers? example }).empty?
        # Remove these hypotheses from G
        @G -= temp
        # Find all descendants of these hypotheses and add them to G
        @G += temp.map { |hyp| hyp.descendants }.flatten
        # Remove any hypotheses in G that are covered by another hypothesis in G
        @G -= @G.select { |hyp| (@G - [hyp]).any? { |test| test.covers? hyp } }
      end
    end

    def classify example
      ((not @S.empty?) and @S.all? { |hyp| hyp.covers? example }) ? :positive : @G.any? { |hyp| hyp.covers? example } ? :unknown : :negative
    end

    def is_converged?
      @S == @G
    end
  end
end
