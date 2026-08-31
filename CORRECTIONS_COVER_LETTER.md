# Corrections Cover Letter

Corrections are highlighted in blue throughout the thesis. This document is to outline how the thesis has been updated for each comment. I've tried to give references to easily look up the corresponding changes, such as page numbers or figure numbers.

While proof reading the thesis for the corrections pass, I felt that the abstract and Chapter 1 could use significant revision beyond just the comments below, so I have also updated them. Hopefully they read a lot better now.



> Refers to “the standard objective” which could mean multiple things, suggest e.g. “standard objective of maximising expected return”.

- Appears twice in the abstract, updated in the first instance as suggested and updated second instance to just use "expected return"
- Additionally updated in three places in Chapter 1 (pages 3, 4 and 6), and in two places in Chapter 7 (pages 167 and 169)
- In Chapters 2 and 4, added some additional references back to the formal definitions:
    - page 35 - where MENTS is introduced
    - page 60 - where misalignment is defined
    - page 63 - where BTS is introduced as using the standard objective
    - page 90 - where the maximum entropy objective is recalled in the parameter sensitivity discussion



> P2: Explain clearly the multi-objective setting, including what is known when, and how this interacts with on-line planning with MCTS methods. Consider using the unknown weights scenario instead of decision support as motivation.

I agree that using the unknown weights scenario provides a better motivation for the thesis, so I have added following changes:
- Added a new Section 1.2 to outline the scope of the thesis, being more specific about the multi-objective setting, including:
    - planning begins from a known initial state,
    - describing the unknown weights scenario, including what is known and when,
    - clarifying that utilities are assumed to be linear, with forward references where it is discussed,
    - clarify that the algorithms are evaluated as offline planners, and indicated that, for example, that in the unknown weights scenario any online planning reduces to a single-objective problem,
    - explaining why planning methods might still be of interest instead of purely learning better prior policy/value functions
- Updated prose thoughout thesis for using the unknown weights scenario instead:
    - Many places throughout abstract and chapter 1, decision support scenario is updated to unknown weights along with related writing (e.g. avoiding refering to user's preferences)
    - Section 2.6 - added an additional introductory paragraph to define the unknown weights scenario instead, and updated Figure 2.10
    - Chapter 5 introduction (page 120) - updated decision support -> unknown weights scenario
    - Section 5.1 (page 121) - rewrote introduction paragraph, relating back to the new scope section for motivation




Chapter 5 + 6 proof reads

    - Chapter 5 introduction - updated to unknown weights + references
    - Section 5.1 - Updated prose, relating back to the scoping section
    - Sec 5.4.2 (see P132 below)
    - Sec 5.6 (chapter summary)





> P3: either here or elsewhere justify the choice of linear utility function and discuss whether any of the work could be applied to decision support scenarios where the utilites are non-linear or better expressed as preference functions

Theorem 5.5.1 was intended to answer this question theoretically, but the discussion around it and references pointing towards it were lacking. I have made the following changes to address this:
- Added an explicit Section 5.5.1 to discuss why the linear utility assumption is made and discuss adapting it to non-linear utilities
- Updated the description of Section 5.5 in the Chapter 5 introduction (page 114) to reflect the changes made to Section 5.5
- Also added forward references to Section 5.5.1 where it seemed appropriate:
    - In the scoping section added for the correction above (Section 1.2)
    - Where linear utility is defined in Section 2.6 (page 45)


TODO: proof read section 5.5


> P12: Explain which of these bounds is better and why. Give some intuition about simple regret bounds, what constitutes a good bound, etc.

Added an couple sentences at the end of the section to explain (page 12).



> P13: “States are sampled according to a transition distribution that depends **only** on the current state and current action being taken (the Markov assumption).”

Updated (page 13).



> P15: In a finite-horizon MDP, the policy needs to condition on the timestep (as do the value functions defined later).

Agreed, and corrected. Policies now condition on the timestep throughout Chapter 2, up to the point at which the timestep parameter is explicitly dropped:

- Definition 2.2.5 now defines a policy conditioning on the timestep, and the corresponding notation is updated. The preceding paragraph is also updated to explicitly explain the conditioning.
- Updated notation to correctly condition on the timestep throughout the chapter:
    - Definition 2.2.6 (trajectory)
    - Equation 2.32 (Shannon entropy)
    - Definition 2.3.5 / Equation 2.33 (definition of a soft value)
    - Definition 2.3.8 / Equation 2.39 (definition of the optimal soft policy)
    - Definition 2.6.2 (multi-objective trajectory)
    - Equation 2.84 (Extracting a policy from CHVI given a weight $\mathbf{w}$)
- Made the unique state assumption more explicit in an assumption clause (Assumption 2.4.1), to highlight the explanation that this assumption is made to drop the timestep parameter for the remainder of the thesis (with the exception off Section 2.6)



> P17: It’s confusing to include RL here. You’re just doing sample-based on-line planning.

TODO: ACTUALLY WRITE THESE UPDATES
The difference between planning and RL that I was working with is that planning the transition distribution is known whereas in RL it is unknown. To clarify I've made the following changes:
- Updated title of Sections 2.3 and 2.3.1: "Reinforcement Learning" -> "Planning and Reinforcement Learning"
- Minor changes to Section 2.3 to be consistent with updating the heading
- Added Section 2.3.2 to clarify where MCTS sits within planning and RL, and to additionally clarify that  



> P18: “The optimal policy is the policy that maximises the objective function J, and can be shown to be deterministic.” There can be multiple optimal policies, some of which may be stochastic though there always exists at least one deterministic optimal policy.

Updated Definition 2.3.4.

Sorry I often use the case where each state has a unique optimal action to simplify notation and maths, and I let it slip into the thesis. I have made the following changes to correct this in the thesis:
- updated Definition 2.3.4 to be correct
- added Assumption 2.3.1 to state that the theory in the thesis assumes that every state has a unique optimal action, and that it is not a necessary assumption
    - I realised that the many of the theorems have statements about sequences of policies of the form $\pi_n \rightarrow \pi^*$, which also implicitly assumes a unique optimal policy
    - Rather than add additional and unnecessary complexity to the theory I felt that it was better to just make the assumption explicit
- added an additional item in the list of assumptions on page 93 as a reminder 



> P39: discuss implications of assuming linear scalarisation

TODO



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

TODO: 




> "P132: “It is worth noting that in multi-objective MCTS, the quality of the convex hull at the root node is the primary concern.” Why? This is a big unsupported claim"
> 
> and
> 
> P132: “A more efficient online approach is therefore to run the multi-objective tree search from the initial state, and subsequently follow a single-objective MCTS algorithm in the scalarised MDP with reward R(s,a; w) = w⊤R(s,a), where w is inferred from the choice made at the root node.” The choice may not disambiguate w, which is another reason why unknown weights would give a cleaner motivation. Also, explain why building an MCTS tree is a good way to use the offline planning budget, compared to just learning better prior policies and value functions that apply in any state. Finally, if this only makes sense assuming a deterministic initial state, that needs to be stated clearly up front.

- The new Section 1.4 addresses this comment up front: it states that planning is run from a known initial state, explains why the planning budget is spent building a search tree from that state (computation is concentrated on the states reachable from it), and switches to the unknown weights scenario, in which the weight vector is explicitly revealed after planning rather than inferred from the choice made at the root node.
- Rewrote the opening of Section 5.4.2 (page 132) accordingly: the root node's convex hull determines the achievable utility once the weight vector is revealed, after which the problem reduces to single-objective planning with scalarised rewards, and deeper parts of the multi-objective tree serve to improve the root value estimates.


> P134: Why is improvement not monotonic? (later plots as well)

For context this is related to Figure (TODO), which are the plots of EUM and Hypervolume for the DST and Multi-Objective Gymnasium environments


- CZT in the DST(10,0) environment (Figure TODO TODO) accidentally used an old (incorrect) version of the recommendation policy (Equation 5.14), where the maximum was taken over all of the balls rather than just the relevant balls. I have corrected and updated the data for this now


TODO: check that how get convex hull from CZT and SM is explained

Non-monotonic trends that need explaining:
- 500 fruit tree - HV (all)
- 520 resource gathering - HV (CZT)
- 540 breakable bottles - HV (CZT)

- TODO: update plots in doc
- TODO: bug in how computed hypervolume for CZT algorithms
- TODO: updated plots in Figures X, Y, 6.7 and 6.8 with correct hypervolumes for CZT algorithm
- TODO: describe bug
- TODO: apologize and say that this should have been caught before submission, particularly the hypervolume plots for the Four-Room environment are obviously incorrect



> P148: concave -> convex

Updated (page 148).



> P163: correct x-axis on figure size to env size/width, not search time.  Also ensure Fig 6.10 is discussed in the text, and the non-monotic trends and fully explained.  (also applies to Fig 5.7 on page 138)

- Updated x-axis to "Environment Size" rather than "Search Time" in Figs 5.7 and 6.10

- Non monotonic because fixed time and problem complexity increases from left to right
- Performance drops off in stochastic envs particularly when it becomes increasingly likely to leave the explored space of the tree
- Less of an issue in CZT because it is far greedier, so has a very well explored, but very suboptimal value

- TODO: explain non-monotonic trends in the text
- TODO: update plots in doc



> P208 -Fig D.1 - is this really a CDF? Not in the conventional sense?  Suggest to explain more or reword

I would like to apologise for the state that Appendix D was in at the time of submission. Fig D.1 was erroneously a duplicate of Fig 4.18, and the corresponding corollary was duplicated between Chapter 4 and Appendix D. I have removed the duplicate from Appendix D and applied corrections in Chapter 4:
- Replaced proof outline of Corollary 4.5.1 with a proof, making the constructed pmf/cdf explicit
- Updated Fig 4.18 to be consistent with the construction used, and updated caption with reference to the construction used in the proof



> Fix broken cross-refs - a search for ‘??’ found 10 of them.

I believe that these were all in Appendix D, and I would like to apologise again that Appendix D was submitted in an unclean state. I double checked that no missing cross-refs and citations exist in the corrected thesis.



> BayesOpt is one of many possible parameter / hyper-parameter packages - say a bit more about why this was chosen (convenience of C++ implementation etc) and whether the parameter tuning generally made much of a difference. Also consider whether these are parameters or hyper-parameters (arguably these are just parameters).

- Added a comment about why BayesOpt was used in Appendix B (page 183)
- Added a paragraph explaining that the tuning does make a significant difference, and remarking that some parameters which have little effect on performance get set to somewhat arbitrary values due to the optimisation (pages 184+185)
- Agreed that hyperparameter is not the correct term, I have updated any instances of "hyperparameters" to either just "parameters" or the more specific "algorithm parameters". Because this appeared in many places, I wont list the location of all changes (although they are all marked as corrections in the pdf)
    - I used "algorithm parameters" where the extra specificity is helpful, and just "parameter" where the more specific term would read awkwardly, or where the context already makes it clear
    - Double checked all instances are updated by searching for "hyperparameter" and "hyper-parameter" and confirming no mentions remain
    - All corrected instances can be found by searching for "parameter"
