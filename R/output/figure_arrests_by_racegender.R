# Builds a bar graph with total arrests on the y axis and race/gender on the
# x axis. Refer to my presentation on graphing for more detail.

read_csv(here("data/NLSY97_clean.csv")) %>%
  group_by(race, gender) %>%
  summarize(incarceration_rate = sum(incarcerated)/n()) %>%
  ggplot(aes(race, months_incarcerated, fill = gender)) +
    geom_bar(stat = "identity", position = "dodge") +
    labs(
      x = "Race", 
      y = "Mean Months Incarcerated", 
      fill = "Gender",
      title = "Mean Number of Arrests in 2002 by Race and Gender") +
    theme_minimal() +
    scale_fill_economist()

ggsave(here("figures/arrests_by_racegender.png"), width=8, height=4.5)
