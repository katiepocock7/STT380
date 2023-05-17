pizza_mod <- lm(data = pizza, cal ~ mois + fat + sodium)
sum_std <- sd(pizza$mois)*abs(pizza_mod$coefficients[2]) + sd(pizza$fat)*abs(pizza_mod$coefficients[3]) + sd(pizza$sodium)*abs(pizza_mod$coefficients[4])
mois_sens <- sd(pizza$mois)*pizza_mod$coefficients[2]/sum_std
fat_sens <- sd(pizza$fat)*pizza_mod$coefficients[3]/sum_std
sodium_sens <- sd(pizza$sodium)*pizza_mod$coefficients[4]/sum_std
mois_sens 
fat_sens  
sodium_sens 

barplot(c(sodium_sens, mois_sens,fat_sens), horiz = TRUE)


