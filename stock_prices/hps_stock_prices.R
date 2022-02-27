install.packages("tidyquant")
library(tidyquant)
library(plotly)

getSymbols("HEPS")
stock <- data.frame(HEPS$HEPS.Adjusted)
stock$HEPS.Adjusted <- stock$HEPS.Adjusted / stock$HEPS.Adjusted[1]
stock <- data.frame(stock, rownames(stock))
colnames(stock) <- append("HEPS", "date")
stock$date <- as.Date(stock$date)
fig <- plot_ly() %>%
  add_trace(data = stock, type = "scatter",
            mode = "lines", fill = "tozeroy",
            x = ~date, y = ~HEPS, name = "HEPS") %>%
  layout(showlegend = F, yaxis = list(range = c(0, 1.06),
                                      zerolinecolor = "#ffff",
                                      zerolinewidth = 2,
                                      gridcolor = "ffff"),
         xaxis = list(zerolinecolor = "#ffff",
                      zerolinewidth = 2,
                      gridcolor = "ffff"),
         plot_bgcolor = "#e5ecf6")
options(warn = -1)
fig <- fig %>% layout(
  xaxis = list(zerolinecolor = "#ffff",
               zerolinewidth = 2,
               gridcolor = "ffff"),
  yaxis = list(range = c(0.1, 1.06),
               zerolinecolor = "#ffff",
               zerolinewidth = 2,
               gridcolor = "ffff"),
  
  plot_bgcolor = "#e5ecf6", width = 900
)
fig
heps <- tq_get("HEPS", get = "stock.prices"),
heps$date <- as.Date(heps$date)
fig <- plot_ly(heps,
               x = ~close, y= ~date, type = "scatter",
               mode = "markers", name = "daily") %>%
  add_trace(data = heps, x = ~close, type ="histogram",
            histfunc = "avg", xbins = list(size = "M1"),
            name = "monthly average")
fig <- fig %>% layout(
  xaxis = list(title = "avg of HEPS Close",
               zerolinecolor = "#ffff",
               zerolinewidth = 2,
               gridcolor = "ffff"),
  yaxis = list(zerolinecolor = "ffff",
               zerolinewidth = 2,
               gridcolor = "ffff"),
  plot_bgcolor = "#e5ecf6",
  title = "Histogram on Date Axes",
  bargap = 0.1
)
fig <- fig %>%
  layout(hovermode = "x unified",
         xaxis = list(
                      zerolinecolor = "#ffff",
                      zerolinewidth = 2,
                      gridcolor = "ffff"),
         yaxis = list(zerolinecolor = "ffff",
                      zerolinewidth = 2,
                      gridcolor = "ffff"),
         plot_bgcolor = "#e5ecf6", width = 900)
fig
