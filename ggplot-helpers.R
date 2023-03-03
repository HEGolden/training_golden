# Adding more to Creating Functions
# Wrapping theme parameters into a function
# When using ggplot
# See the BOOK: https://learning.nceas.ucsb.edu/2023-02-arctic/index.html

# a common theme call from ggplot
# base size  text arguments is size and want to reset it quickly
# write the function once and can easily change the base_size.
# can easily change base_size

custom_theme <- function(base_size = 9) {
  ggplot2::theme(
    axis.ticks       = ggplot2::element_blank(),
    text             = ggplot2::element_text(family = 'Helvetica', color = 'gray30', size = base_size),
    plot.title       = ggplot2::element_text(size = ggplot2::rel(1.25), hjust = 0.5, face = 'bold'),
    panel.background = ggplot2::element_blank(),
    legend.position  = 'right',
    panel.border     = ggplot2::element_blank(),
    panel.grid.minor = ggplot2::element_blank(),
    panel.grid.major = ggplot2::element_line(colour = 'grey90', size = .25),
    legend.key       = ggplot2::element_rect(colour = NA, fill = NA),
    axis.line        = ggplot2::element_blank()
  )
}

library(ggplot2)

temps_df <- data.frame(convert_temps(seq(-100,100,10)))

ggplot(temps_df, mapping=aes(x=fahr, y=celsius, color=kelvin)) +
  geom_point() +
  custom_theme(10)
