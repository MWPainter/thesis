# Corrections Cover Letter

Corrections are highlighted in blue throughout the thesis in `Oxford_Thesis_corrections.pdf.`

In this document each of the suggested corrections/questions are indicated as a quote. The purpose of this cover letter is to point to the changes made for each correction in a question and response format, to make the corresponding changes (in `Oxford_Thesis_corrections.pdf`) as easy as possible to look up.


> Abstract: Refers to “the standard objective” which could mean multiple things, suggest e.g. “standard objective of maximising expected return”.

The phrase is now spelled out as suggested where the objective is first referred to: 

| Location | Change |
|------------|------------------------------------|
| Abstract | Spelled out in the first instance; shortened to "expected return" in the second |
| Chapter 1 (pp. 3, 7, 8) | Three instances spelled out |
| Chapter 7 (pp. 189, 191) | Two instances spelled out |

The formal definitions (Definitions 2.3.3 and 2.3.7) are referenced wherever the objectives are discussed later:

| Location | Change |
|------------|------------------------------------|
| p. 40 | Reference to the definition where MENTS is introduced |
| p. 66 | Reference in the introductory discussion of Chapter 4 |
| p. 70 | Reference just prior to where misalignment of the maximum entropy objective is defined |
| p. 74 | Reference where BTS is introduced as using the standard objective |
| p. 105 | Reference where the maximum entropy objective is recalled, in the parameter sensitivity discussion |



> P2: Explain clearly the multi-objective setting, including what is known when, and how this interacts with on-line planning with MCTS methods. Consider using the unknown weights scenario instead of decision support as motivation.

**Agreed on both points.** A new Section 1.2 (p. 4) sets out the scope of the thesis up front, stating that:

- planning begins from a known initial state;
- the unknown weights scenario is used, including what is known and when;
- utilities are assumed to be linear, with forward references to where that assumption is justified;
- the algorithms are evaluated as offline planners, so that in the unknown weights scenario any online planning reduces to a single-objective problem;
- MCTS methods remain of interest even given the alternative of learning better prior policy and value functions.

The prose elsewhere was then updated to use the unknown weights scenario and to stay consistent with that scoping:

| Location | Change |
|------------|------------------------------------|
| Abstract | Two instances updated |
| Section 1.1 (p. 2) | Avoids referring to a "user's" preferences |
| Section 2.6 (p. 44) | Introductory paragraph now defines the unknown weights scenario rather than decision support |
| Figure 2.10 (p. 43) | Redrawn for the unknown weights scenario |
| Chapter 5 introduction (p. 128) | Decision support → unknown weights scenario |
| Section 5.1 | Restructured for correction CH5b, and written consistently with the scenario change |
| Section 5.4.2 (p. 147) | Updated for correction P132; refers back to the scope and scenario, and motivates the focus on EUM using the unknown weights scenario |



> P3: either here or elsewhere justify the choice of linear utility function and discuss whether any of the work could be applied to decision support scenarios where the utilities are non-linear or better expressed as preference functions

Theorem 5.5.1 was intended to answer this question theoretically, but the discussion around it, and the references pointing towards it, were lacking. Section 5.5 has therefore been restructured:

| Location | Change |
|------------|------------------------------------|
| Section 5.5.1 (p. 156) | Additional notation and definitions that do not assume a linear utility |
| Section 5.5.2 (p. 157) | An informal explanation of why a linear utility is assumed, with an example of how MCTS goes wrong under a non-linear (Chebyshev) utility |
| Section 5.5.2.1 (p. 159) | How MOMCTS can be applied under a non-linear (Chebyshev) utility, and in which cases (deterministic MOMDPs) |
| Section 5.5.3 (p. 162) | Now houses the pre-existing theoretical argument |
| Section 5.5.4 (p. 163) | Now houses the outline of convergence proofs for CHMCTS algorithms |

Forward references to Section 5.5 were added to flag that the assumption is addressed later:

| Location | Change |
|------------|------------------------------------|
| Section 1.2 (p. 5) | In the scoping section added for correction P2 |
| Section 2.6 (p. 46) | Next to the definition of the linear utility function, noting that Chapters 5 and 6 assume a linear utility |
| Section 2.6.2 (p. 53) | In the section added for correction P39 |
| Section 5.1.1 (p. 130) | Updated for correction CH5b; points towards the theoretical discussion |


> P12: Explain which of these bounds is better and why. Give some intuition about simple regret bounds, what constitutes a good bound, etc.

**Section 2.1.2 (p. 16).**

Added a couple of sentences at the end of the section, explaining that simple regret measures how suboptimal a recommendation is, and that a bound decaying to zero faster in the number of rounds is therefore stronger.



> P13: “States are sampled according to a transition distribution that depends **only** on the current state and current action being taken (the Markov assumption).”

**Section 2.2 (p. 18).** Updated as suggested.



> P15: In a finite-horizon MDP, the policy needs to condition on the timestep (as do the value functions defined later).

Policies now condition on the timestep throughout Chapter 2, up to the point at which the timestep parameter is explicitly dropped. Definition 2.2.5 (p. 19) now defines a policy conditioning on the timestep, and the preceding paragraph explains the conditioning explicitly. The notation was then updated to match throughout the chapter:

| Location | Change |
|------------|------------------------------------|
| Definition 2.2.5 (p. 19) | Policy definition and notation |
| Definition 2.2.6 (p. 20) | Updated in trajectory definition |
| Equation 2.32 (p. 24) | Updated in Shannon entropy definition |
| Definition 2.3.5 / Equation 2.33 (pp. 24–25) | Soft value definition |
| Definition 2.3.8 / Equation 2.39 (p. 26) | Optimal soft policy definition |
| Definition 2.6.2 (p. 45) | Multi-objective trajectory |
| Equation 2.85 (p. 52) | Extracting a policy from CHVI given a weight $\mathbf{w}$ |
| Assumption 2.4.1 (p. 29) | The unique state assumption, now stated explicitly, which is what allows the timestep parameter to be dropped for the remainder of the thesis (except Section 2.6) |



> P17: It’s confusing to include RL here. You’re just doing sample-based on-line planning.

The definition I was implicitly using is that planning uses the transition distribution directly, whereas reinforcement learning uses experience. On that reading MCTS sits between the two, which the chapter now says explicitly rather than leaving implicit:

| Location | Change |
|------------|------------------------------------|
| Sections 2.3 and 2.6 | Headings renamed from "Reinforcement Learning" to "Planning and Reinforcement Learning" |
| Section 2.3 (p. 21) | Roadmap paragraph added, making clear that the section is definitional and covers no reinforcement learning algorithms |
| Section 2.3.2 (p. 26) | New section stating the distinction above, that MCTS sits between the two, and that the thesis does not consider learning function approximations in the usual machine learning sense |



> P18: “The optimal policy is the policy that maximises the objective function J, and can be shown to be deterministic.” There can be multiple optimal policies, some of which may be stochastic though there always exists at least one deterministic optimal policy.

| Location | Change |
|------------|------------------------------------|
| Definition 2.3.4 (p. 23) | No longer assumes a unique optimal policy |
| Assumption 2.3.1 (p. 23) | States that the theory in the thesis assumes a unique deterministic optimal policy, and why: it simplifies the proofs and allows statements about a converging sequence of policies, such as $\pi_n \rightarrow \pi^*$, which implicitly assumes uniqueness |
| Section 4.5 (p. 108) | Added to the list of assumptions made for the proofs in Chapter 4 |



> P39: discuss implications of assuming linear scalarisation

**Section 2.6.2 (p. 52); forward reference on p. 46.**

Added a new section discussing the implications explicitly, with a forward reference to it where the suggestion was made.



> P41: the MCCS or a MCCS?

**Figure 2.12(b) (p. 48).**

Updated the caption to be more precise about the sets of values and policies, and to be more precise that there may not be a unique minimal convex coverage set (as using "the" would suggest).


> CH3: “replacing the Shannon entropy regulariser **with** other entropy regularisers” 

**Section 3.3 (p. 58).** Updated as suggested.



> P53: Reiterate here the motivation for online MO planning.

**Section 3.5 (p. 62).**

Most prior work in MOMCTS targets the unknown weights scenario or a close variant: search is run offline and a policy is extracted at execution time. The exception is Distributional MCTS, which targets the ESR criterion under a known utility, and so the known weights scenario. A paragraph saying this has been added, pointing back to the scoping section (Section 1.2) and the unknown weights scenario (Section 2.6) introduced for correction P2.


> P56: “In maximum entropy reinforcement learning (Section 2.3.1), entropy is added directly to the objective function rather than used as a constraint to remove ambiguity between multiple optimal policies, as in inverse reinforcement learning.” What’s the difference if the constraint will be turned into a penalty with a Lagrangian?

**Section 4.1 introduction (p. 66).**

On reflection the point was unnecessary and caused more confusion than it resolved. I was trying to argue that maximum entropy is used in two different ways:

- in maximum entropy inverse reinforcement learning, entropy resolves an ill-posed problem: many policies could match an expert's trajectories, and entropy disambiguates between them;
- in maximum entropy reinforcement learning, entropy changes the problem being solved.

Either way, the passage mostly existed to lead into the misalignment of the maximum entropy objective, so it has been replaced with a simpler sentence connecting the surrounding paragraphs.



> P59: Again, isn’t UCT’s “exploitation” in effect good local exploration?

Yes, it often is, and I would say it is problem dependent. The intention here was to give a simple example that begins to demonstrate UCT's failure mode in practise: overcommitting to suboptimal actions when the value estimates of optimal actions start poor and stay poor throughout the initial exploration. UCT is guaranteed to converge to the optimal values in theory, but in these cases that will not happen in practice. The section now makes these points explicitly:

| Location | Change |
|------------|------------------------------------|
| Section 4.1 (p. 67) | Sentence noting that UCT is a successful algorithm, and that the section aims to highlight a failure mode rather than claiming UCT is inherently bad |
| Section 4.1.1 (p. 69) | Paragraph agreeing with the comment: UCT's exploitation does act as effective local exploration when rewards are dense and informative, and the failure mode arises only when the optimal action retains a poor estimate throughout the initial exploration. Sparse or uninformative rewards, and a misleading learned heuristic, are given as examples |
| Section 4.1.1 (p. 70) | Paragraph pointing to the DeterministicGridWorld results, which show the failure mode without artificially limiting the number of trials: UCT converges in practice to a suboptimal solution in some environments |
| Figure 4.3 caption | Additional detail on what the plots show and why it is of interest |

The existing penultimate paragraph of Section 4.1.1 (p. 70) already contrasts UCT's asymptotic guarantee with its behaviour in practice, so it has been left unchanged.






> P62: which of these are not satisfied by UCT or MENTS? Why exploit if we care about simple regret?

Four paragraphs were added after the list of design aims in Section 4.2 (p. 74), addressing both questions:


| Location | Change |
|------------|------------------------------------|
| Section 4.2 (p. 74), 1st added paragraph | The design aims are motivated by the exploration setting of reinforcement learning in practice, with a finite planning budget |
| Section 4.2 (p. 74), 2nd added paragraph | Simple regret is used to give theoretical guarantees about asymptotic performance, not to motivate the design |
| Section 4.2 (p. 74), 3rd and 4th added paragraphs | Each design aim in turn: whether UCT or MENTS satisfies it, and why it matters in the exploration setting |
| Section 4.1.3 (p. 72) | Simple regret was still described as motivating the algorithms in one remaining place: "used *to motivate and analyse*" → "used *to analyse*" |
| Section 4.4.3.1 (p. 100) | The FrozenLake results show where exploitation was useful, referring back to Equation 4.36 (p. 96) to explain that it avoids falling back to the uniform policy |





> P63: “Uses a Boltzmann search policy with decayed temperature similar to [8], but includes an additional uniform exploration term similar to MENTS” Why? Very procedural with no motivation, which of the above problems are you solving? Why do we need two exploration terms?

**Section 4.2.1 (p. 75).**

Added reasoning at the start of the section. The two terms explore in different ways: Boltzmann exploration is centred on the current value estimates, so focuses the search on actions that are currently competitive, whereas uniform exploration continues to sample actions those estimates rate poorly. The uniform term is retained because it provides the convergence guarantee even if the Boltzmann temperature is decayed close zero and the Boltzmann policy becomes greedy.


> CH5a: Why do we need this approach based on ball? Why not learn separate values for each objective and dot-product them with the weights?

Taking the two questions separately.

**Why not learn separate values for each objective?** As I understand the suggestion, this means storing a vector value estimate at each node and taking utilities from it as needed. Some prior work does exactly this, and the CHMCTS paper contains an example of why it is flawed that was not carried into the thesis. The argument from the CHMCTS paper is now included, along with a more informal generalisation of why a single vector is insufficient in general:

| Location | Change |
|------------|------------------------------------|
| Section 3.5.1 (p. 63) | New subsection in the related work on MOMCTS, giving the counterexample and the informal generalisation |

**Why the approach based on balls?** The balls are not a design choice made for their own sake: they are Contextual Zooming's representation of the context space. The contextual multi-armed bandit problem is defined in Section 2.1.3. Because Section 5.1.2 poses MOMCTS as a contextual problem, CZT exists largely to answer pre-emptively whether a contextual bandit algorithm can be run at each node in place of UCB in UCT. A secondary reason is to provide a UCT-like baseline for MOMCTS, where none previously existed.

| Location | Change |
|------------|------------------------------------|
| Section 5.2 (p. 132) | Sentence added at the start of the section making this framing explicit |

The third paragraph of Section 5.2 (p. 132) already states that CZT serves as a baseline where none exists, so no change was needed there.



> CH5b: Again, be clear about the motivation here, and consider switching to unknown weights scenario.

**Section 5.1 (from p. 129).**

The switch to the unknown weights scenario is covered under correction P2. In addition, the introduction and motivation of Chapter 5 have been reorganised and rewritten to be consistent with that change: Section 5.1.1 now sets out the consistent action selection problem, and Section 5.1.2 motivates contextual tree search as the response to it.



> "P132: “It is worth noting that in multi-objective MCTS, the quality of the convex hull at the root node is the primary concern.” Why? This is a big unsupported claim"
> 
> and
> 
> P132: “A more efficient online approach is therefore to run the multi-objective tree search from the initial state, and subsequently follow a single-objective MCTS algorithm in the scalarised MDP with reward R(s,a; w) = w$^\top$R(s,a), where w is inferred from the choice made at the root node.” The choice may not disambiguate w, which is another reason why unknown weights would give a cleaner motivation. Also, explain why building an MCTS tree is a good way to use the offline planning budget, compared to just learning better prior policies and value functions that apply in any state. Finally, if this only makes sense assuming a deterministic initial state, that needs to be stated clearly up front.

The new scoping section added for correction P2 states all of this up front, so the claim no longer rests on the passage quoted:

| Location | Change |
|------------|------------------------------------|
| Section 1.2 (p. 4) | Planning is run from a known initial state; the algorithms are evaluated as offline planners; the unknown weights scenario is used, with the weight revealed after planning; online planning at evaluation time therefore reduces to single-objective MCTS; and MCTS methods remain relevant beyond simply learning function approximators |
| Section 5.4.2 (p. 147) | Opening rewritten consistently with those changes, referring back to Sections 1.2 and 2.6. Because the algorithms are run during the planning phase of the unknown weights scenario, metrics computed at the initial state are the relevant ones |

Moving to the unknown weights scenario, as suggested, also removes the problem of a user's choice not disambiguating the weight vector: the weight is revealed directly rather than inferred.


> P134: Why is improvement not monotonic? (later plots as well)

There are two reasons for the non-monotonic trends in Figure 5.4 (p. 150). For CZT, the hypervolume is estimated from a set of vectors that are sample averages, which may vary over the algorithm's runtime, and from the relevant set of balls, which also changes over the runtime. For the CHMCTS algorithms, the convex hull value sets are pruned to a maximum size (Section 5.3.6 and Equation 5.40), and that pruning breaks the monotonicity of convex hull backups with respect to hypervolume.

The non-monotonic trend in Figure 5.5 (p. 152) had a different cause, which was a mistake: the EUM for CZT in Figure 5.5a used an old, incorrect version of the recommendation policy (Equation 5.13), taking the maximum over all balls rather than only the relevant ones. This has been corrected, and the plot now shows a monotonic improvement in EUM.

The explanations were added to the main text as follows:

| Location | Change |
|------------|------------------------------------|
| Equation 5.44 (p. 148) | States explicitly how the hypervolume is approximated for CZT, referenced where the non-monotonicity is discussed on p. 149 |
| Section 5.4.3 (p. 149) | Paragraph at the start of the MO-Gymnasium results giving the two reasons above for Figure 5.4 |
| Equation 6.25 (p. 182) | States explicitly how the hypervolume is computed for simplex maps |
| Section 6.4.2 (p. 184) | Paragraph referring back to the explanation above, since the non-monotonic CZT and CHMCTS results in Figure 6.7 (p. 183) are repeated from Figure 5.4 |


> P148: concave -> convex

**Section 6.1 (p. 170).** Updated as suggested.



> P163: correct x-axis on figure size to env size/width, not search time.  Also ensure Fig 6.10 is discussed in the text, and the non-monotic trends and fully explained.  (also applies to Fig 5.7 on page 138)

| Location | Change |
|------------|------------------------------------|
| Figures 5.7 (p. 154) and 6.10 (p. 186) | x-axis corrected to show "Environment Size" rather than search time |
| Section 5.4.4 (p. 153) | Description added at the start of the section of the non-monotonic trends in Figure 5.7, and why they occur |
| Section 6.4.3 (p. 185) | Paragraph at the start of the section referring back to the explanation in Section 5.4.4, for the algorithms repeated from Chapter 5 |
| Section 6.4.3 (3rd paragraph, p. 186) | Paragraph describing the additional non-monotonic trends in the EUM plots of Figure 6.10, for SM-BTS and SM-DENTS |


> P208 -Fig D.1 - is this really a CDF? Not in the conventional sense?  Suggest to explain more or reword

I would like to apologise for the state that Appendix D was in at the time of submission. Figure D.1 was erroneously a duplicate of Figure 4.18, and the corresponding corollary was duplicated between Chapter 4 and Appendix D. I have removed the duplicate from Appendix D and applied corrections in Chapter 4:
| Location | Change |
|------------|------------------------------------|
| Corollary 4.5.1 (pp. 112–113) | Proof outline replaced with a full proof, making the constructed probability mass and cumulative distribution functions explicit |
| Figure 4.18 (p. 112) | Redrawn to match the construction used, with the caption now referring to it |
| Appendix D | Duplicate corollary and figure removed |


> Fix broken cross-refs - a search for ‘??’ found 10 of them.

These were all in Appendix D, and I apologise again that it was submitted in an unclean state. Appendix D has been cleaned up, and the thesis now builds with no undefined references or citations, so no "??" remain anywhere.



> BayesOpt is one of many possible parameter / hyper-parameter packages - say a bit more about why this was chosen (convenience of C++ implementation etc) and whether the parameter tuning generally made much of a difference. Also consider whether these are parameters or hyper-parameters (arguably these are just parameters).

| Location | Change |
|------------|------------------------------------|
| Appendix B (p. 208) | Notes why BayesOpt was chosen: it provides a C++ interface, which integrated easily with the C++ implementation of THTS++ used throughout |
| Appendix B (p. 209) | Paragraph explaining that the tuning does make a significant difference, and noting that parameters with little effect on performance end up set to somewhat arbitrary values by the optimisation |

I agree that "hyper-parameter" is not the right term. Every instance has been changed to either "parameter" or the more specific "algorithm parameter", using the latter by default and the former where the fuller term reads awkwardly or the context already makes it clear. There are too many to list individually, but all are marked as corrections, and can be found by searching the PDF for "parameter". I have confirmed that no instance of "hyperparameter" or "hyper-parameter" remains.
