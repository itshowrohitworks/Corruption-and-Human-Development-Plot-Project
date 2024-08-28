### Corruption-and-Human-Development-Project
The graph titled "Corruption and Human Development" visualizes the relationship between the Corruption Perceptions Index (CPI) and the Human Development Index (HDI) for various countries in 2011. The CPI scores range from 0 to 10, with 10 indicating the least corruption, while the HDI ranges from 0 to 10, with higher scores representing better human development outcomes.
Here's the step-by-step breakdown of the process you've followed to create the R file for plotting the "Corruption and Human Development Graph: The Economist":

# Step 1: Import Libraries and Load Dataset
- Import necessary libraries: `ggplot2` for plotting and `data.table` for data manipulation.
- Load the dataset using the `fread` function from the `data.table` package, and drop the first column.
- Use the `head()` function to display the first few rows of the dataset.

```R
library(ggplot2)
library(data.table)
df <- fread("Economist_Assignment_Data.csv", drop = 1)
head(df)
```

# Step 2: Create Scatter Plot
- Create a scatter plot object (`pl`) using `ggplot`.
- Set the aesthetics with `x = CPI`, `y = HDI`, and `color = Region`.
- Add points with specific shape and size using `geom_point`.

```R
pl <- ggplot(df, aes(x = CPI, y = HDI)) + 
      geom_point(aes(color = Region), shape = 'O', size = 3)
```

# Step 3: Add Trend Line
- Add a trend line to the scatter plot using `geom_smooth`.
- Define the group for the trend line, set the method to linear model (`'lm'`), use a log transformation for `x` in the formula, disable standard error shading (`se = FALSE`), and set the line color to red.

```R
pl2 <- pl + geom_smooth(aes(group = 1), method = 'lm', formula = y ~ log(x), se = FALSE, color = 'red')
```

# Step 4: Add Labels for Specific Countries
- Create a list of countries (`PointsToLabel`) to label on the graph.
- Add text labels for these countries using `geom_text`.
- Use `check_overlap = TRUE` to avoid overlapping labels.

```R
PointsToLabel <- c("Russia", "Venezuela", "Iraq", "Myanmar", "Sudan",
                   "Afghanistan", "Congo", "Greece", "Argentina", "Brazil",
                   "India", "Italy", "China", "South Africa", "Spane",
                   "Botswana", "Cape Verde", "Bhutan", "Rwanda", "France",
                   "United States", "Germany", "Britain", "Barbados", "Norway", "Japan",
                   "New Zealand", "Singapore")

pl3 <- pl2 + geom_text(aes(label = Country), color = 'gray20', 
                       data = subset(df, Country %in% PointsToLabel), 
                       check_overlap = TRUE)
```

# Step 5: Set Scales and Theme
- Set the x and y axis scales using `scale_x_continuous` and `scale_y_continuous` with appropriate labels, limits, and breaks.
- Apply a clean `bw` theme to the plot.

```R
pl4 <- pl3 + theme_bw()
pl5 <- pl4 + scale_x_continuous(name = 'Corruption Perceptions Index, 2011 (10 = Least Corrupt)',
                                limits = c(0.9, 10.5), breaks = 1:10) + 
            scale_y_continuous(name = 'Human Development Index, 2011 (11 = Best)', 
                               limits = c(0.2, 1.0))
```

# Step 6: Set the Title
- Add a title to the plot using `ggtitle`.

```R
pl6 <- pl5 + ggtitle('Corruption and Human Development')
print(pl6)
```
This sequence of steps outlines the creation of the scatter plot that visually represents the relationship between corruption and human development, with trend lines and specific labels for selected countries.
### THANK YOU
