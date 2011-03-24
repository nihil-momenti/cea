dir = File.join File.dirname(__FILE__), 'cea'

%w{
  hypothesis
  example
  algorithm
}.map { |file| File.join dir, file }.each do |file|
  require file
end
