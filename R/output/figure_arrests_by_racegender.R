# Builds a bar graph with total arrests on the y axis and race/gender on the
# x axis. Refer to my presentation on graphing for more detail.
library(ggthemes)
  read_csv(here("data/NLSY97_clean.csv")) %>%
  group_by(race, gender) %>%
  summarize(count = n(),
            inc = sum(incarcerated),
            inc_rate = inc/count) %>%  
  ggplot(aes(race, inc_rate, fill = gender)) +
    geom_bar(stat = "identity", position = "dodge") +
    labs(
      x = "Race", 
      y = "Incarceration Rate", 
      fill = "Gender",
      title = "Incarceration Rate in 2002 by Race and Gender") +
    theme_fivethirtyeight() +
    scale_fill_economist()+
    scale_y_continuous(labels = scales::percent)

ggsave(here("figures/incarceration_rate_by_racegender.png"), width=8, height=4.5)
