ccf(soi, recruit)

# ordinary regression
summary(lm(recruit$X68.63~soi$�..0.377))


# lagged regression
summary(lm(recruit$X68.63~lag(soi$�..0.377,6)))

summary(lm(recruit$X68.63~lag(soi$�..0.377,6)+lag(soi$�..0.377,7)))

ccf(diff(soi$�..0.377),diff(recruit$X68.63))

summary(lm(diff(recruit$X68.63)~lag(diff(soi$�..0.377),5)))

summary(lm(diff(recruit$X68.63)~lag(diff(soi$�..0.377),5)+lag(diff(soi$�..0.377),4)))
