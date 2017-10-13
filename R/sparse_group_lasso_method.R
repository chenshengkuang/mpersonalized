sparse_group_lasso_method = function(modelYlist, modelXlist, Ybarlist, Xbarlist, Xsdlist, lambda, alpha){

  q = length(modelXlist)
  p = dim(modelXlist[[1]])[2]

  x = as.matrix(bdiag(modelXlist))
  y = unlist(modelYlist)
  total_n = length(y)

  x = sqrt(2 * total_n) * x; y = sqrt(2 * total_n) * y

  data = list(x = x, y = y)
  SGL_model = SGL(data = data, index = rep(1 : p, q), lambdas = lambda, alpha = alpha, standardize = FALSE)
  if (is.null(lambda))
    lambda = SGL_model$lambdas

  nlambda = length(lambda)
  betalist = vector("list", nlambda)
  interceptlist = vector("list", nlambda)

    for (ind in 1:nlambda){

    beta = matrix(SGL_model$beta[, ind], nrow = q, ncol = p, byrow = TRUE)
    intercept = unlist(Ybarlist) - apply(beta * matrix(unlist(Xbarlist), nrow = q, ncol = p, byrow = TRUE), 1, sum)
    beta = beta / matrix(unlist(Xsdlist), nrow = q, ncol = p, byrow = TRUE)

    betalist[[ind]] = beta
    interceptlist[[ind]] = intercept
  }

  return(list(interceptlist = interceptlist, betalist = betalist,
              lambda = lambda))
}