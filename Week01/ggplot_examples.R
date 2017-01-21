pokemon <- read.csv('/Users/lvi819/Documents/MIS6357/Week1/pokemon.csv')
nrow(pokemon)
ncol(pokemon)
colnames(pokemon)

ggplot(data = pokemon) +
  geom_point(mapping = aes(x = Attack, y = Defense))

ggplot(data = pokemon) +
  geom_point(mapping = aes(x = Attack, y = Defense, color = Type_1))

ggplot(data = pokemon) +
  geom_point(mapping = aes(x = Attack, y = Defense, size = Weight_kg))

ggplot(data = pokemon) +
  geom_jitter(mapping = aes(x = Attack, y = Defense, size = Weight_kg))




ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy )) +
  geom_abline(aes(intercept=30, slope = -5)) +
  geom_vline(aes(xintercept=5))