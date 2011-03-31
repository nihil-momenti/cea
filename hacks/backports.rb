# If running in Ruby 1.8.6 define the new methods from 1.8.7 that I use.
# All the complex methods have been directly pulled out of the Rubinius source.

if RUBY_VERSION < '1.8.7'
  class Array
    def shuffle; sort_by { rand } end
    def take n; first n end
    def drop n; last (length - n) end

    def one?
      found_one = false
      if block_given?
        each do |o|
          if yield(o)
            return false if found_one
            found_one = true
          end
        end
      else
        each do |o|
          if o
            return false if found_one
            found_one = true
          end
        end
      end
      found_one
    end

    def none?
      if block_given?
        each { |o| return false if yield(o) }
      else
        each { |o| return false if o }
      end
      return true
    end
  end

  class << Hash
    alias old_brackets []

    def [] *args
      if args.size == 1
        obj = args.first
        if obj.kind_of? Hash
          return new.replace(obj)
        elsif obj.respond_to? :to_hash
          return new.replace(Type.coerce_to(obj, Hash, :to_hash))
        elsif obj.is_a?(Array) # See redmine # 1385
          h = new
          args.first.each do |arr|
            next unless arr.respond_to? :to_ary
            arr = arr.to_ary
            next unless (1..2).include? arr.size
            h[arr.at(0)] = arr.at(1)
          end
          return h
        end
      end

      return old_brackets(*args)
    end
  end
end
