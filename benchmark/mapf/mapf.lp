%=============================================================================
% MAPF Encoding for Minimizing Makespan with a Bounded Time Horizon
%=============================================================================

% A user-specified maximum time horizon (e.g., -c maxT=40 on the command line)
#const maxT = 30.

% Time steps: 0..maxT
time(T) :- T = 0..maxT.

% Exactly one position per agent at each time step.
1 { at(A,V,T) : vertex(V) } 1 :- agent(A), time(T).

% Initial condition: each agent must start at its specified location at time 0.
:- start(A,S), not at(A,S,0).

% Final condition: each agent must be at its goal location at *some* time
reached_goal(A) :- at(A,V,T), goal(A,V), time(T).
:- agent(A), not reached_goal(A).

% Valid moves: from V1 at time T to V2 at time T+1 only if V1 = V2 or edge(V1,V2).
:- at(A,V1,T), at(A,V2,T+1), V1 != V2, not edge(V1,V2).

% Vertex Conflict: no two agents can occupy the same vertex at the same time.
:- at(A1,V,T), at(A2,V,T), A1 < A2.

% Edge conflict: no two agents swap positions in the same time step.
:- at(A1,V1,T), at(A1,V2,T+1),
   at(A2,V2,T), at(A2,V1,T+1), A1 < A2.

% For debugging or post-processing
move(A,V1,V2,T) :- at(A,V1,T), at(A,V2,T+1), V1 != V2.
wait(A,V,T)     :- at(A,V,T),  at(A,V,T+1).

% Define "makespan" as the maximum time an agent arrives at its goal.
makespan(M) :- M = #max { T : at(A,V,T), goal(A,V) }.

% Objective: minimize the makespan
#minimize { M : makespan(M) }.

% Optional #show statements
#show at/3.
% #show move/4.
% #show wait/3.
#show makespan/1.
