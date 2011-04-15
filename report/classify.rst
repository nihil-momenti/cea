The Version Spaces
++++++++++++++++++

Two are converged (soft, none) while hard isn't::

    For case: soft, Version space is:
    S: { astigmatic: no,        age: undefined, prescription: undefined, tear_prod: normal     }
    G: { astigmatic: no,        age: undefined, prescription: undefined, tear_prod: normal     }
    ====
    For case: none, Version space is:
    S: { astigmatic: undefined, age: undefined, prescription: undefined, tear_prod: reduced    }
    G: { astigmatic: undefined, age: undefined, prescription: undefined, tear_prod: reduced    }
    ====
    For case: hard, Version space is:
    S: { astigmatic: yes,       age: young,     prescription: undefined, tear_prod: normal     }
    G: { astigmatic: yes,       age: undefined, prescription: undefined, tear_prod: normal     }

The Classifications
+++++++++++++++++++

The first example is correctly classified as none as that is the only version
space that returned positive::

    For Example: {:astigmatic=>:yes, :age=>:middle, :prescription=>:myope, :tear_prod=>:reduced}
                   => none
    soft (conv) classifies as: negative
    none (conv) classifies as: positive
    hard (unco) classifies as: negative
    Class: none
    
The second example is classified as don't know because only the unconverged
version space returned positive::

    For Example: {:astigmatic=>:yes, :age=>:middle, :prescription=>:myope, :tear_prod=>:normal}
                   => hard
    soft (conv) classifies as: negative
    none (conv) classifies as: negative
    hard (unco) classifies as: unknown
    Class: don't know
    
The third example is correctly classified as only the none version space
returned positive::

    For Example: {:astigmatic=>:no, :age=>:middle, :prescription=>:hyper, :tear_prod=>:reduced}
                   => none
    soft (conv) classifies as: negative
    none (conv) classifies as: positive
    hard (unco) classifies as: negative
    Class: none
    
The fourth example is correctly classified as only the soft version space
returned positive::

    For Example: {:astigmatic=>:no, :age=>:middle, :prescription=>:hyper, :tear_prod=>:normal}
                   => soft
    soft (conv) classifies as: positive
    none (conv) classifies as: negative
    hard (unco) classifies as: negative
    Class: soft
    
The fifth example is correctly classified as only the none version space
returned positive::

    For Example: {:astigmatic=>:yes, :age=>:middle, :prescription=>:hyper, :tear_prod=>:reduced}
                   => none
    soft (conv) classifies as: negative
    none (conv) classifies as: positive
    hard (unco) classifies as: negative
    Class: none
    
The sixth example is classified as don't know as only the hard version space
returned positive (unknown is a weak positive)::

    For Example: {:astigmatic=>:yes, :age=>:middle, :prescription=>:hyper, :tear_prod=>:normal}
                   => none
    soft (conv) classifies as: negative
    none (conv) classifies as: negative
    hard (unco) classifies as: unknown
    Class: don't know
    
The seventh example is correctly classified as only the none version space
returned positive::

    For Example: {:astigmatic=>:no, :age=>:old, :prescription=>:myope, :tear_prod=>:reduced}
                   => none
    soft (conv) classifies as: negative
    none (conv) classifies as: positive
    hard (unco) classifies as: negative
    Class: none
    
The eighth example is correctly classified as only the none version space
returned positive::

    For Example: {:astigmatic=>:yes, :age=>:old, :prescription=>:myope, :tear_prod=>:reduced}
                   => none
    soft (conv) classifies as: negative
    none (conv) classifies as: positive
    hard (unco) classifies as: negative
    Class: none
    
The ninth example is classified as don't know as only the non converged version
space classified it::

    For Example: {:astigmatic=>:yes, :age=>:old, :prescription=>:myope, :tear_prod=>:normal}
                   => hard
    soft (conv) classifies as: negative
    none (conv) classifies as: negative
    hard (unco) classifies as: unknown
    Class: don't know
    
The tenth example is classified correctly since only the none version space
returned positive::

    For Example: {:astigmatic=>:no, :age=>:old, :prescription=>:hyper, :tear_prod=>:reduced}
                   => none
    soft (conv) classifies as: negative
    none (conv) classifies as: positive
    hard (unco) classifies as: negative
    Class: none
    
The eleventh example is classified correctly as only the soft version space
returned positive::

    For Example: {:astigmatic=>:no, :age=>:old, :prescription=>:hyper, :tear_prod=>:normal}
                   => soft
    soft (conv) classifies as: positive
    none (conv) classifies as: negative
    hard (unco) classifies as: negative
    Class: soft
    
The twelfth example is classified correctly as only the none version space
returned positive::

    For Example: {:astigmatic=>:yes, :age=>:old, :prescription=>:hyper, :tear_prod=>:reduced}
                   => none
    soft (conv) classifies as: negative
    none (conv) classifies as: positive
    hard (unco) classifies as: negative
    Class: none
    
The thirteenth example is classified as don't know as only the hard version
space returned positive::

    For Example: {:astigmatic=>:yes, :age=>:old, :prescription=>:hyper, :tear_prod=>:normal}
                   => none
    soft (conv) classifies as: negative
    none (conv) classifies as: negative
    hard (unco) classifies as: unknown
    Class: don't know
    
