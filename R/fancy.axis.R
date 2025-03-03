#' Plot axis with rug
#'
#' @param side which side to plot the axis
#' @param space.main spacing between main ticks
#' @param number.sub number of sub ticks between main ticks. If a vector is prodided, smaller sub ticks are plotted between sub ticks
#' @param lim axis limits
#' @param plot.lab If TRUE, plots tick labels. Otherwise, tick labels are not plotted
#' @param tk.lab labels for main ticks
#' @param tk.size size of main and sub ticks. Must be of length 1+length(number.sub), otherwise values are recycled
#'
#' @export

fancy.axis = function(side = 1, space.main, number.sub = 0, lim, tk.size = -0.05,
                      plot.lab = TRUE, tk.lab){

  #check if inputs are valid
  if(!any(side %in% 1:4)) stop("invalid side")

  if(!missing(space.main)){
    if(!is.number(space.main) | length(space.main) != 1) stop("invalid space.main")
  }else{
    stop("missing space.main with no defaults")
  }

  if(any(number.sub %% 1 != 0)) stop("invalid number.sub")

  if(!missing(lim)){
    if(!is.number(lim) | length(lim) != 2) stop("invalid lim")
  }else{
    stop("missing lim with no defaults")
  }

  if(!is.number(tk.size)) stop("invalid tk.size")

  if(!is.logical(plot.lab)) stop("invalid plot.lab")

  if(!missing(tk.lab)){
    if(!length(tk.lab) != space.main) stop("length(tk.lab) must be equal to space.main")
  }

  #main ticks
  tk = seq(lim[1], lim[2], by = space.main)
  space = diff(lim)/(length(tk)-1)

  if(missing(tk.lab)){
    if(plot.lab){
      tk.lab = tk
    }else{
      tk.lab = rep("", length(tk))
    }

  }

  axis(side, at = tk, labels = tk.lab)


  #sub ticks
  tk.sizeLenDiff = length(number.sub) + 1 - length(tk.size)

  if(tk.sizeLenDiff > 0){
    tk.size = cbind(tk.size, rep(tk.size[length(tk.size)], tk.sizeLenDiff))
  }

  for(i in 1:length(number.sub)){
    tk2 = seq(lim[1], lim[2], by = space/(number.sub[i]+1))
    space = diff(lim)/(length(tk2)-1)

    tk = setdiff(tk2, tk)
    rug(side = side, x = tk, ticksize = tk.size[i+1])

  }

}

