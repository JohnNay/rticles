#' wsc format.
#'
#' Format for creating a wsc
#'
#' @inheritParams rmarkdown::pdf_document
#' @param ... Arguments to \code{rmarkdown::pdf_document}
#'
#' @return R Markdown output format to pass to
#'   \code{\link[rmarkdown:render]{render}}
#'
#' @examples
#'
#' \dontrun{
#' library(rmarkdown)
#' draft("MyArticle.Rmd", template = "jss_article", package = "rticles")
#' }
#'
#' @export
wsc_article <- function(..., keep_tex = TRUE) {

  template <- find_resource("wsc_article", "template.tex")

  base <- inherit_pdf_document(..., template = template, keep_tex = keep_tex)
  base$knitr$opts_chunk$fig.align <- "center"

  base$knitr$knit_hooks$plot <- knitr::hook_plot_tex

  base
}
