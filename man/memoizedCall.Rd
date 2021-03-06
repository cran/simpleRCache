% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/memoizedCall.R
\name{memoizedCall}
\alias{memoizedCall}
\title{Call a Memoized Function}
\usage{
memoizedCall(fcn, ...)
}
\arguments{
\item{fcn}{a function}

\item{...}{the arguments to the function}
}
\value{
result of memoized function
}
\description{
Call a Memoized Function
}
\note{
If the environment variable DEBUG_SIMPLERCACHE is set, then the
keyHash will be outputted. This can be used to identify cache RDS files.
}
