module CEA::Private
  class Example
    def initialize args
      @hash = args.dup
    end

    def [] key
      @hash[key]
    end
  end
end
