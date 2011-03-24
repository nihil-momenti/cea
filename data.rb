module Assignment
  module Data
    Attributes = {
      :age          => [ :young, :middle, :old ],
      :prescription => [ :myope, :hyper ],
      :astigmatic   => [ :no, :yes ],
      :tear_prod    => [ :reduced, :normal ]
    }

    Examples = [
      [ :none, { :age => :young,  :prescription => :myope, :astigmatic => :no,  :tear_prod => :reduced } ],
      [ :soft, { :age => :young,  :prescription => :myope, :astigmatic => :no,  :tear_prod => :normal  } ],
      [ :none, { :age => :young,  :prescription => :myope, :astigmatic => :yes, :tear_prod => :reduced } ],
      [ :hard, { :age => :young,  :prescription => :myope, :astigmatic => :yes, :tear_prod => :normal  } ],
      [ :none, { :age => :young,  :prescription => :hyper, :astigmatic => :no,  :tear_prod => :reduced } ],
      [ :soft, { :age => :young,  :prescription => :hyper, :astigmatic => :no,  :tear_prod => :normal  } ],
      [ :none, { :age => :young,  :prescription => :hyper, :astigmatic => :yes, :tear_prod => :reduced } ],
      [ :hard, { :age => :young,  :prescription => :hyper, :astigmatic => :yes, :tear_prod => :normal  } ],
      [ :none, { :age => :middle, :prescription => :myope, :astigmatic => :no,  :tear_prod => :reduced } ],
      [ :soft, { :age => :middle, :prescription => :myope, :astigmatic => :no,  :tear_prod => :normal  } ],
    
      [ :none, { :age => :middle, :prescription => :myope, :astigmatic => :yes, :tear_prod => :reduced } ],
      [ :hard, { :age => :middle, :prescription => :myope, :astigmatic => :yes, :tear_prod => :normal  } ],
      [ :none, { :age => :middle, :prescription => :hyper, :astigmatic => :no,  :tear_prod => :reduced } ],
      [ :soft, { :age => :middle, :prescription => :hyper, :astigmatic => :no,  :tear_prod => :normal  } ],
      [ :none, { :age => :middle, :prescription => :hyper, :astigmatic => :yes, :tear_prod => :reduced } ],
      [ :none, { :age => :middle, :prescription => :hyper, :astigmatic => :yes, :tear_prod => :normal  } ],
      [ :none, { :age => :old,    :prescription => :myope, :astigmatic => :no,  :tear_prod => :reduced } ],
      [ :none, { :age => :old,    :prescription => :myope, :astigmatic => :yes, :tear_prod => :reduced } ],
      [ :hard, { :age => :old,    :prescription => :myope, :astigmatic => :yes, :tear_prod => :normal  } ],
      [ :none, { :age => :old,    :prescription => :hyper, :astigmatic => :no,  :tear_prod => :reduced } ],
      [ :soft, { :age => :old,    :prescription => :hyper, :astigmatic => :no,  :tear_prod => :normal  } ],
      [ :none, { :age => :old,    :prescription => :hyper, :astigmatic => :yes, :tear_prod => :reduced } ],
      [ :none, { :age => :old,    :prescription => :hyper, :astigmatic => :yes, :tear_prod => :normal  } ]
    ]
  end
end
