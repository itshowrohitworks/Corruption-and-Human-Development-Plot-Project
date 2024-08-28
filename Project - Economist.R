# Corruption and Human Development Graph: The Economist
# Step 01: Import Libraries and Load Dataset:
library(ggplot2)
library(data.table)
df <- fread("Economist_Assignment_Data.csv",drop = 1)
head(df)
# Step 02: Create a scatter plot object called pl, x = CPI and y = HDI and Color = Region as Aesthetics
pl <- ggplot(df,aes(x=CPI,y=HDI)) + geom_point(aes(color=Region),shape='O',size=3)
# Step 03: Add the Trend line and Edit the Trend line: method,formula,se,color:
pl2 <- pl + geom_smooth(aes(group=1),method = 'lm',formula = y ~ log(x),se = F,color='red')
# Step 04: Add labels, assign it to country use text in geom, Define Point to table and add a subset checking overlapping:
PointsToLabel <- c("Russia", "Venezuela", "Iraq", "Myanmar", "Sudan",
                   "Afghanistan", "Congo", "Greece", "Argentina", "Brazil",
                   "India", "Italy", "China", "South Africa", "Spane",
                   "Botswana", "Cape Verde", "Bhutan", "Rwanda", "France",
                   "United States", "Germany", "Britain", "Barbados", "Norway", "Japan",
                   "New Zealand", "Singapore")
pl3 <- pl2 + geom_text(aes(label=Country),color='gray20',data = subset(df,Country %in% PointsToLabel),check_overlap = T)
# Step 05: Set the x and y scales and theme to bw():
pl4 <- pl3 + theme_bw()
pl5 <- pl4 + scale_x_continuous(name = 'Corruption Perceptions Index,2011 (10 = Least Corrupt)',limits = c(0.9, 10.5),breaks = 1:10) + scale_y_continuous(name = 'Human Development Index, 2011 (11 = Best)',limits = c(0.2, 1.0))
# Step 06: Set the title of the plot.
pl6 <- pl5 + ggtitle('Corruption and Human Development')
print(pl6)