# Load libraries
library(tidyverse)
library(psych)

# Load cleaned data and apply factor levels
nhis <- read_csv("data/nhis_clean.csv") %>%
  mutate(
    SEX_A = factor(SEX_A, levels = c("Male", "Female")),
    PHSTAT_A = factor(PHSTAT_A,
                      levels = c("Excellent","Very good","Good","Fair","Poor"),
                      ordered = TRUE),
    EDUCP_A = factor(EDUCP_A,
                     levels = c("Less than High School",
                                "High School Graduate",
                                "Some College",
                                "College Graduate or better"))
  )

# Plot 1: Enhanced scatter plot 
# Height vs weight, colored by sex, faceted by health status

nhis_plot <- nhis %>%
  filter(!is.na(HEIGHTTC_A), !is.na(WEIGHTLBTC_A),
         !is.na(SEX_A), !is.na(PHSTAT_A))

p1 <- ggplot(nhis_plot,
             aes(x = HEIGHTTC_A, y = WEIGHTLBTC_A, color = SEX_A)) +
  geom_point(alpha = 0.35, size = 1) +
  geom_smooth(method = "lm", se = FALSE, linewidth = 0.8) +
  facet_wrap(~ PHSTAT_A, nrow = 2) +
  scale_color_manual(values = c("Male" = "blue", "Female" = "red")) +
  labs(title   = "Height vs. weight by sex and general health status",
       x       = "Height (inches)",
       y       = "Weight (lbs)",
       color   = "Sex",
       caption = "Source: NHIS 2021") +
  theme_minimal(base_size = 12) +
  theme(strip.text      = element_text(face = "bold"),
        legend.position = "bottom")

print(p1)

ggsave("output/plot1_scatter_height_weight_sex_health.png",
       plot = p1, width = 10, height = 7, dpi = 300)

#Plot 2: Correlation scatter plot matrix
# Age, weight, and height using pairs.panels()

nhis_numeric <- nhis %>%
  select(Age    = AGEP_A,
         Weight = WEIGHTLBTC_A,
         Height = HEIGHTTC_A) %>%
  drop_na()

png("output/plot2_pairs_panel_age_weight_height.png",
    width = 800, height = 800, res = 150)

pairs.panels(
  nhis_numeric,
  method   = "pearson",
  hist.col = "lightblue",
  density  = TRUE,
  ellipses = TRUE,
  lm       = TRUE,
  main     = "Correlation matrix: age, weight, and height (NHIS 2021)"
)

dev.off()
