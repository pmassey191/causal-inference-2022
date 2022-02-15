# Builds a bar graph with total arrests on the y axis and race/gender on the
# x axis. Refer to my presentation on graphing for more detail.
library(ggthemes)
read_csv(here("data/NLSY97_clean.csv")) %>%
  group_by(race, gender) %>%
  summarize(incarceration_rate = sum(incarcerated)/n()) %>%
  ggplot(aes(race, incarceration_rate, fill = gender)) +
    geom_bar(stat = "identity", position = "dodge") +
    labs(
      x = "Race", 
      y = "Incarceration Rate", 
      fill = "Gender",
      title = "Incarceration Rate in 2002 by Race and Gender") +
    theme_minimal()+
    scale_y_continuous(labels = scales::percent)+
    scale_fill_economist()

ggsave(here("figures/incarceration_rate_by_racegender.png"), width=8, height=4.5)
