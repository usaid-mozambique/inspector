# inspector

Chamar e puxar dados de supervisão

<!-- badges: start -->
[![R-CMD-check](https://github.com/usaid-mozambique/inspector/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/usaid-mozambique/inspector/actions/workflows/R-CMD-check.yaml)
[![Lifecycle: experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)
[![sismar status badge](https://usaid-mozambique.r-universe.dev/badges/sismar)](https://usaid-mozambique.r-universe.dev/sismar)
[![:name status badge](https://usaid-mozambique.r-universe.dev/badges/:name)](https://usaid-mozambique.r-universe.dev/)
<!-- badges: end -->

## Resumo

O pacote inspetor foi criado para automatizar a busca de ficheiros de dados de supervisão a partir do servidor ODK e para compilar e transformar estes dados em ficheiros de fácil análise.


## Instalação

`inspector` não está no CRAN e precisa ser instalado diretamente do rOpenSci usando o código abaixo.

``` r
    # instalar a partir de rOpenSci
      install.packages("inspector", repos = c('https://usaid-mozambique.r-universe.dev', 'https://cloud.r-project.org'))
    
    # carregar pacote
      library(inspector)
      
    # Listar funções do pacote
      ls("package:inspector")
    
```

---

*Disclaimer: The findings, interpretation, and conclusions expressed herein are those of the authors and do not necessarily reflect the views of United States Agency for International Development. All errors remain our own.*
