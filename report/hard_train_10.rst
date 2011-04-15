Recognising HARD with just 10 examples
--------------------------------------

The starting version space::

    S: { astigmatic: null,      age: null,      prescription: null,      tear_prod: null       }
    G: { astigmatic: undefined, age: undefined, prescription: undefined, tear_prod: undefined  }
    
The examples are exactly the same as the first 10 in `Recognising HARD`_::

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

    Example: {:astigmatic=>:yes, :age=>:young, :prescription=>:myope, :tear_prod=>:normal} ==> hard
    Prior Classification: unknown
    After Classification: positive
    ----
    S: { astigmatic: yes,       age: young,     prescription: myope,     tear_prod: normal     }
    G: { astigmatic: yes,       age: undefined, prescription: undefined, tear_prod: normal     }

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

    Example: {:astigmatic=>:yes, :age=>:young, :prescription=>:hyper, :tear_prod=>:normal} ==> hard
    Prior Classification: unknown
    After Classification: positive
    ----
    S: { astigmatic: yes,       age: young,     prescription: undefined, tear_prod: normal     }
    G: { astigmatic: yes,       age: undefined, prescription: undefined, tear_prod: normal     }

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

The final version space is not converged, this means that there are three
possible outputs from classification:

+--------------+-------------------------------------------------------------------+
| **positive** | If the example is covered by `S` it is definitely positive.       |
+--------------+-------------------------------------------------------------------+
| **unknown**  | If the example is consistent with `G` but is not covered by `S`   |
|              | then it is unknown, in this case this is only 4 examples: the     |
|              | ones with astigmatic: yes, age: old or middle, prescription:      |
|              | either and tear_prod: normal.                                     |
|              |                                                                   |
|              | This case is assumed to be a weak positive.                       |
+--------------+-------------------------------------------------------------------+
| **negative** | If the example is inconsistent with `G` then it is negative.      |
+--------------+-------------------------------------------------------------------+
