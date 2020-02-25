
#' Add together two numbers
#'
#' @param report a dataframe of time tracking summary stats
#' from togglr API or website.
#' @examples
#' @export
#'
process_report <- function(report,
                           task_description = "description",
                           start_time = "start",
                           end_time = "end",
                           duration = "dur",
                           client = "client",
                           project = "project") {

  report <- report %>%
    select(task_description,
           start_time,
           end_time,
           client, project) %>%
    rlang::set_names(c("task_description",
                "start_time",
                "end_time",
                "project_lead",
                "project")) %>%
    mutate(start_time = readr::parse_datetime(start_time),
           end_time = readr::parse_datetime(end_time)) %>%
    mutate(task_duration = difftime(as.POSIXct(end_time),
                                  as.POSIXct(start_time),
                                  units = "min")) %>%
    mutate(total_time = sum(task_duration)) %>%
    group_by(project) %>%
    mutate(project_time = sum(task_duration)) %>%
    mutate(project_time_percent =
             (as.double(project_time)/as.double(total_time))*100) %>%
    ungroup()

  return(report)


}

