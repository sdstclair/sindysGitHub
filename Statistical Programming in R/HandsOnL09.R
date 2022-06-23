library(gapminder)
head(gapminder)
levels(gapminder$country)
unique(gapminder$year)

Top5 <- gapminder %>% filter(country %in% c("Haiti", "Israel", "Lebanon", "Morocco", "United States"))
Top5

#Which country of the five you chose has the lowest and highest capita GDP in 1952?
percapitaGDP <- gapminder %>% filter(year == 1952) %>% arrange(desc(gdpPercap))
percapitaGDP

#Which country of the five you chose has the lowest and highest capita GDP in 2007?
percapitaGDP2 <- gapminder %>% filter(year == 2007) %>% arrange(desc(gdpPercap))
percapitaGDP2

filter(Top5, year %in% c(1952, 2007, country %in% c("Haiti", "Israel", "Lebanon", "Morocco", "United States"))) %>% arrange(desc(gdpPercap)) %>% select(country, year, gdpPercap)

#Create a line plot with year on the horizontal axis and lifeExp on the vertical axis for the five countries; give each country a different color line. Describe the variations in life expectancy between the countries.
gm_mytop5 <- gapminder %>% filter(country %in% c("Haiti", "Israel", "Lebanon", "Morocco", "United States")) %>% select(country, year, lifeExp, gdpPercap)
gm_mytop5

ggplot(gm_mytop5) + geom_line(aes(x = year, y = lifeExp, color = country)) + ylab("Life Expectancy") + ggtitle("Life Expectancy in Five Countries")

#On the entire gapminder data frame, compute the median of lifeExp for each year.
lifeExpectancy52 <- gapminder %>% filter(year == 1952) %>% group_by(country) %>% summarise(life_med = median(lifeExp))
lifeExpectancy52

lifeExpectancy57 <- gapminder %>% filter(year == 1957) %>% group_by(country) %>% summarise(life_med = median(lifeExp))
lifeExpectancy57

lifeExpectancy62 <- gapminder %>% filter(year == 1962) %>% group_by(country) %>% summarise(life_med = median(lifeExp))
lifeExpectancy62

lifeExpectancy67 <- gapminder %>% filter(year == 1967) %>% group_by(country) %>% summarise(life_med = median(lifeExp))
lifeExpectancy67

lifeExpectancy72 <- gapminder %>% filter(year == 1972) %>% group_by(country) %>% summarise(life_med = median(lifeExp))
lifeExpectancy72

lifeExpectancy77 <- gapminder %>% filter(year == 1977) %>% group_by(country) %>% summarise(life_med = median(lifeExp))
lifeExpectancy77

lifeExpectancy82 <- gapminder %>% filter(year == 1982) %>% group_by(country) %>% summarise(life_med = median(lifeExp))
lifeExpectancy82

lifeExpectancy87 <- gapminder %>% filter(year == 1987) %>% group_by(country) %>% summarise(life_med = median(lifeExp))
lifeExpectancy87


lifeExpectancy92 <- gapminder %>% filter(year == 1992) %>% group_by(country) %>% summarise(life_med = median(lifeExp))
lifeExpectancy92


lifeExpectancy97 <- gapminder %>% filter(year == 1997) %>% group_by(country) %>% summarise(life_med = median(lifeExp))
lifeExpectancy97


lifeExpectancy02 <- gapminder %>% filter(year == 2002) %>% group_by(country) %>% summarise(life_med = median(lifeExp))
lifeExpectancy02


lifeExpectancy07 <- gapminder %>% filter(year == 2007) %>% group_by(country) %>% summarise(life_med = median(lifeExp))
lifeExpectancy07

#For what years is the life expectancy for your five countries above the median life expectancy for the entire gapminder data frame?
gm_median <- gapminder %>% group_by(year) %>% summarise(life_med = median(lifeExp))
gm_median
# The median for the entire gapminder dataset is 60.7125

gm_Haiti <- gapminder %>% filter(country == "Haiti") %>% group_by(year)
gm_Haiti
# The year(s) for which the the Haitian life expectancy is above the median life expectancy for the entire gapminder dataset is 2007.

gm_Israel <- gapminder %>% filter(country == "Israel") %>% group_by(year)
gm_Israel
# The years for which the Israeli life expectancy is above the median life expectancy for the entire gapminder dataset is 1952 - 2007.

gm_Lebanon <- gapminder %>% filter(country == "Lebanon") %>% group_by(year)
gm_Lebanon
# The years for which the Lebanese life expectancy is above the median life expectancy for the entire gapminder dataset is 1962 - 2007.

gm_Morocco <- gapminder %>% filter(country == "Morocco") %>% group_by(year)
gm_Morocco
# The years for which the Moroccan life expectancy is above the median life expectancy for the entire gapminder dataset is 1987 - 2007. 

gm_UnitedStates <- gapminder %>% filter(country == "United States") %>% group_by(year)
gm_UnitedStates
# The years for which the American life expectancy is above the median life expectancy for the entire gapminder dataset is 1952 - 2007.