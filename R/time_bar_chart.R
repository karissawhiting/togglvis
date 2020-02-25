
#' Make a bar plot showing percentage of time spent on each project
#'
#' @param report a dataframe of time tracking summary stats
#' from togglr API or website.
#'
#'
time_bar_chart <- function(report,
                           project = "project",
                           project_time_percent = "project_time_percent") {

  report %>%
    select(project, project_time_percent) %>%
    distinct() %>%
    mutate(project =
             fct_reorder(as.factor(project), -project_time_percent)) %>%
    ggplot(aes(x = project, y = project_time_percent, fill = project)) +
    geom_bar(stat = "identity") +
    xlab("Project") +
    ylab("Percent of Time") +
    theme_minimal() +
    theme(axis.text.x = element_text(angle = 90, hjust = 1)) +
    ggtitle("Overview of Time Management")


}


