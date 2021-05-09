data("ToothGrowth")

library(ggplot2)
library(tibble)

tibble(ToothGrowth)

ToothGrowth$dose <- as.factor(ToothGrowth$dose)

ggplot(ToothGrowth, aes(x = dose, y = len, fill = supp)) +
  geom_violin(col = "black", trim = F, alpha = 0.4,
              position = position_dodge(width = 0.72)) +
  geom_boxplot(col = "black", outlier.colour = NA, width = 0.21,
               position = position_dodge(width = 0.72)) +
  scale_fill_manual(values = c("#8c510a", "#01665e"),
                    name = "Tipo de suplemento",
                    labels = c("Suco de laranja",
                               "Vitamina C")) +
  stat_summary(geom = 'point', fun.y = mean, size = 1.5,
               shape = 15, show.legend = F, col = "beige",
               aes(group = supp, shape = supp),
               position = position_dodge(width = 0.72)) +
  stat_summary(geom = 'line', fun.y = mean, size = 0.8,
               show.legend = F,
               aes(group = supp, linetype = supp),
               position = position_dodge(width = 0.72)) +
  scale_linetype_manual(values = c("solid", "dotted")) +
  labs(x = "Dose (mg/dia)", 
       y = "Comprimento de odontoblastos (mícrons)",
       title = "Crescimento dentário de Porquinhos da Índia") +
  theme_bw(base_size = 12)
