# Employment in Mazatlan
# Author: Juan Zepeda

# load some library
library(ggplot2)
library(ggthemes) 
library(scales)
library(ggrepel)

# We created a data frame
Asegurados <- c(114602, 111595, 111156, 114082, 113326, 114098, 113356,
                114550, 115829, 115127, 116869, 118647, 118238, 115732,
                117071, 117329, 115500, 112067, 109003, 108459, 109351,
                109419, 111799, 113093, 114110, 111990, 112226, 111764,
                111966, 113349)
Mes <- seq(as.Date("2018/11/01"), by = "month", length.out = 30)
ASG <- data.frame(Asegurados, Mes)

# now, we do a plot
l <- ggplot(ASG, aes(x = factor(Mes), y = Asegurados, group = 1)) +
  geom_line(aes(), color = "#005581", size = 1.5) + 
  geom_point(color = "#005581") + 
  geom_label_repel(aes(label = Asegurados), size = 3.0, color = "black",
                   label = scales::comma(Asegurados)) +
  #geom_label(aes(label = Asegurados), color = "black") +
  labs(title = "Empleo formal en Mazatlán, 2018-2021.",
       subtitle = "Cotizantes en el IMSS.",
       x = "Mes", y = "No. de Asegurados",
       caption = "Elaboración propia con datos del IMSS.") +
  theme_minimal() +
  theme(plot.title = element_text(face = "bold"),
        axis.text.x = element_text(angle = 90)) +
  scale_y_continuous(labels = comma)
l  
ggsave(filename = "ASG_sector.png",
       plot = last_plot(),
       units = c("in"),
       width = 7.38, height = 4.78)