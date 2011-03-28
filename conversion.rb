name_map = {
  'L' => ':left',
  'B' => ':balanced',
  'R' => ':right'
}

examples = $<.lines.map do |line|
  a = line.chomp.split(',')
  "[ #{"#{name_map[a[0]]},".ljust 10 } { :left_weight => #{a[1]}, :left_dist => #{a[2]}, :right_weight => #{a[3]}, :right_dist => #{a[4]} } ],"
end.join("\n      ").chomp(',')

puts <<END
  module Balanced
    Attributes = {
      :left_weight  => [ 1, 2, 3, 4, 5 ],
      :left_dist    => [ 1, 2, 3, 4, 5 ],
      :right_weight => [ 1, 2, 3, 4, 5 ],
      :right_dist   => [ 1, 2, 3, 4, 5 ]
    }

    Cases = [ :left, :balanced, :right ]

    Examples = [
      #{examples}
    ]
  end
END
