#' Align Comments
#'   
#' @param filename not implemented yet
#'   
#' @return
#' @export
#'   
#' @examples
     
align_comments <-
  function(filename = NULL, ...) {
    if (length(filename) > 1) return(invisible(lapply(filename, align_comments, ...)))
     
    doc_id <- rstudioapi::getSourceEditorContext()$id
     
    lines <- rstudioapi::getSourceEditorContext()$contents
     
    full_line_comments <- stringr::str_detect(lines, "^[ \t]*#")
    locs <- stringr::str_locate(lines, "# ?[^\"']+$")[, 1]
     
    # find farthest right comment mark
    # account for documents containing no lines with trailing comments
    m <- max(0, max(locs, na.rm = TRUE), na.rm = TRUE)
     
    locs[is.na(locs)] <- nchar(lines[is.na(locs)]) + 1
    locs[full_line_comments] <- nchar(lines[full_line_comments]) + 1
     
    code <- stringr::str_trim(stringr::str_sub(lines, 1, locs - 1), side = "right")
    comment <- stringr::str_sub(lines, locs, nchar(lines))
     
    rstudioapi::setDocumentContents(
      stringr::str_trim(
        paste0(
          stringr::str_pad(code, m, "right"),
          comment,
          collapse = "\n"
        ), side = "right"
      ),
      doc_id
    )
  }  
     
     