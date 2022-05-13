library(readxl)
FakeNews <- read_excel("Education/Other/Entity Academy/Data Wrangling and Data Visualization/FakeNews.xlsx")
View(FakeNews)

# To add a column labeled StoryType and fill it with Fake:
  
  FakeNews$StoryType = "Fake"
# To remove the "when" column:
  
  FakeNews1 <- FakeNews[, 2:4]
# To separate the URL column so you can see the website in one column and the domain in the other:
  
  library("tidyr")
FakeNews2 <- separate(FakeNews1, url, c("Website", "Domain"), sep="_")
# To put back together the domain column you broke apart:
  
  FakeNews3 <- unite(FakeNews2, FullSiteName, Website, Domain, sep = "_")
# To keep only the first ten rows of data:
  
  FakeNews4 <- FakeNews3[1:10,]
