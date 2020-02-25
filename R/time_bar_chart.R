
#' Make a bar plot showing percentage of time spent on each project
#'
#' @param report a dataframe of time tracking summary stats
#' from togglr API or website.
#' @export
#'
time_bar_chart <- function(report,
                           project = "project",
                           project_time_percent = "project_time_percent") {

  report %>%
    select(project, project_time_percent) %>%
    distinct() %>%
    mutate(project =
             forcats::fct_reorder(as.factor(project), -project_time_percent)) %>%
    ggplot2::ggplot(ggplot2::aes(x = project,
                                 y = project_time_percent, fill = project)) +
    ggplot2::geom_bar(stat = "identity") +
    ggplot2::xlab("Project") +
    ggplot2::ylab("Percent of Time") +
    ggplot2::theme_minimal() +
    ggplot2::theme(axis.text.x = ggplot2::element_text(angle = 90, hjust = 1)) +
    ggplot2::ggtitle("Overview of Time Management")


}


