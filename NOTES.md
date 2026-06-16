# Viva Prep Sheet 

## -1. Notation + Misc
- **TODO** = indicates something to update during corrections (not happy with final version unless do)
- **TODOnow** = indicates something to address now
- **TYPO** = typo (or misphrasing)
- **QUESTION** = question anticipating
    - **ANSWER** = answer to anticipated question
- **Nitpick** = something to fix, but hopefully not an issue (also less of an issue if don't correct)
- **DoubleCheckQ** = something to double check (and could be a question)
    - **DoubleCheckA** = answer to the double check question

### *TODO NOW (needed for presentation/viva)*
- **TODOnow**: handle section 1 inline **TODOnow**'s
- **TODOnow**: handle double check Q in 1.2
- **TODOnow**: MOMCTS litrev table (make sure litrev is done for the most relevant papers, remember read papers and wrote Ch3 more clearly, so use actual thesis for this)
    - Reference numbers = [103,71,72,73,23,111,42,44]
    - **TODOnow**: Double check Section 3.5 after is consistent
- **TODOnow**: BRUE litrev table + update notes on it (Section 3.3)
    - Reference numbers = [32]
    - **TODOnow**: Double check Section 3.3 after is consistent
- ~~**TODOnow**: Ch6 scalability figures - missing CHVI w/out prioritised sweeping~~
- ~~**TODOnow**: Ch6 scalability figures - incorrect x-axis. Search Time -> Environment width~~

### *TODO NOW (would like to have for presentation/viva)*
- **TODOnow**: Ch3.4 refs in litrev, specifically the MOO algorithms [94] + NSGA-II
    - **TODOnow**: Generally make sure all of the Ch3.4  refs are in litrev table
        - Reference numbers = [94,28,81,79,104,105,7,56,57,100,20,74,35,79,42,44,63,1,110]
        - **TODOnow**: Double check Section 3.4 after is consistent



## IMPORTANT STUFF

Research Questions:
1. *Exploration*: How to prioritise exploration in MCTS algorithms to make more effective decisions?
    1.1. *Entropy*: What conditions is it compatible with optimal decision making?
    1.2. *MO Exploration*: Can (maximum entropy) exploration insights be applied to multi-objective MCTS?
2. *Stochastic MOMCTS*: Can MOMCTS be generalised to stochastic domains?
3. *Scalability*: How can scalability be improved of MCTS methods?
    3.1. *Complexity*: MCTS complexity can be reduced from $O(nAH)$?
    3.2. *MO Scalability*: How scalable are MOMCTS algorithms wrt environment size?

Things that should really be in slides:
- Exploration setting diagram
- **TODOnow** Ch4 stuff
- Motivation of Boltzmann stuff
    - Issues of UCT
    - Issues of MENTS
        - Misalignment
    - Intro MDP
    - Stochastic FL, useful level of entropy is past the misalignment threshold
- Ch5 overview
    - Two ideas for algorithms
        - CZT = apply contextual zooming 
        - Using ConvexHull backups (from CHVI) 
- Corrected results @ end
    - Resource Gathering
    - DST(W,1/40)



## 0. Abstract + Preamble

Abstract:
- **TYPO**: saying entropy objective always misaligned isn't 100% correct, 
- **TYPO**: paragraph 2, Upper Confidence Bound -> should be UCT, so Upper Confidence Bound applied to Trees (UCT)
- **Nitpick**: generally could do with another round or two of rewriting :/

List of Figs:
- **TODO**: another round of proofreading short captions :/

List of Abbrv + List of Notation
- **TYPO**: MCTS-1 and THTS++ acronyms not bolded
- **TYPO**: need to do some human readable proof read of list of notation (subtitles have new lines inconsistently added)



## 1. Intro
- **TODOnow**: Notes on full proof read
- Outlines + motivates thesis

1.1. Overview
- **TODOnow**: Notes on full proof read
- Outlines thesis

1.2. Contributions
- List of research questions (see above)
- Indicates where each chapter addresses each question
- **DoubleCheckQ**: ensure that have actually answered Q1.1., think this needs the MENTS only garunteed to converge if $\alpha$ small enough. Alternatively, we discuss misalignment threshold.
    - **TODO**: write the **DoubleCheckA**. Might be more precise to 

1.3. Overview
- Says what each chapter contributes



## 2. Background

2.1. Multi-Armed Bandits
- K-Armed bandits + UCB
- Exploring bandits
- Contextual bandits 

2.2 Markov Decision Processes
- Definitions (MDP, trajectory, policy etc)

2.3. Reinforcement Learning
- Exploration setting motivation
- Basic definitions for RL (value functions, objective function, value iteration etc)
- Maximum entropy

2.4. Trial-Based Heuristic Tree Search + Monte Carlo Tree Search
- Defining THTS++ framework
- Outline UCT + PUCT + MENTS

Figure 2.8 - THTS++ diagram (p25)
- **TODO**: More clarity in the caption. How does loop between seleciton and heuristic work?
    - In more detail: Selection always continues until a new decision node reached. Heuristic initialises the value
    - If single node expansion, always continue to backup
    - If not single node expansion, return to selection, unless new decision node corresponds to sink state

2.5. Convergence of Random Variables
- Definitions of results that are useful for theory
    - Proofs
    - Good Turing for stochastic labelling proceedure

2.6. Multi-Objective RL
- Repeats section 2.3 but with multiple objectives, sticking to decision support scenario
- Outlines solution sets
- Convex Hull Value Iteration



## 3. Related Work
- only making notes on things that need to update

3.3. MCTS
- **TODO**: Actually describe what Labelling does in LRTDP
- **TODO**: Doesn't BRUE have a switching point from uniform (exploration) to UCB (exploitation) each trial? (Going to update in litrev table and should update it to be correct)
- **TYPO** \cite -> \citet for MENTS ref
    - **TODO**: do a ctrl-f search for \cite and check that using correct version everywhere



## 4. MCTS with Boltzmann Exploration

Figure 4.2 - Intro MDP (p58)
- **TYPO**: last sentence could be clearer. is large so that -> is large enough such that

Figure 4.3 - Intro MDP results (p59)
- **TYPO**: should be 10, not 1
- **TODO**: Additional prose on what the point of this plot is?
    - Point is to show that BTS+DENTS are less sensitive to hyperparams
    - UCT shows greediness on LHS of plot (a), and not converged on RHS
    - MENTS show misalignment on RHS of plot (a)

Theorem 4.3.1 (p107)
- **TYPO**: spurious "and"? Actually think it is gramatically correct, but it reads weirdly



## 5. CHMCTS

Section 5.1. Intro + Motivation
- **TODO**: emphasize it being the LINEAR utilities for contextual tree search to work
- **TODO**: forward ref the theorem

Figure 5.2
- **TYPO**: Reproduced is wrong word. Should be adapted

Section 5.6
- **TODO**: Be more clear on convex hull size pruning is used in the core convex hull implementation (even in CHVI) otherwise it just blows up in stochastic cases
- **QUESTION**: why is the pruning necessary?
    - **ANSWER**: even if optimal CH has small number of points, intermediate CH's may blow up from the randomness
    - **TODO**: explain this in the thesis 

Figure 5.4 - CHMCTS gym results
- **QUESTION**: why does hypervolume go down in Fig 5.4(b) / is so large in Fig 5.4(d)
    - **ANSWER**: bug. was trying to use optimistic heuristic like in ch4. so roughly hypervolumes are shifted.
    - **TODO**: re-run all Ch5+6 experiments (involving CZT)

Figure 5.4 - CHMCTS gym results
Figure 5.5 - CHMCTS dst results
Figure 5.7 - CHMCTS scalability results
Figure 6.X - corresponding Ch6 figs
Generally any figure with CHVI in it
- **QUESTION**: is CHVI using NSGA-II pruning method too?
    - **ANSWER**: yes its in the core CH implementation

Theorem 5.5.1. - MOMCTS iff linear utility
- **TYPO**: multiple, add a * to $\pi_{local}$, and properly define the optimal policy $\pi^{\bff{w}}_u$, probably add a * in that too
- **TYPO** conditional MOMDP should be at the start



## 6. Simplex Maps

Figure 6.3
- **TODO**: right looks a bit janky. Actually just label the vertices and refer to the triangles like that. Can SHADE the triangles in instead.

Figure 6.4
- **TODO**: missing green and red dot in fig (a)

Figure 6.5
- **TODO**: same as Figure 6.3. Just label the vertices and refer to the line segments.

Figure 6.6
- **TODO**: Thick green arrows, also add a barrier around the red vertex?

Figure 6.10 (p163)
- **TODO**: update figures, incorrect 
- **QUESTION**: did we follow up on bad result of DST(W,1/40)?
    - **ANSWER**: Yes. Reran optimization. This time $\epsilon$ parameters tuned to a lower value (~0.1 vs ~0.4 and ~0.7). Still think could hand tune entropy exploration in this case to get better performance, but would be unfair methodologically (be the only hand tuned parameter in thesis)
- **QUESTION**: why does CZT outperform in noisy envs with largest environment sizes
    - **ANSWER**: Algos run for 15sec, exploring algorithms dont converge as quickly + hyperparams tuned on env size 10
    - **TODO**: Add 421 results too as additional explanation of the processes not converging for the largest environments (421 runs for 60 seconds)



## 7. Conclusion

- **TYPO**: better phrasing than Deep BTS and DENTS
- **TODO**: should add extending the observations of maximum entropy 
