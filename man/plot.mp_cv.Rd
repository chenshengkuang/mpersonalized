% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/plot.R
\name{plot.mp_cv}
\alias{plot.mp_cv}
\title{Interaction Plot for an "mp_cv" Class Object.}
\usage{
\method{plot}{mp_cv}(x, ...)
}
\arguments{
\item{x}{A fitted 'mp_cv' class object returned by \code{mpersonalzied_cv} function}

\item{...}{not used}
}
\value{
A list object representing the interaction plots for the optimal penalty parameter configuration.
Specifically, \eqn{k}th element is the interaction plot for the \eqn{k}th study/outcome.
}
\description{
This function plots interaction between received treatment and recommended treatment,
given the optimal penalty parameter.
}
\examples{
set.seed(123)
sim_dat  = simulated_dataset(n = 200, problem = "meta-analysis")
Xlist = sim_dat$Xlist; Ylist = sim_dat$Ylist; Trtlist = sim_dat$Trtlist

# fit different rules with lasso penalty for this meta-analysis problem
mp_cvmod_diff = mpersonalized_cv(problem = "meta-analysis",
                                 Xlist = Xlist, Ylist = Ylist, Trtlist = Trtlist,
                                 penalty = "lasso", single_rule = FALSE)

plots = plot(x = mp_cvmod_diff)
set.seed(NULL)
}
