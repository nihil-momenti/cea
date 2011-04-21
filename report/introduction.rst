Introduction
||||||||||||

Mitchell's candidate elimination algorithm (CEA) is an induction based system
for learning a set of data and utilising this trained system for classifying new
data.

The main concept in CEA is the version space, this is a set of hypotheses
bounded by two sets, the general set (G) and the specific set (S).  G contains
the most general hypotheses that are consistent with the previously seen
negative examples; while S contains the most specific hypotheses that cover all
of the previously seen positive examples.

This generality and specificity introduce one important constraint on the
hypothesis space of any problem that CEA is used to solve, it must be possible
to say whether one hypothesis is more general or more specific than another and
to be able to generate the set of more specific/general hypotheses from a single
hypothesis.

Because of this constraint the hypothesis space can be viewed as a lattice, each
hypothesis has a set of hypotheses that are one step more specific and a set of
hypotheses that are one step more general.  In the following implementation
these are named descendant and ancestor hypotheses respectively.

To derive this version space from the training set a very simple algorithm can be
used, this is very similar to the algorithm described in the handout with just a
slight change to how hypotheses are generalised and specialised to better fit
the data structure chosen, the overall result is identical:

 1. Initialize set S to ``(null, null, ..., null)``, set G to ``(undefined, undefined, ..., undefined)``
 #. For each positive example *d*:
      a. Remove from G any hypothesis that fails to cover *d*
      #. While there is at least one hypothesis in S that fails to cover *d*:
           i. Remove all hypotheses *s* in S that fail to cover *d*
           #. Add all ancestors of each hypothesis *s* to S
           #. Remove from S any hypothesis that is more general than another in S
 #. For each negative example *d*:
      a. Remove from S any hypothesis inconsistent with *d*
      #. While there is at least one hypothesis in G that is not consistent with *d*:
           i. Remove all hypotheses *g* in G that are not consistent with *d*
           #. Add all descendants of each hypothesis *g* to G
           #. Remove from G any hypothesis that is more specific than another in G

The largest change with this algorithm is in performance.  The original
algorithm removed hypotheses that do not cover/are inconsistent with the example
while generalising/specialising the sets.  This version keeps generalising and
specialising these hypotheses until they are consistent, they will then be
removed from the set as they are just a more general/specific version of one of
the other hypotheses in the set.
