graph2 <- ec |> 
  drop_na() |> 
  mutate(state = str_remove(county_name, ".*, ")) |> 
  group_by(state) |> 
  summarise(pop_state = sum(pop2018),
            avg_ec = mean(ec_county)) |> 
  ggplot(aes(x = pop_state, y = avg_ec)) +
  geom_point() +
  geom_smooth(method = "lm", formula = y ~ x, se = FALSE) +
  scale_x_log10(breaks = c(1000000, 10000000),
                labels = c("1,000,0000", "10,000,000")) +
  labs(y = "Average County Economic Connectedness",
       x = "State Population",
       title = "Economic Connectedness and Population in US States",
       subtitle = "Biggger states have counties with lower average economic connectedness.")

graph2

write_rds(graph2, "graph_two.rds")
