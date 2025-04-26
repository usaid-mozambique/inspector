#' Arrumar ficheiros CSV das supervisões HIV extraídos do servidor ODK
#'
#' @param path Caminho para a pasta de ficheiros onde o CSV esta guardado
#' @param safe Argumento opcional que, quando definido como `TRUE`, gera um relatório de erros detalhado
#'
#' @returns Quadro arrumado contendo dados de supervisão
#' @export
#'
#' @examples
#'  \dontrun{
#'
#'  df <- process_sqi_file("Data/")}

process_sqi_file <- function(path, safe = FALSE) {

  core_logic <- function(path) {
    df <- readr::read_csv(
      path,
      col_types = readr::cols(.default = "c"),
      locale = readr::locale(encoding = "UTF-8"),
      show_col_types = FALSE
    ) |>
      dplyr::rename_with(~ stringr::str_replace_all(.x, ":", ".")) |>
      dplyr::rename(supervisionArea = dplyr::any_of("groupForm.supervisionArea")) |>
      tidyr::pivot_longer(
        cols = -tidyselect::matches("central_code|supervisionArea|groupGeo|groupNivel|groupGI|QSupCode|meta"),
        names_to = "response_code",
        values_to = "value"
      ) |>
      dplyr::filter(!is.na(value)) |>
      dplyr::mutate(
        source_file = basename(path),
        area_responsecode = paste(supervisionArea, response_code, sep = "_")
      ) |>
      dplyr::relocate(source_file, .before = everything())

    return(df)
  }

  if (safe) {
    return(purrr::safely(core_logic, otherwise = NULL)(path))
  } else {
    return(core_logic(path))
  }
}


#' Processar em lote o ficheiro de supervisão CSV
#'
#' @param path Caminho para a pasta de ficheiros onde o CSV esta guardado
#' @param var_mapping Tabela com mapeamento de variáveis de supervisão
#'
#' @returns Quadro arrumado contendo dados de supervisão
#' @export
#'
#' @examples
#'  \dontrun{
#'
#'  df <- process_sqi_batch("Data/")}

process_sqi_batch <- function(path, var_mapping = data_sqi_mapper) {

  df <- purrr::map(path, process_sqi_file) |>
    dplyr::bind_rows() |>
    dplyr::left_join(var_mapping,
                     dplyr::join_by("area_responsecode")) |>
    dplyr::filter(filter_key == "keep") |>
    dplyr::select(-"source_file") |>
    dplyr::group_by(dplyr::across(-c("value", "question_split"))) |>
    dplyr::mutate(row_n = dplyr::row_number()) |>
    tidyr::pivot_wider(names_from = "type", values_from = "value")

  return(df)

}


