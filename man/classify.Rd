\name{classify}
\alias{classify}
\title{ classify}
\description{
classifies data
}

\usage{
classify(data, train, metric = "bayes")
}

\arguments{
  \item{data}{ data to classify}
  \item{train}{training data}
  \item{metric}{bayes or mahal}
}

\value{
The calssification matrix.
}

\author{ Jonathan Harrington }


\examples{

## The function is currently defined as
function (data, train, metric = "bayes") 
{
    probs <- distance(data, train, metric = metric)
    if (metric == "bayes") {
        best <- apply(probs, 1, max)
    }
    else if (metric == "mahal") {
        best <- apply(probs, 1, min)
    }
    result <- rep("", length(best))
    for (lab in 1:length(train$label)) {
        tmp <- probs[, lab] == best
        result[tmp] <- train$label[lab]
    }
    result
  }
}


\keyword{models}
