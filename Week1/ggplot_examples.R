pokemon <- read.csv('/Users/lvi819/Documents/MIS6357/Week1/pokemon.csv')
nrow(pokemon)
ncol(pokemon)


ggplot(data = pokemon) +
  geom_point(mapping = aes(x = Attack, y = Defense))

ggplot(data = pokemon) +
  geom_point(mapping = aes(x = Attack, y = Defense, color = Type_1))