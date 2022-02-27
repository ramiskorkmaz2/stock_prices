library(plotly)

tickers = c("SNAP", "TWTR", "FB", "PINS", "NFLX" )
for (i in tickers) {
  getSymbols(i, from = "2019-04-18",
             to = "2022-02-17")
}

stock <- data.frame(
  SNAP$SNAP.Adjusted,
  TWTR$TWTR.Adjusted,
  FB$FB.Adjusted,
  PINS$PINS.Adjusted,
  NFLX$NFLX.Adjusted
)

stock$SNAP.Adjusted <- stock$SNAP.Adjusted / stock$SNAP.Adjusted[1]
stock$TWTR.Adjusted <- stock$TWTR.Adjusted / stock$TWTR.Adjusted[1]
stock$FB.Adjusted <- stock$FB.Adjusted / stock$FB.Adjusted[1]
stock$PINS.Adjusted <- stock$PINS.Adjusted / stock$PINS.Adjusted[1]
stock$NFLX.Adjusted <- stock$NFLX.Adjusted / stock$NFLX.Adjusted[1]

stock <- data.frame(stock, rownames(stock) )
colnames(stock) <- append(tickers, "Dates")

fig <- plot_ly(stock, type = "scatter", mode = "lines") %>%
  add_trace(x = ~Dates, y = ~SNAP, name = "SNAP") %>%
  add_trace(x = ~Dates, y = ~TWTR, name = "TWTR") %>%
  add_trace(x = ~Dates, y = ~FB, name = "FB") %>%
  add_trace(x = ~Dates, y = ~PINS, name = "PINS") %>%
  add_trace(x = ~Dates, y = ~NFLX, name = "NFLX") %>%
  layout(showlegend = T, title='Time Series with Range Slider and Selectors',
         xaxis = list(
                      rangeselector=list(
                        buttons=list(
                          list(count=1, label="1m", step="month", stepmode="backward"),
                          list(count=6, label="6m", step="month", stepmode="backward"),
                          list(count=1, label="YTD", step="year", stepmode="todate"),
                          list(count=1, label="1y", step="year", stepmode="backward"),
                          list(step="all")
                        ))))
options(warn = -1)
fig <- fig %>% 
  layout(
    xaxis = list(zerolinecolor = "#ffff",
                 zerolinewidth = 2,
                 gridcolor = "ffff"),
    yaxis = list(title = "values",
                 zerolinecolor = "#ffff",
                 zerolinewidth = 2,
                 gridcolor = "ffff"),
    plot_bgcolor = "e5ecf6" , width = 1000
  )

fig
