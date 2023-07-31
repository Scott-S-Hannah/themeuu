# theme_uu
#' ggplot2 Ulster University PhD theme
#'
#' A ggplot2 theme for my PhD thesis based on ggpubr::pubr() function
#' @param ...
#' Additional arguments to pass to ggplot2::theme()
#'
#' @return
#' plot matching PhD styling
#' @export
#' @examples
#' ggplot2::ggplot(data = cars, ggplot2::aes(x = speed, y = dist)) +
#' ggplot2::geom_point() +
#' theme_uu()
#'

theme_uu <- function(...) {
  ggpubr::theme_pubr() +
    ggplot2::theme(
      legend.position = "bottom",
      plot.subtitle = ggplot2::element_text(size = 10),
      axis.text = ggplot2::element_text(size = 10),
      axis.title = ggplot2::element_text(size = 10),
      legend.text = ggplot2::element_text(size = 10),
      legend.title = ggplot2::element_text(size = 10),
      legend.margin = ggplot2::margin(0, 0, 0, 0, unit = "pt"),
      legend.box.margin = ggplot2::margin(0, 0, 0, 0, unit = "pt"),
      plot.margin = grid::unit(c(.115, .05, .05, .05), "cm"),
      panel.grid.major.y = ggplot2::element_line(size = ggplot2::rel(0.6), linetype = "dashed"),
      panel.grid.minor.y = ggplot2::element_line(size = ggplot2::rel(0.25), linetype = "dashed"),
      panel.grid.major.x = ggplot2::element_line(size = ggplot2::rel(0.6), linetype = "dashed")
    )
}
