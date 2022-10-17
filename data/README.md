# data
 
- `data_ddm_params.csv`: data with fitted DDM parameters for each subject
    - `id`: subject id
    - `condition`: only conditions 0 and 1 are included in the analysis
    - `driftb0`: drift b0 parameter
    - `driftb1`: drift b1 parameter (weight on accuracy)
    - `B`: boundary parameter
    - `x0`: starting-point parameter
    - `nondectime`: non-decision time parameter
- `data_explore_before_prereg.csv`: data for exploration (before preregistration)
    - `id`: subject id
    - `condition`: only conditions 0 and 1 are included in the analysis
    - `rating2`: binarized choice (0: don't share, 1: share)
    - `rt`: reaction time in seconds
    - `perc_acc`: headline accuracy rating 
- `data_prereg_analysis.csv`: data for preregistered analysis
    - same variables as above