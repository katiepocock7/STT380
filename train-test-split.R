# train-test split example
# pizza
split_pct <- 0.7
n <- length(pizza$cal)*split_pct # train size
row_samp <- sample(1:length(pizza$cal), n, replace = FALSE)
train <- pizza[row_samp,]
test <- pizza[-row_samp,]
pizza_train_mod <- lm(data = train, cal ~ fat + mois)
test_pred <- predict(pizza_train_mod,test)
test_error <- test$cal - test_pred
rmse_train <- sqrt(mean(pizza_train_mod$residuals^2))
rmse_test <- sqrt(mean(test_error^2))
rmse_train
rmse_test

# train-test split example
# mtcars
split_pct <- 0.7
n <- length(mtcars$mpg)*split_pct # train size
row_samp <- sample(1:length(mtcars$mpg), n, replace = FALSE)
train <- mtcars[row_samp,]
test <- mtcars[-row_samp,]
mtcars_train_mod <- lm(data = train, mpg ~ cyl + disp + hp +drat+wt+qsec+vs+am+gear+carb)
test_pred <- predict(mtcars_train_mod,test)
test_error <- test$mpg - test_pred
rmse_train <- sqrt(mean(mtcars_train_mod$residuals^2))
rmse_test <- sqrt(mean(test_error^2))
rmse_train
rmse_test

