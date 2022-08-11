# Look at missing data later.
library(tidyverse)
graph1 <- ec |> 
  drop_na() |> 
  ggplot(aes(x = pop2018, y = ec_county)) +
  geom_point() +
  geom_smooth(method = "lm", formula = y ~ x, se = FALSE) +
  scale_x_log10(breaks = c(1000, 10000, 1000000),
                labels = c("1,000", "10,000", "1,000,0000")) +
  labs(y = "Economic Connectedness",
       x = "Population",
       title = "Economic Connectedness and Population in US Counties",
       subtitle = "There is no relationship between population and economic connectedness in US counties.")
graph1

write_rds(graph1, "graph_one.rds")
