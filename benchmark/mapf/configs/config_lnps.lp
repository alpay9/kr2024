#program config.

_lnps_project(at, 3).
_lnps_destroy(at, 3, 7, p(15)).   % Destroys 15% of paths

% Priority-based search
% _lnps_prioritize(at, Dist, Priority, Propagate)
_lnps_prioritize(at, 3, 1, true).