Initial sets

:
    S:
      { astigmatic: null,      tear_prod: null,      age: null,      prescription: null       }
    G:
      { astigmatic: undefined, tear_prod: undefined, age: undefined, prescription: undefined  }


:
    Example: {:astigmatic=>:no, :tear_prod=>:reduced, :age=>:young, :prescription=>:myope} ==> none
    Prior Classification: unknown
    After Classification: negative
    ----
    S:
      { astigmatic: null,      tear_prod: null,      age: null,      prescription: null       }
    G:
      { astigmatic: yes,       tear_prod: undefined, age: undefined, prescription: undefined  }
      { astigmatic: undefined, tear_prod: normal,    age: undefined, prescription: undefined  }
      { astigmatic: undefined, tear_prod: undefined, age: middle,    prescription: undefined  }
      { astigmatic: undefined, tear_prod: undefined, age: old,       prescription: undefined  }
      { astigmatic: undefined, tear_prod: undefined, age: undefined, prescription: hyper      }



:
    Example: {:astigmatic=>:no, :tear_prod=>:normal, :age=>:young, :prescription=>:myope} ==> soft
    Prior Classification: unknown
    After Classification: positive
    ----
    S:
      { astigmatic: no,        tear_prod: normal,    age: young,     prescription: myope      }
    G:
      { astigmatic: undefined, tear_prod: normal,    age: undefined, prescription: undefined  }



:
    Example: {:astigmatic=>:yes, :tear_prod=>:reduced, :age=>:young, :prescription=>:myope} ==> none
    Prior Classification: negative
    After Classification: negative
    ----
    S:
      { astigmatic: no,        tear_prod: normal,    age: young,     prescription: myope      }
    G:
      { astigmatic: undefined, tear_prod: normal,    age: undefined, prescription: undefined  }



:
    Example: {:astigmatic=>:yes, :tear_prod=>:normal, :age=>:young, :prescription=>:myope} ==> hard
    Prior Classification: unknown
    After Classification: negative
    ----
    S:
      { astigmatic: no,        tear_prod: normal,    age: young,     prescription: myope      }
    G:
      { astigmatic: no,        tear_prod: normal,    age: undefined, prescription: undefined  }
      { astigmatic: undefined, tear_prod: normal,    age: middle,    prescription: undefined  }
      { astigmatic: undefined, tear_prod: normal,    age: old,       prescription: undefined  }
      { astigmatic: undefined, tear_prod: normal,    age: undefined, prescription: hyper      }



:
    Example: {:astigmatic=>:no, :tear_prod=>:reduced, :age=>:young, :prescription=>:hyper} ==> none
    Prior Classification: negative
    After Classification: negative
    ----
    S:
      { astigmatic: no,        tear_prod: normal,    age: young,     prescription: myope      }
    G:
      { astigmatic: no,        tear_prod: normal,    age: undefined, prescription: undefined  }
      { astigmatic: undefined, tear_prod: normal,    age: middle,    prescription: undefined  }
      { astigmatic: undefined, tear_prod: normal,    age: old,       prescription: undefined  }
      { astigmatic: undefined, tear_prod: normal,    age: undefined, prescription: hyper      }



:
    Example: {:astigmatic=>:no, :tear_prod=>:normal, :age=>:young, :prescription=>:hyper} ==> soft
    Prior Classification: unknown
    After Classification: positive
    ----
    S:
      { astigmatic: no,        tear_prod: normal,    age: young,     prescription: undefined  }
    G:
      { astigmatic: no,        tear_prod: normal,    age: undefined, prescription: undefined  }
      { astigmatic: undefined, tear_prod: normal,    age: undefined, prescription: hyper      }



:
    Example: {:astigmatic=>:yes, :tear_prod=>:reduced, :age=>:young, :prescription=>:hyper} ==> none
    Prior Classification: negative
    After Classification: negative
    ----
    S:
      { astigmatic: no,        tear_prod: normal,    age: young,     prescription: undefined  }
    G:
      { astigmatic: no,        tear_prod: normal,    age: undefined, prescription: undefined  }
      { astigmatic: undefined, tear_prod: normal,    age: undefined, prescription: hyper      }



:
    Example: {:astigmatic=>:yes, :tear_prod=>:normal, :age=>:young, :prescription=>:hyper} ==> hard
    Prior Classification: unknown
    After Classification: negative
    ----
    S:
      { astigmatic: no,        tear_prod: normal,    age: young,     prescription: undefined  }
    G:
      { astigmatic: no,        tear_prod: normal,    age: undefined, prescription: undefined  }
      { astigmatic: undefined, tear_prod: normal,    age: middle,    prescription: hyper      }
      { astigmatic: undefined, tear_prod: normal,    age: old,       prescription: hyper      }



:
    Example: {:astigmatic=>:no, :tear_prod=>:reduced, :age=>:middle, :prescription=>:myope} ==> none
    Prior Classification: negative
    After Classification: negative
    ----
    S:
      { astigmatic: no,        tear_prod: normal,    age: young,     prescription: undefined  }
    G:
      { astigmatic: no,        tear_prod: normal,    age: undefined, prescription: undefined  }
      { astigmatic: undefined, tear_prod: normal,    age: middle,    prescription: hyper      }
      { astigmatic: undefined, tear_prod: normal,    age: old,       prescription: hyper      }



:
    Example: {:astigmatic=>:no, :tear_prod=>:normal, :age=>:middle, :prescription=>:myope} ==> soft
    Prior Classification: unknown
    After Classification: positive
    ----
    S:
      { astigmatic: no,        tear_prod: normal,    age: undefined, prescription: undefined  }
    G:
      { astigmatic: no,        tear_prod: normal,    age: undefined, prescription: undefined  }



:
    Example: {:astigmatic=>:yes, :tear_prod=>:reduced, :age=>:middle, :prescription=>:myope} ==> none
    Prior Classification: negative
    After Classification: negative
    ----
    S:
      { astigmatic: no,        tear_prod: normal,    age: undefined, prescription: undefined  }
    G:
      { astigmatic: no,        tear_prod: normal,    age: undefined, prescription: undefined  }



:
    Example: {:astigmatic=>:yes, :tear_prod=>:normal, :age=>:middle, :prescription=>:myope} ==> hard
    Prior Classification: negative
    After Classification: negative
    ----
    S:
      { astigmatic: no,        tear_prod: normal,    age: undefined, prescription: undefined  }
    G:
      { astigmatic: no,        tear_prod: normal,    age: undefined, prescription: undefined  }



:
    Example: {:astigmatic=>:no, :tear_prod=>:reduced, :age=>:middle, :prescription=>:hyper} ==> none
    Prior Classification: negative
    After Classification: negative
    ----
    S:
      { astigmatic: no,        tear_prod: normal,    age: undefined, prescription: undefined  }
    G:
      { astigmatic: no,        tear_prod: normal,    age: undefined, prescription: undefined  }



:
    Example: {:astigmatic=>:no, :tear_prod=>:normal, :age=>:middle, :prescription=>:hyper} ==> soft
    Prior Classification: positive
    After Classification: positive
    ----
    S:
      { astigmatic: no,        tear_prod: normal,    age: undefined, prescription: undefined  }
    G:
      { astigmatic: no,        tear_prod: normal,    age: undefined, prescription: undefined  }



:
    Example: {:astigmatic=>:yes, :tear_prod=>:reduced, :age=>:middle, :prescription=>:hyper} ==> none
    Prior Classification: negative
    After Classification: negative
    ----
    S:
      { astigmatic: no,        tear_prod: normal,    age: undefined, prescription: undefined  }
    G:
      { astigmatic: no,        tear_prod: normal,    age: undefined, prescription: undefined  }



:
    Example: {:astigmatic=>:yes, :tear_prod=>:normal, :age=>:middle, :prescription=>:hyper} ==> none
    Prior Classification: negative
    After Classification: negative
    ----
    S:
      { astigmatic: no,        tear_prod: normal,    age: undefined, prescription: undefined  }
    G:
      { astigmatic: no,        tear_prod: normal,    age: undefined, prescription: undefined  }



:
    Example: {:astigmatic=>:no, :tear_prod=>:reduced, :age=>:old, :prescription=>:myope} ==> none
    Prior Classification: negative
    After Classification: negative
    ----
    S:
      { astigmatic: no,        tear_prod: normal,    age: undefined, prescription: undefined  }
    G:
      { astigmatic: no,        tear_prod: normal,    age: undefined, prescription: undefined  }



:
    Example: {:astigmatic=>:yes, :tear_prod=>:reduced, :age=>:old, :prescription=>:myope} ==> none
    Prior Classification: negative
    After Classification: negative
    ----
    S:
      { astigmatic: no,        tear_prod: normal,    age: undefined, prescription: undefined  }
    G:
      { astigmatic: no,        tear_prod: normal,    age: undefined, prescription: undefined  }



:
    Example: {:astigmatic=>:yes, :tear_prod=>:normal, :age=>:old, :prescription=>:myope} ==> hard
    Prior Classification: negative
    After Classification: negative
    ----
    S:
      { astigmatic: no,        tear_prod: normal,    age: undefined, prescription: undefined  }
    G:
      { astigmatic: no,        tear_prod: normal,    age: undefined, prescription: undefined  }



:
    Example: {:astigmatic=>:no, :tear_prod=>:reduced, :age=>:old, :prescription=>:hyper} ==> none
    Prior Classification: negative
    After Classification: negative
    ----
    S:
      { astigmatic: no,        tear_prod: normal,    age: undefined, prescription: undefined  }
    G:
      { astigmatic: no,        tear_prod: normal,    age: undefined, prescription: undefined  }



:
    Example: {:astigmatic=>:no, :tear_prod=>:normal, :age=>:old, :prescription=>:hyper} ==> soft
    Prior Classification: positive
    After Classification: positive
    ----
    S:
      { astigmatic: no,        tear_prod: normal,    age: undefined, prescription: undefined  }
    G:
      { astigmatic: no,        tear_prod: normal,    age: undefined, prescription: undefined  }



:
    Example: {:astigmatic=>:yes, :tear_prod=>:reduced, :age=>:old, :prescription=>:hyper} ==> none
    Prior Classification: negative
    After Classification: negative
    ----
    S:
      { astigmatic: no,        tear_prod: normal,    age: undefined, prescription: undefined  }
    G:
      { astigmatic: no,        tear_prod: normal,    age: undefined, prescription: undefined  }



:
    Example: {:astigmatic=>:yes, :tear_prod=>:normal, :age=>:old, :prescription=>:hyper} ==> none
    Prior Classification: negative
    After Classification: negative
    ----
    S:
      { astigmatic: no,        tear_prod: normal,    age: undefined, prescription: undefined  }
    G:
      { astigmatic: no,        tear_prod: normal,    age: undefined, prescription: undefined  }
