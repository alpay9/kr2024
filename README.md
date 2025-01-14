# Solving Multi-Agent Pathfinding using Large Neighborhood Prioritized Search

This project is still under development and it uses the heulingo solver. (https://github.com/banbaralab/kr2024)

### Requirements
- [clingo](https://potassco.org/clingo/) version 5.6 or higher

### Multi-Agent Pathfinding using Large Neighborhood Search

```
python3 solver/heulingo.py \
    --heulingo-configuration=mapf \
    --opt-strategy=bb,hier \
    --parallel-mode=1 \
    --solve-limit=100000,300 \
    --iter-opt-mode=opt \
    --iter-solve-limit=20000 \
    --del-max=50000 \
    --deletion=basic,75,mixed \
    --heuristic=Vsids,50 \
    benchmark/mapf/mapf.lp \
    benchmark/mapf/configs/config_lns.lp \
    benchmark/mapf/instances/random_s10_a5_c75_h14.lp \
    -c maxT=50
```

### Multi-Agent Patfinding using Large Neighborhood Prioritized Search

```
python3 solver/heulingo.py \
    --heulingo-configuration=mapf \
    --opt-strategy=bb,hier \
    --parallel-mode=1 \
    --solve-limit=80000,200 \
    --iter-configuration=handy \
    --iter-opt-strategy=bb,hier \
    --iter-opt-heuristic=sign,model \
    --iter-restart-on-model \
    --iter-heuristic=Vsids \
    --iter-opt-mode=opt \
    --iter-solve-limit=20000 \
    --solve-limit-increase-rate=10.0 \
    --acceptance-rate=0 \
    --del-max=50000 \
    --deletion=basic,75,mixed \
    benchmark/mapf/mapf.lp \
    benchmark/mapf/configs/config_lnps.lp \
    benchmark/mapf/instances/random_s10_a5_c75_h14.lp \
    -c maxT=50
```
