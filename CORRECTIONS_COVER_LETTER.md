CHECKS AFTER ALL CORRECTIONS AND UPDATES FINISHED:
- section numbers correct
- page references correct
- figure references correct (we may have added figures after writing response)

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
    - explaining why MCTS methods might still be of interest instead of purely learning better prior policy/value functions
- Updated prose throughout thesis for using the unknown weights scenario instead and to be consistent with scoping section:
    - Many places throughout abstract and chapter 1, decision support scenario is updated to unknown weights along with related writing (e.g. avoiding refering to user's preferences)
    - Section 2.6 - added an additional introductory paragraph to define the unknown weights scenario instead, and updated Figure 2.10
    - Chapter 5 introduction (page 120) - updated decision support -> unknown weights scenario
    - Section 5.1 - restructured to improve clarity and relates back to unknown weights scenario
    - Section 5.4.2 - updated first paragraph to motivate the use of the two reported metrics using the unknown weights scenario



> P3: either here or elsewhere justify the choice of linear utility function and discuss whether any of the work could be applied to decision support scenarios where the utilities are non-linear or better expressed as preference functions

Theorem 5.5.1 was intended to answer this question theoretically, but the discussion around it and references pointing towards it were lacking. I have made the following changes to address this:
- restructured Section 5.5, and included a new subsection 5.5.2 to more appropriately give an explanation and an example of why only linear utilities are considered
- also added subsection 5.5.2.1 to explain how the work could be adapted to a non-linear (Chebyshev) utility
- added forward references to Section 5.5 to highlight that the choice is addressed later, specifically:
    - Section 1.2 (page TODO) - the scoping section added for the correction above
    - Section 2.6 (page 45) - where the linear utility function is defined
    - TODO: is bringing up Section 5.1 relevant here?



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

The definition I was implicitly using is that planning uses the transition distribution directly, while RL uses experience. So I settled on the best way to resolve this is to say that MCTS lies in the intersection of the two, so I have made the following changes to Section 2.3:
- Updated section headers "Reinforcement Learning -> Planning and Reinforcement Learning", across sections 2.3 and 2.6
- Added a roadmap paragraph at the start of Section 2.3 (page 21), to indicate that the section is more about giving definitions than methods that are relevant to both planning and RL, and to hopefully be more clear what the section covers and that no RL methods are covered
- Added Section 2.3.2 to be highlight on the difference between planning and reinforcement learning, clarifying that MCTS sits between the two and to clarify that the thesis does not consider learning of function approximations in the typical machine learning sense



> P18: “The optimal policy is the policy that maximises the objective function J, and can be shown to be deterministic.” There can be multiple optimal policies, some of which may be stochastic though there always exists at least one deterministic optimal policy.

Updated Definition 2.3.4.

Sorry I often use the case where each state has a unique optimal action to simplify notation and maths, and I let it slip into the thesis. I have made the following changes to correct this in the thesis:
- updated Definition 2.3.4 to be correct
- added Assumption 2.3.1 to state that the theory in the thesis assumes that every state has a unique optimal action, and that it is not a necessary assumption
    - I realised that the many of the theorems have statements about sequences of policies of the form $\pi_n \rightarrow \pi^*$, which also implicitly assumes a unique optimal policy
    - Rather than add additional and unnecessary complexity to the theory I felt that it was better to just make the assumption explicit
- added an additional item in the list of assumptions on page 93 as a reminder 



> P39: discuss implications of assuming linear scalarisation

Added Section 2.6.2 to discuss this explicitly and added a forward reference where this was suggested (now page 46).



> P41: the MCCS or a MCCS?

Updated caption of Fig 2.12 (b) to be more precise about the sets of values/policies and account for the fact that there may not be a unique minimal convex coverage set.


> “replacing the Shannon entropy regulariser **with** other entropy regularisers” 

Updated (page 50).



> P53: Reiterate here the motivation for online MO planning.

Most of the prior work in MOMCTS is also used in either the unknown weights scenario or similar, they are used for offline planning and a policy is extracted at execution time. The exception is Distributional MCTS, which considers the ESR criterion, and uses a known utility (i.e. the known weights scenario). 

To address motivation for MO planning in Section 3.6, I have added an additional paragraph (now page 60) at the end explaining the above, referencing back to the new scoping section (from P2 correction) and where unknown weights scenario is defined in Section 2.6.



> P56: “In maximum entropy reinforcement learning (Section 2.3.1), entropy is added directly to the objective function rather than used as a constraint to remove ambiguity between multiple optimal policies, as in inverse reinforcement learning.” What’s the difference if the constraint will be turned into a penalty with a Lagrangian?

Updated introductory paragraphs to Chapter 4 in line with the following answer to the question.

In maximum entropy reinforcement learning, the objective function is regularised by the entropy term that doesn't correspond to a constraint.

When a policy is learned in maximum entropy inverse reinforcement learning the objective is to imitate the expert policy via the trajectories provided. So the objective optimised does include a Lagrangian corresponding to the constraint used to match the learned policy to the expert policy. For example if the expert policy $\pi_{\text{expert}}$ was known the objective could be $\mathcal{H}(\pi) - \lambda \left\Vert\pi - \pi_{\text{expert}} \right\Vert_2$.



> P59: Again, isn’t UCT’s “exploitation” in effect good local exploration?

Yes it often does, I would say that it is problem dependent. Here I'm trying to essentially give a simple example that begins to demonstrate the failure mode of UCT, which is an overcommitment to suboptimal actions when the value estimates of optimal actions are initially poor, and remain poor throughout UCTs initial exploration phase. While in theory UCT is guaranteed to converge to optimal values (and recommend an optimal policy) in these failure modes this will never happen in practise.

I have added the following changes to help clarify:
- Added a sentence at the start of Section 4.1 (page 63) to highlight that UCT is a successful algorithm, and this section intends to highlight a failure mode and is not claiming that UCT is inherently bad
- Added a paragraph at the start of Section 4.1.1 (page 65) that agrees with the comment: it explains that UCT's exploitation does act as effective local exploration when rewards are dense and informative, and that the failure mode arises when the optimal action instead retains a poor value estimate throughout the initial exploration. Sparse or uninformative rewards, and a misleading learned heuristic, are given as two examples
- Added a paragraph at the end of Section 4.1.1 (page 66) that points the reader to the DeterministicGridWorld results, which more clearly show that UCT converges in practise to a suboptimal solution in some environments
- The existing (now penultimate) paragraph of Section 4.1.1 (page 66) already contrasts UCT's asymptotic guarantee with its behaviour in practice, so this has been left unchanged




> P62: which of these are not satisfied by UCT or MENTS? Why exploit if we care about simple regret?

I have added a few paragraphs to address these questions, after the bullet point list of design aims in Section 4.2 (now page 69). 

The first is to clarify that the design aims are motivated by the exploration setting of reinforcement learning in practise (with a finite planning budget).

The second is to clarify that simple regret is used to give theoretical guarantees about the asymptotic performance of the algorithms. Originally I did use simple regret as a motivating reason for the algorithms. I could only find one place where this still existed, which was shortly before this, so I have also updated that "Simple regret is used *to motivate and analyse*..." -> "Simple regret is used *to analyse*..." (Section 4.1.3, page 67)

The third and fourth paragraphs goes through each of the design aims, if they are satisfied by UCT or MENTS, and why they are relevant in the exploration setting of reinforcement learning

The gridworld results in Section 4.4.3.1 also explain some of this where relevant, particularly where exploitation was useful in the FrozenLake experiments, and reference back to Equation 4.36, which describes the policy used for evaluation, to point out that exploitation is useful to avoid falling back to the uniform policy.

TODO: add description of relevant changes made to results discussion when handled that todo
- small terminology change (make it inline with the "fall back" terminology)



> P63: “Uses a Boltzmann search policy with decayed temperature similar to [8], but includes an additional uniform exploration term similar to MENTS” Why? Very procedural with no motivation, which of the above problems are you solving? Why do we need two exploration terms?

Added reasoning to the beginning of Section 4.2.1 (now page 70) to explain. The two terms provide exploration that is centred on the current estimates and uniformly randomly, so provide different types of exploration. 

Boltzmann is largely used to focus the search around the currently competitive value estimates, while the uniform exploration is primarily retained to provide a convergence guarantee when the Boltzmann temperature is decayed to zero, causing the Boltzmann policy to become greedy.




> Why do we need this approach based on ball? Why not learn separate values for each objective and dot-product them with the weights?

I will address both separately.

Why not learn separate values for each objective?
- If I understand the suggestion, it is to use a vector value estimate at each node, and use that to obtain utilities as necessary
    - Some of the prior works use this, and I have an example in the CHMCTS paper that I didn't include in the thesis why the approach is flawed
    - I have updated Section 3.5 on related work in MOMCTS to include the argument why the point estimates used in some prior work is flawed
    - I have also generalised the argument informally for why using a single vector 

Why do we need the approach based on balls?
- Section 5.1.2 poses MOMCTS as a contextual problem, so CZT is introduced for two reasons:
    - To ask whether a contextual bandit algorithm can be run at each node, in place of UCB in UCT. The balls are Contextual Zooming's representation of the context space, rather than a design choice made for its own sake
    - To provide a contextual baseline for MOMCTS, where none currently exists
- I have added a sentence at the start of Section 5.2 (page 128) making this framing more explicit
- The section already states that CZT also serves as a baseline where none exists, at the end of the third paragraph of Section 5.2 (also page 128), so no update was needed for that



> Again, be clear about the motivation here, and consider switching to unknown weights scenario.

I believe that this is generally related to chapter 5, and hopefully this is addressed by the changes discussed in the correction for P2.



> "P132: “It is worth noting that in multi-objective MCTS, the quality of the convex hull at the root node is the primary concern.” Why? This is a big unsupported claim"
> 
> and
> 
> P132: “A more efficient online approach is therefore to run the multi-objective tree search from the initial state, and subsequently follow a single-objective MCTS algorithm in the scalarised MDP with reward R(s,a; w) = w⊤R(s,a), where w is inferred from the choice made at the root node.” The choice may not disambiguate w, which is another reason why unknown weights would give a cleaner motivation. Also, explain why building an MCTS tree is a good way to use the offline planning budget, compared to just learning better prior policies and value functions that apply in any state. Finally, if this only makes sense assuming a deterministic initial state, that needs to be stated clearly up front.

- The new scoping section (from P2) addresses these comments up front: 
    - planning is run from a known initial state
    - algorithms are evaluated as offline planners 
    - the unknown weights scenario is used where the weight is revealed after planning
    - gives the reduction to single-objective MCTS for online planning at evaluation time in the unknown weights scenario
    - justifying why considering multi-objective MCTS methods can still be relevant beyond just learning function approximators
- The issue about user choice not disambiguating the weight vector is addressed by moving to the unknown weights scenario as suggested
- The opening of Section 5.4.2 (now page 141) is now written consistently with the rest of the changes from P2 (and refers back to Sections 1.2 and 2.6). The scoping of running the algorithms during the planning phase of the unknown weights scenario is used to  being clear that metrics computed at the initial state are most relevant


> P134: Why is improvement not monotonic? (later plots as well)

There are a two reasons for the non-monotonic trends in Figures 5.4:
- In CZT, the hypervolume is estimated using a set of vectors that sample averages that may vary throughout the algorithms runtime, and the relevant set of balls is used to approximate the hypervolume, which will also change throughout the runtime
- In CHMCTS algorithms, the convex hull value sets are pruned to maintain a maximum size (Section 5.3.6 and Equation 5.41), where the pruning breaks the monotonicity of convex hull backups with respect to hypervolume

The only reason there was a non-monotonic trend in Figure 5.5 was due to a mistake:
- the non-monotonic trend in the EUM for CZT in Figure 5.5a was due to accidentally using an old (incorrect) version of the recommendation policy (Equation 5.14), where the maximum was taken over all balls rather than just the relevant balls
    - corrected and plot in updated thesis now shows a monotonic improvement in EUM

I have added the following additional explanations to the main text in Chapter 5:
- added more specificity to how the hypervolume is approximated for CZT and giving details of some parameters upfront (rather than leaving them all to appendix TODO) where they are relevant to the discussion later (TODO: add section 5.5.2.1, reference it here, add page reference for new writing)
- added a paragraph at the end of the gymnasium section of Section 5.5.3, to explain the reasons for the non-monotonic trends for Figure 5.4 given above (page 144)

And I have made the following corresponding changes to Chapter 6:
- added more specificity to how the hypervolume is computed for simplex map algorithms and specifying some of the algorithms parameters (TODO: add the updated section reference and page reference when do below subpoint)
    - updated the structure of Section 6.4 to parallel the results sections of Chapters 4 and 5, with information about environments and evaluation referring back to Chapter 5, and providing a place to add this new information as a diff from Chapter 5
- Added a reference from Section 6.4.1 on (page TODO) back to the explanation of non-monotonic results, as some of the non-monotonic CZT and CHMCTS results are repeated in Figure 6.7



> P148: concave -> convex

Updated (page 148).



> P163: correct x-axis on figure size to env size/width, not search time.  Also ensure Fig 6.10 is discussed in the text, and the non-monotic trends and fully explained.  (also applies to Fig 5.7 on page 138)

- Corrected x-axis for plots in Figures 6.10 and 5.7 to correctly display "Environment Size" rather than search time
- Added a description of the non-monotonic trends seen in Figure 5.7 and why they occur at the beginning of Section 5.4.4 (page 148)
- Added a paragraph at the start of Section 6.4.2 (page 178) to refer back to the explanation in Section 5.4.4 for the repeated algorithms
- Added a paragraph in Section 6.4.2 (3rd paragraph of section, also page 178) to describe the additional non-monotonic trends in the EUM plots seen in Figure 6.10 for SM-BTS and SM-DENTS



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
