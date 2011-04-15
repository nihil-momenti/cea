Recognising NONE
----------------

The starting version space is::

    S: { astigmatic: null,      age: null,      prescription: null,      tear_prod: null       }
    G: { astigmatic: undefined, age: undefined, prescription: undefined, tear_prod: undefined  }

The first example is positive and not covered by ``S`` so ``S`` is made more general
to cover it::
    
    Example: {:astigmatic=>:no, :age=>:young, :prescription=>:myope, :tear_prod=>:reduced} ==> none
    Prior Classification: unknown
    After Classification: positive
    ----
    S: { astigmatic: no,        age: young,     prescription: myope,     tear_prod: reduced    }
    G: { astigmatic: undefined, age: undefined, prescription: undefined, tear_prod: undefined  }

The next example is negative and inconsistent with ``G`` so ``G`` is made more
specific to not cover it::

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

Another positive example not covered by ``S`` causes ``S`` to be made more
general and inconsistent hypotheses from ``G`` to be removed::

    Example: {:astigmatic=>:yes, :age=>:young, :prescription=>:myope, :tear_prod=>:reduced} ==> none
    Prior Classification: unknown
    After Classification: positive
    ----
    S: { astigmatic: undefined, age: young,     prescription: myope,     tear_prod: reduced    }
    G:
      { astigmatic: yes,       age: undefined, prescription: undefined, tear_prod: undefined  }
      { astigmatic: undefined, age: undefined, prescription: undefined, tear_prod: reduced    }

A negative example inconsistent with ``G`` makes ``G`` more specific::

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

A positive example not covered by ``S`` so ``S`` is made more general and
inconsistent hypotheses from ``G`` are removed::

    Example: {:astigmatic=>:no, :age=>:young, :prescription=>:hyper, :tear_prod=>:reduced} ==> none
    Prior Classification: unknown
    After Classification: positive
    ----
    S: { astigmatic: undefined, age: young,     prescription: undefined, tear_prod: reduced    }
    G: { astigmatic: undefined, age: undefined, prescription: undefined, tear_prod: reduced    }

Some negative examples consistent with ``G`` and positive examples covered by ``S``
so nothing changes::

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

A positive example not covered by ``S`` so ``S`` is made more general.  ``S`` and ``G``
are now converged::

    Example: {:astigmatic=>:no, :age=>:middle, :prescription=>:myope, :tear_prod=>:reduced} ==> none
    Prior Classification: unknown
    After Classification: positive
    ----
    S: { astigmatic: undefined, age: undefined, prescription: undefined, tear_prod: reduced    }
    G: { astigmatic: undefined, age: undefined, prescription: undefined, tear_prod: reduced    }

Some more negative/consistent and positive/covered examples::

    Example: {:astigmatic=>:no, :age=>:middle, :prescription=>:myope, :tear_prod=>:normal} ==> soft
    Prior Classification: negative
    After Classification: negative
    ----
    S: { astigmatic: undefined, age: undefined, prescription: undefined, tear_prod: reduced    }
    G: { astigmatic: undefined, age: undefined, prescription: undefined, tear_prod: reduced    }

    Example: {:astigmatic=>:yes, :age=>:middle, :prescription=>:myope, :tear_prod=>:reduced} ==> none
    Prior Classification: positive
    After Classification: positive
    ----
    S: { astigmatic: undefined, age: undefined, prescription: undefined, tear_prod: reduced    }
    G: { astigmatic: undefined, age: undefined, prescription: undefined, tear_prod: reduced    }

    Example: {:astigmatic=>:yes, :age=>:middle, :prescription=>:myope, :tear_prod=>:normal} ==> hard
    Prior Classification: negative
    After Classification: negative
    ----
    S: { astigmatic: undefined, age: undefined, prescription: undefined, tear_prod: reduced    }
    G: { astigmatic: undefined, age: undefined, prescription: undefined, tear_prod: reduced    }

    Example: {:astigmatic=>:no, :age=>:middle, :prescription=>:hyper, :tear_prod=>:reduced} ==> none
    Prior Classification: positive
    After Classification: positive
    ----
    S: { astigmatic: undefined, age: undefined, prescription: undefined, tear_prod: reduced    }
    G: { astigmatic: undefined, age: undefined, prescription: undefined, tear_prod: reduced    }

    Example: {:astigmatic=>:no, :age=>:middle, :prescription=>:hyper, :tear_prod=>:normal} ==> soft
    Prior Classification: negative
    After Classification: negative
    ----
    S: { astigmatic: undefined, age: undefined, prescription: undefined, tear_prod: reduced    }
    G: { astigmatic: undefined, age: undefined, prescription: undefined, tear_prod: reduced    }

    Example: {:astigmatic=>:yes, :age=>:middle, :prescription=>:hyper, :tear_prod=>:reduced} ==> none
    Prior Classification: positive
    After Classification: positive
    ----
    S: { astigmatic: undefined, age: undefined, prescription: undefined, tear_prod: reduced    }
    G: { astigmatic: undefined, age: undefined, prescription: undefined, tear_prod: reduced    }
    Example: {:astigmatic=>:yes, :age=>:middle, :prescription=>:hyper, :tear_prod=>:normal} ==> none

And we hit an inconsistency, a positive examples that is not covered by ``G`` or
``S``.  To fix this ``S`` is made more general and ``G`` is blanked out as it was
inconsistent with the new ``S``::

    Prior Classification: negative
    After Classification: positive
    ----
    S: { astigmatic: undefined, age: undefined, prescription: undefined, tear_prod: undefined  }
    G:
    
    Example: {:astigmatic=>:no, :age=>:old, :prescription=>:myope, :tear_prod=>:reduced} ==> none
    Prior Classification: positive
    After Classification: positive
    ----
    S: { astigmatic: undefined, age: undefined, prescription: undefined, tear_prod: undefined  }
    G:
    
    Example: {:astigmatic=>:yes, :age=>:old, :prescription=>:myope, :tear_prod=>:reduced} ==> none
    Prior Classification: positive
    After Classification: positive
    ----
    S: { astigmatic: undefined, age: undefined, prescription: undefined, tear_prod: undefined  }
    G:

And another inconsistency, a negative example that is now covered by ``S``.  This
causes the offending hypothesis to be removed from ``S`` making this version space
useless.  With how the classification is set up this will now simply return
negative for all examples::

    Example: {:astigmatic=>:yes, :age=>:old, :prescription=>:myope, :tear_prod=>:normal} ==> hard
    Prior Classification: positive
    After Classification: negative
    ----
    S: 
    G:
    
    Example: {:astigmatic=>:no, :age=>:old, :prescription=>:hyper, :tear_prod=>:reduced} ==> none
    Prior Classification: negative
    After Classification: negative
    ----
    S: 
    G:
    
    Example: {:astigmatic=>:no, :age=>:old, :prescription=>:hyper, :tear_prod=>:normal} ==> soft
    Prior Classification: negative
    After Classification: negative
    ----
    S: 
    G:
    
    Example: {:astigmatic=>:yes, :age=>:old, :prescription=>:hyper, :tear_prod=>:reduced} ==> none
    Prior Classification: negative
    After Classification: negative
    ----
    S: 
    G:
    
    Example: {:astigmatic=>:yes, :age=>:old, :prescription=>:hyper, :tear_prod=>:normal} ==> none
    Prior Classification: negative
    After Classification: negative
    ----
    S: 
    G:
    
