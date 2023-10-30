library(tictoc)

# Aim: Execute script of Assignment 4 faster using parallel computing tools 
# and comparing the different methods.
 
# Timing
printTicTocLog <- function() {
    tic.log() %>%
      unlist %>%
      tibble(logvals = .) %>%
      separate(logvals,
               sep = ":",
               into = c("Function type", "log")) %>%
      mutate(log = str_trim(log)) %>%
      separate(log,
               sep = " ",
               into = c("Seconds"),
               extra = "drop")
}

# Running scripts
tic("Regular loop")
source("scripts/Solution1.R")
toc(log = TRUE)

tic("DoParallel loop ")
source("scripts/Solution2.R")
toc(log = TRUE)

tic("furrr loop ")
source("scripts/Solution3.R")
toc(log = TRUE)

# Discussion of results
printTicTocLog() %>%
  knitr::kable()


#----
# |Function type   |Seconds |
#   |:---------------|:-------|
#   |Regular loop    |17.08   |
#   |DoParallel loop |17.912  |
#   |furrr loop      |14.668  |

# Using furrr yields the best time. The regular script and the script where "doParallel"
# perform similarly, with the latter being a little bit slower. 
# It might show the advantage of using purrr/furrr instead of the base functions. 

# Also it is important, where the parallelization is applied in the script.

