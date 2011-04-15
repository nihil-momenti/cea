Recognising NONE with just 10 examples
--------------------------------------

The starting version space::

    S: { astigmatic: null,      age: null,      prescription: null,      tear_prod: null       }
    G: { astigmatic: undefined, age: undefined, prescription: undefined, tear_prod: undefined  }
    
The examples are exactly the same as the first 10 in `Recognising NONE`_::

    Example: {:astigmatic=>:no, :age=>:young, :prescription=>:myope, :tear_prod=>:reduced} ==> none
    Prior Classification: unknown
    After Classification: positive
    ----
    S: { astigmatic: no,        age: young,     prescription: myope,     tear_prod: reduced    }
    G: { astigmatic: undefined, age: undefined, prescription: undefined, tear_prod: undefined  }

    Example: {:astigmatic=>:no, :age=>:young, :prescription=>:myope, :tear_prod=>:normal} ==> soft
    Prior Classification: unknown
    After Classification: negative
    ----
    S: { astigmatic: no,        age: young,     prescription: myope,     tear_prod: reduced    }
    G:
      { astigmatic: yes,       age: undefined, prescription: undefined, tear_prod: undefined  }
      { astigmatic: undefined, age: middle,    prescription: undefined, tear_prod: undefined  }
      { astigmatic: undefined, age: old,       prescription: undefined, tear_prod: undefined  }
      { astigmatic: undefined, age: undefined, prescription: hyper,     tear_prod: undefined  }
      { astigmatic: undefined, age: undefined, prescription: undefined, tear_prod: reduced    }

    Example: {:astigmatic=>:yes, :age=>:young, :prescription=>:myope, :tear_prod=>:reduced} ==> none
    Prior Classification: unknown
    After Classification: positive
    ----
    S: { astigmatic: undefined, age: young,     prescription: myope,     tear_prod: reduced    }
    G:
      { astigmatic: yes,       age: undefined, prescription: undefined, tear_prod: undefined  }
      { astigmatic: undefined, age: undefined, prescription: undefined, tear_prod: reduced    }

    Example: {:astigmatic=>:yes, :age=>:young, :prescription=>:myope, :tear_prod=>:normal} ==> hard
    Prior Classification: unknown
    After Classification: negative
    ----
    S: { astigmatic: undefined, age: young,     prescription: myope,     tear_prod: reduced    }
    G:
      { astigmatic: undefined, age: undefined, prescription: undefined, tear_prod: reduced    }
      { astigmatic: yes,       age: middle,    prescription: undefined, tear_prod: undefined  }
      { astigmatic: yes,       age: old,       prescription: undefined, tear_prod: undefined  }
      { astigmatic: yes,       age: undefined, prescription: hyper,     tear_prod: undefined  }

    Example: {:astigmatic=>:no, :age=>:young, :prescription=>:hyper, :tear_prod=>:reduced} ==> none
    Prior Classification: unknown
    After Classification: positive
    ----
    S: { astigmatic: undefined, age: young,     prescription: undefined, tear_prod: reduced    }
    G: { astigmatic: undefined, age: undefined, prescription: undefined, tear_prod: reduced    }

    Example: {:astigmatic=>:no, :age=>:young, :prescription=>:hyper, :tear_prod=>:normal} ==> soft
    Prior Classification: negative
    After Classification: negative
    ----
    S: { astigmatic: undefined, age: young,     prescription: undefined, tear_prod: reduced    }
    G: { astigmatic: undefined, age: undefined, prescription: undefined, tear_prod: reduced    }

    Example: {:astigmatic=>:yes, :age=>:young, :prescription=>:hyper, :tear_prod=>:reduced} ==> none
    Prior Classification: positive
    After Classification: positive
    ----
    S: { astigmatic: undefined, age: young,     prescription: undefined, tear_prod: reduced    }
    G: { astigmatic: undefined, age: undefined, prescription: undefined, tear_prod: reduced    }

    Example: {:astigmatic=>:yes, :age=>:young, :prescription=>:hyper, :tear_prod=>:normal} ==> hard
    Prior Classification: negative
    After Classification: negative
    ----
    S: { astigmatic: undefined, age: young,     prescription: undefined, tear_prod: reduced    }
    G: { astigmatic: undefined, age: undefined, prescription: undefined, tear_prod: reduced    }

    Example: {:astigmatic=>:no, :age=>:middle, :prescription=>:myope, :tear_prod=>:reduced} ==> none
    Prior Classification: unknown
    After Classification: positive
    ----
    S: { astigmatic: undefined, age: undefined, prescription: undefined, tear_prod: reduced    }
    G: { astigmatic: undefined, age: undefined, prescription: undefined, tear_prod: reduced    }

    Example: {:astigmatic=>:no, :age=>:middle, :prescription=>:myope, :tear_prod=>:normal} ==> soft
    Prior Classification: negative
    After Classification: negative
    ----
    S: { astigmatic: undefined, age: undefined, prescription: undefined, tear_prod: reduced    }
    G: { astigmatic: undefined, age: undefined, prescription: undefined, tear_prod: reduced    }

This version space has ended up converged so any example that is covered by
``S``/``G`` will be classified as positive and any that is inconsistent will be
negative.
