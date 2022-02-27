# stock_prices

![heps_stock](https://user-images.githubusercontent.com/70109399/155883584-bdc676d9-510f-4d75-a93d-3e5cbc4fa76d.png)

### HEPS STOCK PRICES

Stock prices file includes two different **interaktive** projects. The first one is ´HEPSIBURADA´stock prices. HEPSIBURADA is a Turkish e-commerce website and it was offered to public by NASDAQ in July 2021. This project aims to visualize ´HEPSIBURADA´ stock price from July 2021 to February 2022.

# LIBRARIES
* tidyquant
* plotly

## ABOUT

We import HEPSIBURADA stock prices by using getSymbols function as ´´HEPS´´. We struggle with the Adjusted column which is the close value.
It is divided the each adjusted value to the first one to observe how stock price changes over time. After making the dataset usable, we visualizemit by ´plotly´
package which makes the plots interactive easily.
