1. 33
2. 3
3. Conditional: 2, Unconditional: 3
    - c:  17,26
    - uc: 21,30,34
4. [debug line = 11:7]
5.
    - `ICount`: total static instructions in the LLVM bitcode
    - `Instrs`: number of executed instructions
    - Symbolic:
        - `ICount`: 27
        - `Instrs`: 33
    - Non-symbolic:
        - `ICount`: 26
        - `Instrs`: 22
    - Need to explain?
6. 
    - a. get_sign - 2 forks
    - b. 8,11 - 1 at each
    - c. 10,19 - 1 at each
7. 
    - cat-arg - 20s
    - cat-stdin - 5s
    - cat-version - 4s
8.
    - `--search=dfs`: use Depth First Search (DFS)
        - 1. 60
        - 2. 60
        - 3. refer to images
        - 4. refer to images
        - 5. 7,036
    - `--search=bfs`: use Breadth First Search (BFS), where scheduling decisions are taken at the level of (2-way) forks
        - 1. 1280
        - 2. 1280
        - 3. refer to images
        - 4. refer to images
        - 5. 7,072
    - `--search=random-path --search=nurs:covnew`: use Random Path Selection (see OSDI'08 paper), use Non Uniform Random Search (NURS) with Coverage-New
        - 1. 65370
        - 2. 65370
        - 3. refer to images
        - 4. refer to images
        - 5. 7,079
    - Compare the effectiveness of each search strategy with respect to instruction coverage 
9. 137 symbolic load instructions - run with arg: `--sym-arg 2 /etc/hostname --sym-stdin 1`
10. 
    - a. 
        - dfs: 53.26 MB
        - bfs: 58.37 MB
        - sym: 53.73 MB
    - b.
        - dfs: 7036
        - bfs: 7073
        - rcov: 7121
        - sym: 5280