# Ulster University Style Guide
# UU Colours
ulster_colour <- c(
  `core blue` = "#041E42",
  `deep blue` = "#151F6D",
  `bright blue` = "#009FDF",
  `sky blue` = "#00B5E2",
  `gold` = "#bba461",
  `black` = "#000000",
  `dark grey` = "#5e6d77",
  `light grey` = "#c6d1d6",
  `bright orange` = "#f39521",
  `full orange` = "#e35205",
  `pink` = "#e56c92",
  `red` = "#b90745",
  `purple` = "#692759",
  `teal` = "#00968c",
  `green` = "#78ad2b"
)

#' Function to extract ulster colors as hex codes
#'
#' @param ... Character names of ulster_colour
#'
ulster_cols <- function(...) {
  cols <- c(...)

  if (is.null(cols))
    return(ulster_colour)

  ulster_colour[cols]
}

# palletes
ulster_palettes <- list(
  `main_1`  =  ulster_cols("deep blue", "sky blue", "dark grey"),

  `main_2` = ulster_cols("deep blue", "sky blue", "gold"),

  `cool`  =  ulster_cols("bright blue", "green", "teal"),

  `hot`   =  ulster_cols("pink", "bright orange", "red"),

  `mixed` =  ulster_cols("sky blue", "bright orange", "purple"),

  `grey`  =  ulster_cols("black", "light grey", "dark grey")
)

#' Return function to interpolate a ulster color palette
#'
#' @param palette Character name of palette in ulster_palettes
#' @param reverse Boolean indicating whether the palette should be reversed
#' @param ... Additional arguments to pass to colorRampPalette()
#'
ulster_pal <- function(palette = "main_1",
                       reverse = FALSE,
                       ...) {
  pal <- ulster_palettes[[palette]]

  if (reverse)
    pal <- rev(pal)

  grDevices::colorRampPalette(pal, ...)
}

#' Color scale constructor for ulster colors
#'
#' @param palette Character name of palette in ulster_palettes
#' @param discrete Boolean indicating whether color aesthetic is discrete or not
#' @param reverse Boolean indicating whether the palette should be reversed
#' @param ... Additional arguments passed to discrete_scale() or
#'            scale_color_gradientn(), used respectively when discrete is TRUE or FALSE
#'
scale_color_ulster <-
  function(palette = "main",
           discrete = TRUE,
           reverse = FALSE,
           ...) {
    pal <- ulster_pal(palette = palette, reverse = reverse)

    if (discrete) {
      ggplot2::discrete_scale("colour", paste0("ulster_", palette), palette = pal, ...)
    } else {
      ggplot2::scale_color_gradientn(colours = pal(256), ...)
    }
  }

#' Fill scale constructor for ulster colors
#'
#' @param palette Character name of palette in ulster_palettes
#' @param discrete Boolean indicating whether color aesthetic is discrete or not
#' @param reverse Boolean indicating whether the palette should be reversed
#' @param ... Additional arguments passed to discrete_scale() or
#'            scale_fill_gradientn(), used respectively when discrete is TRUE or FALSE
#'
scale_fill_ulster <-
  function(palette = "main",
           discrete = TRUE,
           reverse = FALSE,
           ...) {
    pal <- ulster_pal(palette = palette, reverse = reverse)

    if (discrete) {
      ggplot2::discrete_scale("fill", paste0("ulster_", palette), palette = pal, ...)
    } else {
      ggplot2::scale_fill_gradientn(colours = pal(256), ...)
    }
  }
