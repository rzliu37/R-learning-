# Clean up workspace and detach non-basic packages ============================

rm(list = ls(all = TRUE))
suppressWarnings(
  if (!is.null(names(sessionInfo()$otherPkgs))) {
    invisible(lapply(
      paste0('package:', names(sessionInfo()$otherPkgs)),
      detach,
      character.only = TRUE,
      unload = TRUE
    ))}
)
graphics.off()
