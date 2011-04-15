Recognising SOFT
----------------

The starting version space is::

    S: { astigmatic: null,      tear_prod: null,      age: null,      prescription: null       }
    G: { astigmatic: undefined, tear_prod: undefined, age: undefined, prescription: undefined  }

The first example is a negative example and is covered by ``G``.  This causes ``G``
to be made more specific to ensure the case is no longer covered::

    Example: {:astigmatic=>:no, :tear_prod=>:reduced, :age=>:young, :prescription=>:myope} ==> none
    Prior Classification: unknown
    After Classification: negative
    ----
    S: { astigmatic: null,      tear_prod: null,      age: null,      prescription: null       }
    G:
      { astigmatic: yes,       tear_prod: undefined, age: undefined, prescription: undefined  }
      { astigmatic: undefined, tear_prod: normal,    age: undefined, prescription: undefined  }
      { astigmatic: undefined, tear_prod: undefined, age: middle,    prescription: undefined  }
      { astigmatic: undefined, tear_prod: undefined, age: old,       prescription: undefined  }
      { astigmatic: undefined, tear_prod: undefined, age: undefined, prescription: hyper      }

The next example is positive and is not covered by ``S``.  This causes ``S`` to be
made more general to include the example and ``G`` to have all hypotheses that do
not cover the new ``S`` to be removed::

    Example: {:astigmatic=>:no, :tear_prod=>:normal, :age=>:young, :prescription=>:myope} ==> soft
    Prior Classification: unknown
    After Classification: positive
    ----
    S: { astigmatic: no,        tear_prod: normal,    age: young,     prescription: myope      }
    G: { astigmatic: undefined, tear_prod: normal,    age: undefined, prescription: undefined  }

The next example is negative and is consistent with ``G`` so the version space
does not change::

    Example: {:astigmatic=>:yes, :tear_prod=>:reduced, :age=>:young, :prescription=>:myope} ==> none
    Prior Classification: negative
    After Classification: negative
    ----
    S: { astigmatic: no,        tear_prod: normal,    age: young,     prescription: myope      }
    G: { astigmatic: undefined, tear_prod: normal,    age: undefined, prescription: undefined  }

The next example is negative and is inconsistent with ``G``.  This causes ``G`` to
again be made more specific to not cover the example::

    Example: {:astigmatic=>:yes, :tear_prod=>:normal, :age=>:young, :prescription=>:myope} ==> hard
    Prior Classification: unknown
    After Classification: negative
    ----
    S: { astigmatic: no,        tear_prod: normal,    age: young,     prescription: myope      }
    G:
      { astigmatic: no,        tear_prod: normal,    age: undefined, prescription: undefined  }
      { astigmatic: undefined, tear_prod: normal,    age: middle,    prescription: undefined  }
      { astigmatic: undefined, tear_prod: normal,    age: old,       prescription: undefined  }
      { astigmatic: undefined, tear_prod: normal,    age: undefined, prescription: hyper      }

The next example is negative and consistent with ``G`` so nothing changes::

    Example: {:astigmatic=>:no, :tear_prod=>:reduced, :age=>:young, :prescription=>:hyper} ==> none
    Prior Classification: negative
    After Classification: negative
    ----
    S: { astigmatic: no,        tear_prod: normal,    age: young,     prescription: myope      }
    G:
      { astigmatic: no,        tear_prod: normal,    age: undefined, prescription: undefined  }
      { astigmatic: undefined, tear_prod: normal,    age: middle,    prescription: undefined  }
      { astigmatic: undefined, tear_prod: normal,    age: old,       prescription: undefined  }
      { astigmatic: undefined, tear_prod: normal,    age: undefined, prescription: hyper      }

The next example is positive and not covered by ``S`` so ``S`` is made more general
and the inconsistent hypotheses in ``G`` are removed::

    Example: {:astigmatic=>:no, :tear_prod=>:normal, :age=>:young, :prescription=>:hyper} ==> soft
    Prior Classification: unknown
    After Classification: positive
    ----
    S: { astigmatic: no,        tear_prod: normal,    age: young,     prescription: undefined  }
    G:
      { astigmatic: no,        tear_prod: normal,    age: undefined, prescription: undefined  }
      { astigmatic: undefined, tear_prod: normal,    age: undefined, prescription: hyper      }

The next example is negative and consistent with ``G`` so nothing changes::

    Example: {:astigmatic=>:yes, :tear_prod=>:reduced, :age=>:young, :prescription=>:hyper} ==> none
    Prior Classification: negative
    After Classification: negative
    ----
    S: { astigmatic: no,        tear_prod: normal,    age: young,     prescription: undefined  }
    G:
      { astigmatic: no,        tear_prod: normal,    age: undefined, prescription: undefined  }
      { astigmatic: undefined, tear_prod: normal,    age: undefined, prescription: hyper      }

The next example is negative and inconsistent with ``G`` so ``G`` is made more
specific::

    Example: {:astigmatic=>:yes, :tear_prod=>:normal, :age=>:young, :prescription=>:hyper} ==> hard
    Prior Classification: unknown
    After Classification: negative
    ----
    S: { astigmatic: no,        tear_prod: normal,    age: young,     prescription: undefined  }
    G:
      { astigmatic: no,        tear_prod: normal,    age: undefined, prescription: undefined  }
      { astigmatic: undefined, tear_prod: normal,    age: middle,    prescription: hyper      }
      { astigmatic: undefined, tear_prod: normal,    age: old,       prescription: hyper      }

The next example is negative and consistent with ``G`` so the version space stays
the same::

    Example: {:astigmatic=>:no, :tear_prod=>:reduced, :age=>:middle, :prescription=>:myope} ==> none
    Prior Classification: negative
    After Classification: negative
    ----
    S: { astigmatic: no,        tear_prod: normal,    age: young,     prescription: undefined  }
    G:
      { astigmatic: no,        tear_prod: normal,    age: undefined, prescription: undefined  }
      { astigmatic: undefined, tear_prod: normal,    age: middle,    prescription: hyper      }
      { astigmatic: undefined, tear_prod: normal,    age: old,       prescription: hyper      }

The next example is positive and not covered by ``S`` so ``S`` is generalised and
inconsistent hypotheses from ``G`` are removed.  After this ``S`` and ``G`` only
contain the same hypothesis so this version space has converged.  Assuming the
examples are consistent then neither ``S`` nor ``G`` will change from now on::

    Example: {:astigmatic=>:no, :tear_prod=>:normal, :age=>:middle, :prescription=>:myope} ==> soft
    Prior Classification: unknown
    After Classification: positive
    ----
    S: { astigmatic: no,        tear_prod: normal,    age: undefined, prescription: undefined  }
    G: { astigmatic: no,        tear_prod: normal,    age: undefined, prescription: undefined  }

::

    Example: {:astigmatic=>:yes, :tear_prod=>:reduced, :age=>:middle, :prescription=>:myope} ==> none
    Prior Classification: negative
    After Classification: negative
    ----
    S: { astigmatic: no,        tear_prod: normal,    age: undefined, prescription: undefined  }
    G: { astigmatic: no,        tear_prod: normal,    age: undefined, prescription: undefined  }



::

    Example: {:astigmatic=>:yes, :tear_prod=>:normal, :age=>:middle, :prescription=>:myope} ==> hard
    Prior Classification: negative
    After Classification: negative
    ----
    S: { astigmatic: no,        tear_prod: normal,    age: undefined, prescription: undefined  }
    G: { astigmatic: no,        tear_prod: normal,    age: undefined, prescription: undefined  }



::

    Example: {:astigmatic=>:no, :tear_prod=>:reduced, :age=>:middle, :prescription=>:hyper} ==> none
    Prior Classification: negative
    After Classification: negative
    ----
    S: { astigmatic: no,        tear_prod: normal,    age: undefined, prescription: undefined  }
    G: { astigmatic: no,        tear_prod: normal,    age: undefined, prescription: undefined  }



::

    Example: {:astigmatic=>:no, :tear_prod=>:normal, :age=>:middle, :prescription=>:hyper} ==> soft
    Prior Classification: positive
    After Classification: positive
    ----
    S: { astigmatic: no,        tear_prod: normal,    age: undefined, prescription: undefined  }
    G: { astigmatic: no,        tear_prod: normal,    age: undefined, prescription: undefined  }



::

    Example: {:astigmatic=>:yes, :tear_prod=>:reduced, :age=>:middle, :prescription=>:hyper} ==> none
    Prior Classification: negative
    After Classification: negative
    ----
    S: { astigmatic: no,        tear_prod: normal,    age: undefined, prescription: undefined  }
    G: { astigmatic: no,        tear_prod: normal,    age: undefined, prescription: undefined  }



::

    Example: {:astigmatic=>:yes, :tear_prod=>:normal, :age=>:middle, :prescription=>:hyper} ==> none
    Prior Classification: negative
    After Classification: negative
    ----
    S: { astigmatic: no,        tear_prod: normal,    age: undefined, prescription: undefined  }
    G: { astigmatic: no,        tear_prod: normal,    age: undefined, prescription: undefined  }



::

    Example: {:astigmatic=>:no, :tear_prod=>:reduced, :age=>:old, :prescription=>:myope} ==> none
    Prior Classification: negative
    After Classification: negative
    ----
    S: { astigmatic: no,        tear_prod: normal,    age: undefined, prescription: undefined  }
    G: { astigmatic: no,        tear_prod: normal,    age: undefined, prescription: undefined  }



::

    Example: {:astigmatic=>:yes, :tear_prod=>:reduced, :age=>:old, :prescription=>:myope} ==> none
    Prior Classification: negative
    After Classification: negative
    ----
    S: { astigmatic: no,        tear_prod: normal,    age: undefined, prescription: undefined  }
    G: { astigmatic: no,        tear_prod: normal,    age: undefined, prescription: undefined  }



::

    Example: {:astigmatic=>:yes, :tear_prod=>:normal, :age=>:old, :prescription=>:myope} ==> hard
    Prior Classification: negative
    After Classification: negative
    ----
    S: { astigmatic: no,        tear_prod: normal,    age: undefined, prescription: undefined  }
    G: { astigmatic: no,        tear_prod: normal,    age: undefined, prescription: undefined  }



::

    Example: {:astigmatic=>:no, :tear_prod=>:reduced, :age=>:old, :prescription=>:hyper} ==> none
    Prior Classification: negative
    After Classification: negative
    ----
    S: { astigmatic: no,        tear_prod: normal,    age: undefined, prescription: undefined  }
    G: { astigmatic: no,        tear_prod: normal,    age: undefined, prescription: undefined  }



::

    Example: {:astigmatic=>:no, :tear_prod=>:normal, :age=>:old, :prescription=>:hyper} ==> soft
    Prior Classification: positive
    After Classification: positive
    ----
    S: { astigmatic: no,        tear_prod: normal,    age: undefined, prescription: undefined  }
    G: { astigmatic: no,        tear_prod: normal,    age: undefined, prescription: undefined  }



::

    Example: {:astigmatic=>:yes, :tear_prod=>:reduced, :age=>:old, :prescription=>:hyper} ==> none
    Prior Classification: negative
    After Classification: negative
    ----
    S: { astigmatic: no,        tear_prod: normal,    age: undefined, prescription: undefined  }
    G: { astigmatic: no,        tear_prod: normal,    age: undefined, prescription: undefined  }



::

    Example: {:astigmatic=>:yes, :tear_prod=>:normal, :age=>:old, :prescription=>:hyper} ==> none
    Prior Classification: negative
    After Classification: negative
    ----
    S: { astigmatic: no,        tear_prod: normal,    age: undefined, prescription: undefined  }
    G: { astigmatic: no,        tear_prod: normal,    age: undefined, prescription: undefined  }
