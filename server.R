library(shiny)
library(plotly)


shinyServer(function(input, output) {
  #colour palette for categories of Species
  palette <- c("red", "green", "blue")
  palette <- setNames(palette, c("setosa", "versicolor", "virginica"))
  
  # Insert plotly server code here #
  output$irisplot <- renderPlotly({
    plot_ly(
      data = iris,
      x = ~Sepal.Length,
      y = ~Petal.Length,
      color = ~Species,
      colors = palette,
      type = "scatter",
      text = paste("<b>Sepal length</b>:", iris$Sepal.Length,
                   "<br><i>Petal length</i>:", iris$Petal.Length,
                   "<br>Species:", iris$Species),
      hoverinfo = "text"
    ) %>%
      layout(xaxis = list(title = "Sepal Length"),
             yaxis = list(title = "Petal Length"))
  })
  
})
