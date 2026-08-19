# Corrections Cover Letter

Corrections are highlighted in blue throughout the thesis. This document is to outline how the thesis has been updated for each correction. I've tried to give references to easily look up the corresponding change, such as page numbers or figure numbers.

## In Progress TODOs

- Can you proof read the corrections that I've made throughout this thesis, and for any issues make suggestions that I can approve/deny please. Corrections are either contained in \mccorrect commands or \begin{mccorrection} ... \end{mccorrection} environments. Additionally, can you proof read the CORRECTIONS_COVER_LETTER.md. In both cases I care about correctness and grammar. Please restrict your comments and feedback to the cover letter and the corrections themselves, I can't edit arbitrary parts of the thesis anymore.
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

- TODO: refer to the theory in Ch5
- TODO: discuss ESR criterion + refer to Shimons paper
- TODO: discuss that in practise might work better still, but beyond scope of thesis



> P12: Explain which of these bounds is better and why. Give some intuition about simple regret bounds, what constitutes a good bound, etc.


> P13: “States are sampled according to a transition distribution that depends only on the current state and current action being taken (the Markov assumption).”


> P15: In a finite-horizon MDP, the policy needs to condition on the timestep (as do the value functions defined later).

- TODO:we updated policy somewhere to use timestep too, carefully correct this in Ch 2


> P17: It’s confusing to include RL here. You’re just doing sample-based on-line planning.




> P18: “The optimal policy is the policy that maximises the objective function J, and can be shown to be deterministic.” There can be multiple optimal policies, some of which may be stochastic though there always exists at least one deterministic optimal policy.

Updated Definition 2.3.4.

Sorry I often use the case where each state has a unique optimal action to simplify notation and maths, and I let it slip into the thesis. I have made the following changes to correct this in the thesis:
- updated Definition 2.3.4 to be correct
- added Assumption 2.3.1 to state that the theory in the thesis assumes that every state has a unique optimal action, and that it is not a necessary assumption
    - I realised that the many of the theorems have statements about sequences of policies of the form $\pi_n \rightarrow \pi^*$, which also implicitly assumes a unique optimal policy
    - Rather than add additional and unnecessary complexity to the theory I felt that it was better to just make the assumption explicit
- added an additional item in the list of assumptions on page 93 as a reminder 





> P39: discuss implications of assuming linear scalarisation


> P41: the MCCS or a MCCS?

Updated caption of Fig 2.12 (b) to be more precise about the sets of values/policies and account for the fact that there may not be a unique minimal convex coverage set.


> “replacing the Shannon entropy regulariser **with** other entropy regularisers” 

Updated (page 50).



> P53: Reiterate here the motivation for online MO planning.




> P56: “In maximum entropy reinforcement learning (Section 2.3.1), entropy is added directly to the objective function rather than used as a constraint to remove ambiguity between multiple optimal policies, as in inverse reinforcement learning.” What’s the difference if the constraint will be turned into a penalty with a Lagrangian?

Updated introductory paragraphs to Chapter 4 in line with the following answer to the question.

In maximum entropy reinforcement learning, the objective function is regularised by the entropy term that doesn't correspond to a constraint.

When a policy is learned in maximum entropy inverse reinforcement learning the objective is to imitate the expert policy via the trajectories provided. So the objective optimised does include a Lagrangian corresponding to the constraint used to match the learned policy to the expert policy. For example if the expert policy $\pi_{\text{expert}}$ was known the objective could be $\mathcal{H}(\pi) - \lambda \left\Vert\pi - \pi_{\text{expert}} \right\Vert_2$.



> P59: Again, isn’t UCT’s “exploitation” in effect good local exploration?


> P62: which of these are not satisfied by UCT or MENTS? Why exploit if we care about simple regret?


> P63: “Uses a Boltzmann search policy with decayed temperature similar to [8], but includes an additional uniform exploration term similar to MENTS” Why? Very procedural with no motivation, which of the above problems are you solving? Why do we need two exploration terms?




> Why do we need this approach based on ball? Why not learn separate values for each objective and dot-product them with the weights?


> Again, be clear about the motivation here, and consider switching to unknown weights scenario.

See P132 comment below.

> "P132: “It is worth noting that in multi-objective MCTS, the quality of the convex hull at the root node is the primary concern.” Why? This is a big unsupported claim"

See P132 comment below.

> P132: “A more efficient online approach is therefore to run the multi-objective tree search from the initial state, and subsequently follow a single-objective MCTS algorithm in the scalarised MDP with reward R(s,a; w) = w⊤R(s,a), where w is inferred from the choice made at the root node.” The choice may not disambiguate w, which is another reason why unknown weights would give a cleaner motivation. Also, explain why building an MCTS tree is a good way to use the offline planning budget, compared to just learning better prior policies and value functions that apply in any state. Finally, if this only makes sense assuming a deterministic initial state, that needs to be stated clearly up front.

- TODO: changes in intro
- TODO: changes in intro of Ch5


> P134: Why is improvement not monotonic? (later plots as well)

- TODO: update plots in doc
- TODO: bug in how computed hypervolume for CZT algorithms
- TODO: updated plots in Figures X, Y, 6.7 and 6.8 with correct hypervolumes for CZT algorithm
- TODO: describe bug
- TODO: apologize and say that this should have been caught before submission, particularly the hypervolume plots for the Four-Room environment are obviously incorrect



> P148: concave -> convex

Updated.



> P163: correct x-axis on figure size to env size/width, not search time.  Also ensure Fig 6.10 is discussed in the text, and the non-monotic trends and fully explained.  (also applies to Fig 5.7 on page 138)

- Updated x-axis to "Environment Size" rather than "Search Time" in Figs 5.7 and 6.10
- TODO: explain non-monotonic trends in the text
- TODO: update plots in doc



> P208 -Fig D.1 - is this really a CDF? Not in the conventional sense?  Suggest to explain more or reword

I would like to apologise for the state that Appendix D was in at the time of submission. Fig D.1 was erroneously a duplicate of Fig 4.18, and the corresponding corollary was duplicated between Chapter 4 and Appendix D. I have removed the duplicate from Appendix D and applied corrections in Chapter 4:
- Replaced proof outline of Corollary 4.5.1 with a proof, making the constructed pmf/cdf explicit
- Updated Fig 4.18 to be consistent with the construction used, and updated caption with reference to the construction used in the proof



> Fix broken cross-refs - a search for ‘??’ found 10 of them.

I believe that these were all in Appendix D, and I would like to apologise again that Appendix D was submitted in an unclean state. I double checked that no missing cross-refs and citations exist in the corrected thesis.
- TODO: ctrl-f search for ?? to check fixed them all



> BayesOpt is one of many possible parameter / hyper-parameter packages - say a bit more about why this was chosen (convenience of C++ implementation etc) and whether the parameter tuning generally made much of a difference. Also consider whether these are parameters or hyper-parameters (arguably these are just parameters).

- Added a comment about why BayesOpt was used in Appendix B (page 183)
- Added a paragraph discussing that the tuning does make a significant difference, and remarking that some parameters which have little effect on performance get set to somewhat arbitrary values due to the optimisation (pages 184+185)
- TODO: Hyperparameter -> (Search) Parameter
