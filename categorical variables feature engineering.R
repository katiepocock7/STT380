# with categorical
summary(lm(data = iris, Sepal.Length ~ Petal.Length + Species))

mods <- list()
# separate modeling with categorical variables
spec <- c('setosa', 'versicolor', 'virginica')
for(i in 1:3){
  sset <- subset(iris, subset = Species == spec[i])
  mods[[i]] <- lm(data = sset, Sepal.Length ~ Sepal.Width)
}
summary(mods[[1]])

# feature engineering
library(GGally)
glimpse(diamonds)
ggpairs(diamonds, mapping = ggplot2::aes(color=color))

summary(lm(data = diamonds, log(price) ~ log(carat)))

diam_aug <- diamonds
diam_aug$carat_pow <- with(diam_aug, carat^1.675817)
head(diam_aug)

summary(lm(data = diam_aug, price ~ carat))

