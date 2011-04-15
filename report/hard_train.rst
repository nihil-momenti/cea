Recognising HARD
----------------

The starting version spaces is::

    S: { astigmatic: null,      age: null,      prescription: null,      tear_prod: null       }
    G: { astigmatic: undefined, age: undefined, prescription: undefined, tear_prod: undefined  }
    
The first example is a negative example and covered by ``G``, this causes ``G`` to
be made more specific to no longer cover it::

    Example: {:astigmatic=>:no, :age=>:young, :prescription=>:myope, :tear_prod=>:reduced} ==> none
    Prior Classification: unknown
    After Classification: negative
    ----
    S: { astigmatic: null,      age: null,      prescription: null,      tear_prod: null       }
    G:
      { astigmatic: yes,       age: undefined, prescription: undefined, tear_prod: undefined  }
      { astigmatic: undefined, age: middle,    prescription: undefined, tear_prod: undefined  }
      { astigmatic: undefined, age: old,       prescription: undefined, tear_prod: undefined  }
      { astigmatic: undefined, age: undefined, prescription: hyper,     tear_prod: undefined  }
      { astigmatic: undefined, age: undefined, prescription: undefined, tear_prod: normal     }

The next example is a negative example and covered by ``G`` as well, this causes
``G`` to be made more specific again so it no longer covers it::

    Example: {:astigmatic=>:no, :age=>:young, :prescription=>:myope, :tear_prod=>:normal} ==> soft
    Prior Classification: unknown
    After Classification: negative
    ----
    S: { astigmatic: null,      age: null,      prescription: null,      tear_prod: null       }
    G:
      { astigmatic: yes,       age: undefined, prescription: undefined, tear_prod: undefined  }
      { astigmatic: undefined, age: middle,    prescription: undefined, tear_prod: undefined  }
      { astigmatic: undefined, age: old,       prescription: undefined, tear_prod: undefined  }
      { astigmatic: undefined, age: undefined, prescription: hyper,     tear_prod: undefined  }

Again the example is negative and covered by ``G`` so ``G`` is made more specific::

    Example: {:astigmatic=>:yes, :age=>:young, :prescription=>:myope, :tear_prod=>:reduced} ==> none
    Prior Classification: unknown
    After Classification: negative
    ----
    S: { astigmatic: null,      age: null,      prescription: null,      tear_prod: null       }
    G:
      { astigmatic: undefined, age: middle,    prescription: undefined, tear_prod: undefined  }
      { astigmatic: undefined, age: old,       prescription: undefined, tear_prod: undefined  }
      { astigmatic: undefined, age: undefined, prescription: hyper,     tear_prod: undefined  }
      { astigmatic: yes,       age: undefined, prescription: undefined, tear_prod: normal     }

Finally we get a positive example, this isn't covered by ``S`` so ``S`` is
generalised to cover it.  Then any hypotheses in ``G`` that are inconsistent with
``S`` are removed::

    Example: {:astigmatic=>:yes, :age=>:young, :prescription=>:myope, :tear_prod=>:normal} ==> hard
    Prior Classification: unknown
    After Classification: positive
    ----
    S: { astigmatic: yes,       age: young,     prescription: myope,     tear_prod: normal     }
    G: { astigmatic: yes,       age: undefined, prescription: undefined, tear_prod: normal     }

Nothing changes as these are negative examples consistent with ``G``::

    Example: {:astigmatic=>:no, :age=>:young, :prescription=>:hyper, :tear_prod=>:reduced} ==> none
    Prior Classification: negative
    After Classification: negative
    ----
    S: { astigmatic: yes,       age: young,     prescription: myope,     tear_prod: normal     }
    G: { astigmatic: yes,       age: undefined, prescription: undefined, tear_prod: normal     }

    Example: {:astigmatic=>:no, :age=>:young, :prescription=>:hyper, :tear_prod=>:normal} ==> soft
    Prior Classification: negative
    After Classification: negative
    ----
    S: { astigmatic: yes,       age: young,     prescription: myope,     tear_prod: normal     }
    G: { astigmatic: yes,       age: undefined, prescription: undefined, tear_prod: normal     }

    Example: {:astigmatic=>:yes, :age=>:young, :prescription=>:hyper, :tear_prod=>:reduced} ==> none
    Prior Classification: negative
    After Classification: negative
    ----
    S: { astigmatic: yes,       age: young,     prescription: myope,     tear_prod: normal     }
    G: { astigmatic: yes,       age: undefined, prescription: undefined, tear_prod: normal     }

A new positive example causes ``S`` to be made more general again::

    Example: {:astigmatic=>:yes, :age=>:young, :prescription=>:hyper, :tear_prod=>:normal} ==> hard
    Prior Classification: unknown
    After Classification: positive
    ----
    S: { astigmatic: yes,       age: young,     prescription: undefined, tear_prod: normal     }
    G: { astigmatic: yes,       age: undefined, prescription: undefined, tear_prod: normal     }

And some more negative examples consistent with ``G``::

    Example: {:astigmatic=>:no, :age=>:middle, :prescription=>:myope, :tear_prod=>:reduced} ==> none
    Prior Classification: negative
    After Classification: negative
    ----
    S: { astigmatic: yes,       age: young,     prescription: undefined, tear_prod: normal     }
    G: { astigmatic: yes,       age: undefined, prescription: undefined, tear_prod: normal     }

    Example: {:astigmatic=>:no, :age=>:middle, :prescription=>:myope, :tear_prod=>:normal} ==> soft
    Prior Classification: negative
    After Classification: negative
    ----
    S: { astigmatic: yes,       age: young,     prescription: undefined, tear_prod: normal     }
    G: { astigmatic: yes,       age: undefined, prescription: undefined, tear_prod: normal     }

    Example: {:astigmatic=>:yes, :age=>:middle, :prescription=>:myope, :tear_prod=>:reduced} ==> none
    Prior Classification: negative
    After Classification: negative
    ----
    S: { astigmatic: yes,       age: young,     prescription: undefined, tear_prod: normal     }
    G: { astigmatic: yes,       age: undefined, prescription: undefined, tear_prod: normal     }

A new positive example.  ``S`` is again generalised and is now converged with ``G``.
If the dataset is consistent then nothing will change from here on::

    Example: {:astigmatic=>:yes, :age=>:middle, :prescription=>:myope, :tear_prod=>:normal} ==> hard
    Prior Classification: unknown
    After Classification: positive
    ----
    S: { astigmatic: yes,       age: undefined, prescription: undefined, tear_prod: normal     }
    G: { astigmatic: yes,       age: undefined, prescription: undefined, tear_prod: normal     }

    Example: {:astigmatic=>:no, :age=>:middle, :prescription=>:hyper, :tear_prod=>:reduced} ==> none
    Prior Classification: negative
    After Classification: negative
    ----
    S: { astigmatic: yes,       age: undefined, prescription: undefined, tear_prod: normal     }
    G: { astigmatic: yes,       age: undefined, prescription: undefined, tear_prod: normal     }

    Example: {:astigmatic=>:no, :age=>:middle, :prescription=>:hyper, :tear_prod=>:normal} ==> soft
    Prior Classification: negative
    After Classification: negative
    ----
    S: { astigmatic: yes,       age: undefined, prescription: undefined, tear_prod: normal     }
    G: { astigmatic: yes,       age: undefined, prescription: undefined, tear_prod: normal     }

    Example: {:astigmatic=>:yes, :age=>:middle, :prescription=>:hyper, :tear_prod=>:reduced} ==> none
    Prior Classification: negative
    After Classification: negative
    ----
    S: { astigmatic: yes,       age: undefined, prescription: undefined, tear_prod: normal     }
    G: { astigmatic: yes,       age: undefined, prescription: undefined, tear_prod: normal     }

But wait, the dataset is inconsistent.  This is a negative example and was
covered by ``G`` so ``G`` had to be made more specific.  However this meant that the
only hypothesis in ``S`` had to be removed to make ``S`` consistent with ``G``.
Because it was ``S`` that got wiped out our version space is now only usable for
determining negative examples, there will be no false positives but there can be
false negatives::

    Example: {:astigmatic=>:yes, :age=>:middle, :prescription=>:hyper, :tear_prod=>:normal} ==> none
    Prior Classification: positive
    After Classification: negative
    ----
    S:
    G:
      { astigmatic: yes,       age: young,     prescription: undefined, tear_prod: normal     }
      { astigmatic: yes,       age: old,       prescription: undefined, tear_prod: normal     }
      { astigmatic: yes,       age: undefined, prescription: myope,     tear_prod: normal     }

And we're back to consistent negative examples::

    Example: {:astigmatic=>:no, :age=>:old, :prescription=>:myope, :tear_prod=>:reduced} ==> none
    Prior Classification: negative
    After Classification: negative
    ----
    S:
    G:
      { astigmatic: yes,       age: young,     prescription: undefined, tear_prod: normal     }
      { astigmatic: yes,       age: old,       prescription: undefined, tear_prod: normal     }
      { astigmatic: yes,       age: undefined, prescription: myope,     tear_prod: normal     }

    Example: {:astigmatic=>:yes, :age=>:old, :prescription=>:myope, :tear_prod=>:reduced} ==> none
    Prior Classification: negative
    After Classification: negative
    ----
    S:
    G:
      { astigmatic: yes,       age: young,     prescription: undefined, tear_prod: normal     }
      { astigmatic: yes,       age: old,       prescription: undefined, tear_prod: normal     }
      { astigmatic: yes,       age: undefined, prescription: myope,     tear_prod: normal     }

Until we get to a positive one, notice that even after using this to train the
classification is still unknown because ``S`` is empty::

    Example: {:astigmatic=>:yes, :age=>:old, :prescription=>:myope, :tear_prod=>:normal} ==> hard
    Prior Classification: unknown
    After Classification: unknown
    ----
    S:
    G:
      { astigmatic: yes,       age: old,       prescription: undefined, tear_prod: normal     }
      { astigmatic: yes,       age: undefined, prescription: myope,     tear_prod: normal     }

Three more consistent negative examples::

    Example: {:astigmatic=>:no, :age=>:old, :prescription=>:hyper, :tear_prod=>:reduced} ==> none
    Prior Classification: negative
    After Classification: negative
    ----
    S:
    G:
      { astigmatic: yes,       age: old,       prescription: undefined, tear_prod: normal     }
      { astigmatic: yes,       age: undefined, prescription: myope,     tear_prod: normal     }

    Example: {:astigmatic=>:no, :age=>:old, :prescription=>:hyper, :tear_prod=>:normal} ==> soft
    Prior Classification: negative
    After Classification: negative
    ----
    S:
    G:
      { astigmatic: yes,       age: old,       prescription: undefined, tear_prod: normal     }
      { astigmatic: yes,       age: undefined, prescription: myope,     tear_prod: normal     }

    Example: {:astigmatic=>:yes, :age=>:old, :prescription=>:hyper, :tear_prod=>:reduced} ==> none
    Prior Classification: negative
    After Classification: negative
    ----
    S:
    G:
      { astigmatic: yes,       age: old,       prescription: undefined, tear_prod: normal     }
      { astigmatic: yes,       age: undefined, prescription: myope,     tear_prod: normal     }

And another inconsistent negative example to make ``G`` more specific and probably
increase the number of false negatives::

    Example: {:astigmatic=>:yes, :age=>:old, :prescription=>:hyper, :tear_prod=>:normal} ==> none
    Prior Classification: unknown
    After Classification: negative
    ----
    S:
    G: { astigmatic: yes,       age: undefined, prescription: myope,     tear_prod: normal     }
