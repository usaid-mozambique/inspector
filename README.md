# inspector

Chamar e puxar dados de supervisão

<!-- badges: start -->
<!-- badges: end -->

## Resumo

A análise eficiente de dados exportados dos sistemas de informação do MISAU tipicamente requer acções de processamento tais como pivotagem, eliminação/coerção de variáveis e engenharia de dimensões úteis para a análise. O pacote sismar fornece um conjunto de funções que executam essas acções e preparam quadros para análise no R ou em software analítico alternativo.


## Instalação

`sismar` não está no CRAN e precisa ser instalado diretamente do rOpenSci usando o código abaixo.

``` r
    # instalar a partir de rOpenSci
      install.packages("sismar", repos = c('https://usaid-mozambique.r-universe.dev', 'https://cloud.r-project.org'))
    
    # carregar pacote
      library(inspector)
      
    # Listar funções do pacote
      ls("package:inspector")
    
```

---

*Disclaimer: The findings, interpretation, and conclusions expressed herein are those of the authors and do not necessarily reflect the views of United States Agency for International Development. All errors remain our own.*
