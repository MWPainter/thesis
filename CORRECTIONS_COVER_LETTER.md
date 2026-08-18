# Corrections Cover Letter

Corrections are highlighted in blue throughout the thesis. This document is to outline how the thesis has been updated for each correction.

## In Progress TODOs

- Proof read appendix D with claude
    - Clean up brain dumps and todos
- Make sure Section 4.5 is consistent with appendix D
- claude proof read the sentences containing \mccorrect and new paragraphs with \begin{mccorrection} ... \end{mccorrection}
- Check no \todo and \bd are left (search + delete macro)
- Read through the corrections as given + check this doc consistent
    - Quotes are as given in the word doc
    - Check that page references are correct at the end (because might have moved due to further changes made later)
        - ctrl-f "page" in this doc

## Actual Cover Letter

> Refers to “the standard objective” which could mean multiple things, suggest e.g. “standard objective of maximising expected return”.

- Appears twice in the abstract, updated in the first instance as suggested and left second instance to avoid redundancy in the same paragraph.
- Additionally updated in three places in Chapter 1 (pages 3, 4 and 6), and in two places in Chapter 7 (pages 167 and 169)
- TODO: CH2 NEEDS MORE CARE
- TODO: CH4, add references to \label{def:2:rl_obj_fn} for standard objective and \label{def:2:soft_rl_obj_fn} for max entropy objective

> P2: Explain clearly the multi-objective setting, including what is known when, and how this interacts with on-line planning with MCTS methods. Consider using the unknown weights scenario instead of decision support as motivation.

TODO

> P3: either here or elsewhere justify the choice of linear utility function and discuss whether any of the work could be applied to decision support scenarios where the utilites are non-linear or better expressed as preference functions

TODO



> P12: Explain which of these bounds is better and why. Give some intuition about simple regret bounds, what constitutes a good bound, etc.


> P13: “States are sampled according to a transition distribution that depends only on the current state and current action being taken (the Markov assumption).”


> P15: In a finite-horizon MDP, the policy needs to condition on the timestep (as do the value functions defined later).


> P17: It’s confusing to include RL here. You’re just doing sample-based on-line planning.

> P18: “The optimal policy is the policy that maximises the objective function J, and can be shown to be deterministic.” There can be multiple optimal policies, some of which may be stochastic though there always exists at least one deterministic optimal policy.


> P39: discuss implications of assuming linear scalarisation


> P41: the MCCS or a MCCS?

Updated caption of Fig 2.12 (b) to be more precise about the sets of values/policies and account for the fact that there may not be a unique minimal convex coverage set.


> “replacing the Shannon entropy regulariser **with** other entropy regularisers” 


> P53: Reiterate here the motivation for online MO planning.




> P56: “In maximum entropy reinforcement learning (Section 2.3.1), entropy is added directly to the objective function rather than used as a constraint to remove ambiguity between multiple optimal policies, as in inverse reinforcement learning.” What’s the difference if the constraint will be turned into a penalty with a Lagrangian?


> P59: Again, isn’t UCT’s “exploitation” in effect good local exploration?


> P62: which of these are not satisfied by UCT or MENTS? Why exploit if we care about simple regret?


> P63: “Uses a Boltzmann search policy with decayed temperature similar to [8], but includes an additional uniform exploration term similar to MENTS” Why? Very procedural with no motivation, which of the above problems are you solving? Why do we need two exploration terms?



> Why do we need this approach based on ball? Why not learn separate values for each objective and dot-product them with the weights?


> Again, be clear about the motivation here, and consider switching to unknown weights scenario.


> "P132: “It is worth noting that in multi-objective MCTS, the quality of the convex hull at the root node is the primary concern.” Why? This is a big unsupported claim"


> P132: “A more efficient online approach is therefore to run the multi-objective tree search from the initial state, and subsequently follow a single-objective MCTS algorithm in the scalarised MDP with reward R(s,a; w) = w⊤R(s,a), where w is inferred from the choice made at the root node.” The choice may not disambiguate w, which is another reason why unknown weights would give a cleaner motivation. Also, explain why building an MCTS tree is a good way to use the offline planning budget, compared to just learning better prior policies and value functions that apply in any state. Finally, if this only makes sense assuming a deterministic initial state, that needs to be stated clearly up front.


> P134: Why is improvement not monotonic? (later plots as well)

- TODO: update plots in doc
- TODO: bug in how computed hypervolume for CZT algorithms
- TODO: updated plots in Figures X, Y, 6.7 and 6.8 with correct hypervolumes for CZT algorithm
- TODO: describe bug
- TODO: apologize and say that this should have been caught before submission, particularly the hypervolume plots for the Four-Room environment are obviously incorrect



> P148: concave -> convex

Corrected.


> P163: correct x-axis on figure size to env size/width, not search time.  Also ensure Fig 6.10 is discussed in the text, and the non-monotic trends and fully explained.  (also applies to Fig 5.7 on page 138)

- Updated x-axis to "Environment Size" rather than "Search Time" in Figs 5.7 and 6.10
- TODO: explain non-monotonic trends in the text
- TODO: update plots in doc

> P208 -Fig D.1 - is this really a CDF? Not in the conventional sense?  Suggest to explain more or reword

- TODO: fix in ch4
- TODO: comment about how Appendix D I did not find time to significantly clean up before the submission, which I have done now. 
- TODO: In particular, Lemma XXX was a duplicate of Lemma YYY, hence why this is corrected in Chapter 4 instead. I have removed any duplicated lemmas from Appendix D.

> Fix broken cross-refs - a search for ‘??’ found 10 of them.

I believe that these were all in Appendix D, and I would like to apologise again that Appendix D was submitted in an unclean state. I double checked that no missing cross-refs and citations exist in the corrected thesis.
- TODO: ctrl-f search for ?? to check fixed them all



> BayesOpt is one of many possible parameter / hyper-parameter packages - say a bit more about why this was chosen (convenience of C++ implementation etc) and whether the parameter tuning generally made much of a difference. Also consider whether these are parameters or hyper-parameters (arguably these are just parameters).

- Added a comment about why BayesOpt was used in Appendix B (page 183)
- Added a paragraph discussing that the tuning does make a significant difference, and remarking that some parameters which have little effect on performance get set to somewhat arbitrary values due to the optimisation (pages 184+185)
