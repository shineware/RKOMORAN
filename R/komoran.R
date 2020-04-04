#' @export
RKOMORAN <- R6::R6Class("RKOMORAN",
  public = list(
    initialize = function(model_type) {
      default_model <- "kr/co/shineware/nlp/komoran/constant/DEFAULT_MODEL"

      if (model_type == "STABLE") {
        model <- rJava::.jfield(default_model, name = "STABLE")
      } else if (model_type == "EXP") {
        model <- rJava::.jfield(default_model, name = "EXPERIMENT")
      }

      private$komoran <-
        rJava::.jnew("kr/co/shineware/nlp/komoran/core/Komoran", model)
    },
    set_user_dic = function(user_dic) {
      rJava::.jcall(private$komoran, "V", "setUserDic", user_dic)
    },
    set_fw_dic = function(fw_dic) {
      private$komoran$setFWDic(fw_dic)
    },
    get_morphes_by_tags = function(sentence, tags) {
      target_tags <- rJava::.jarray(tags)
      analysis_result <-
        private$komoran$analyze(sentence)$getMorphesByTags(target_tags)

      num_of_morphemes <- analysis_result$size()
      target_morphemes <- character(as.integer(num_of_morphemes))
      for (i in 1:num_of_morphemes) {
        target_morphemes[i] <- analysis_result$get(as.integer(i - 1))
      }
      Encoding(target_morphemes) <- "UTF-8"
      return(target_morphemes)
    },
    get_plain_text = function(sentence) {
      plain_text <- private$komoran$analyze(sentence)$getPlainText()
      Encoding(plain_text) <- "UTF-8"
      return(plain_text)
    },
    get_nouns = function(sentence) {
      analysis_result <- private$komoran$analyze(sentence)$getNouns()

      num_of_nouns <- analysis_result$size()
      nouns <- character(as.integer(num_of_nouns))
      for (i in 1:num_of_nouns) {
        nouns[i] <- analysis_result$get(as.integer(i - 1))
      }
      Encoding(nouns) <- "UTF-8"
      return(nouns)
    },
    get_token_list = function(sentence) {
      analysis_result <- private$komoran$analyze(sentence)$getTokenList()

      num_of_morphemes <- analysis_result$size()
      token_infos <- list()
      for (i in 1:num_of_morphemes) {
        token_info <- analysis_result$get(as.integer(i - 1))

        morpheme <- token_info$getMorph()
        Encoding(morpheme) <- "UTF-8"
        tag <- token_info$getPos()
        begin_index <- token_info$getBeginIndex()
        end_index <- token_info$getEndIndex()

        token_infos[[i]] <- list(
          Morpheme = morpheme, Tag = tag,
          BeginIndex = begin_index, EndIndex = end_index
        )
      }
      return(token_infos)
    },
    get_list = function(sentence) {
      analysis_result <- private$komoran$analyze(sentence)$getList()

      num_of_morphemes <- analysis_result$size()
      morpheme_tag_pairs <- list()
      for (i in 1:num_of_morphemes) {
        pair <- analysis_result$get(as.integer(i - 1))
        morpheme <- pair$getFirst()
        Encoding(morpheme) <- "UTF-8"
        tag <- pair$getSecond()

        morpheme_tag_pairs[[i]] <- list(Morpheme = morpheme, Tag = tag)
      }
      return(morpheme_tag_pairs)
    },
    print = function(...) {
      cat("RKOMORAN: \n")
      cat("  Model type: ", private$model_type, "\n", sep = "")
      invisible(self)
    }
  ),
  private = list(
    model_type = NULL,
    komoran = NULL
  )
)
