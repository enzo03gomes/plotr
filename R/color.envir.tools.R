#' Select color palette
#'
#' @description
#' Loads a palette preset to use.
#'
#'
#' @param palette name of color palette. Use `view.palette()` to see available color palettes.
#'
#' @references
#' Palettes "IBM", "wong" and "tol" from \url{https://davidmathlogic.com/colorblind/}
#'
#' @keywords "Color Palette"
#' @export


load.palette = function(palette){
  #check input
  if(!is.character(palette) | length(palette) != 1){
    stop("palette is not a valid name")
  }

  #load palette
  p = .colorEnvir$palette.list

  if(!any(palette %in% names(p))){
    stop("palette is not a valid name")
  }

  out = list(p[[palette]])
  names(out) = palette

  .colorEnvir$current.palette = out
  invisible(NULL)
}


#' Check which palette is being used
#'
#' @description
#' Prints the palette currently loaded
#'
#'
#' @keywords "Color Palette"
#' @export

this.palette = function(){
  out = print.single(.colorEnvir$current.palette)

  return(invisible(out))
}


#' View available color palettes
#'
#' @description
#' View palette presets available by printing them on the console.
#'  Colors can be assigned to a variable if `palette` is not empty.
#'
#' @param palette name of color palette. If empty, all palettes are shown.
#'
#' @keywords "Color Palette"
#' @export

view.palette = function(palette){
  #import variables from package environment
  p = .colorEnvir$palette.list


  #print palette
  if(missing(palette)){ #print all available palettes

    lapply(names(p), function(x) print.single(p, unlist(x)))
    invisible(NULL)

  }else{

    if(length(palette) == 1){ #print only one palette

      out = print.single(p, palette)

    }else{ #print multiple palettes and return as a list
      ID = lapply(palette, function(x) which(names(p) == x)) |> unlist()

      p = p[ID]

      out = lapply(names(p), function(x) print.single(p, x))

    }

    return(invisible(out))
  }
}


#' Modify color palette
#'
#' @description
#' Modifies name and/or colors of a palette preset. Palettes provided with the package cannot be modified.
#' WARNING: changes to palettes are permanent and cannot be reverted.
#'
#' @param palette palette to modify.
#' @param new.name new palette name.
#' @param new.colors colors to assign to palette.
#'
#' @keywords "Color Palette"
#' @export

mod.palette = function(palette, new.name, new.colors){
  #load palettes and blacklist
  p = .colorEnvir$palette.list
  permanent = .colorEnvir$blacklist

  #check if inputs are valid
  if(!any(palette %in% names(p))){
    stop("palette is not a valid name")
  }
  if(!missing(new.name)){
    if(!is.character(new.name) | length(new.name) != 1){
      stop("palette must be a character of length 1")
    }
  }
  if(!missing(new.colors)){
    if(!is.hex(new.colors)){
      stop("col contains invalid colors")
    }
  }

  #find palette position in list
  ID = which(names(p) == palette)

  #check if provided palette is not blacklisted
  if(!any(ID %in% permanent)){

    #change colors
    if(!missing(new.colors)){
      .colorEnvir$palette.list[[palette]] = new.colors
    }

    #change names
    if(!missing(new.name)){

      #check if name is already in use
      if(!any(new.name  %in% names(p))){
        names(.colorEnvir$palette.list)[ID] = new.name

      }else{
        stop(paste0("palette named \"", new.name, "\" already exists"))
      }
    }



  }else{ #if palette is blacklisted, warn user
    stop("selected palette cannot be modified")
  }

  invisible(NULL)
}



#' Save palette as preset
#'
#' @description
#' Saves a vector of 6-digit HEX values as a palette.
#'
#' @param palette name of palette
#' @param col vector of 6-digit HEX values
#'
#' @keywords "Color Palette"
#' @export

save.palette = function(palette, col){
  #load palettes
  p = .colorEnvir$palette.list

  #check if inputs are valid
  if(!is.character(palette) | length(palette) != 1){
    stop("palette must be a character of length 1")
  }

  if(!is.hex(col)){
    stop("col contains invalid HEX")
  }

  #check if any palette has the name name
  if(!any(palette %in% names(p))){

    #add palette
    .colorEnvir$palette.list[[palette]] = col
  }else{
    stop(paste0("palette named \"", palette, "\" already exists"))
  }

  invisible(NULL)
}



#' Delete palette preset
#'
#' @description
#' Deletes a palette preset. Palettes provided with the package cannot be deleted.
#' WARNING: changes to palettes are permanent and cannot be reverted.
#'
#' @param palette palette to delete
#'
#' @keywords "Color Palette"
#' @export


delete.palette = function(palette){
  #load palettes and blacklist
  p = .colorEnvir$palette.list
  permanent = .colorEnvir$blacklist

  #check if inputs are valid
  if(!any(palette %in% names(p))){
    stop("palette is not a valid name")
  }

  #find palette position in list
  ID = which(names(p) == palette)

  #check if palette is blacklisted
  if(!any(ID %in% permanent)){
    .colorEnvir$palette.list[[palette]] = NULL
  }

  invisible(NULL)
}




