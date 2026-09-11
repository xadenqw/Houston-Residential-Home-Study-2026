##### Install packages #####
install.packages("readxl") ## extension to be able to read data from sql
install.packages("ggplot2")
library(ggplot2)
library(readxl)

##### Importing Data from Python and SQL as an xlsx file #####
data <- read_xlsx(
  "C:/Users/xaden/Documents/ResidentialPropertiesProject/Property_Information.xlsx",
  na = "NULL"
)

##### Important Base Functions #####
colnames(data)
## Clean Up Data
data <- data[-1104, ]

##### Summarizing Data #####
summary(data)

##### Data Visualization #####
##Distribution of Residential Current Prices
hist(data$CurrentPrice,
     main = "Distribution of Residential Current Prices",
     xlab = "Current Price")

##Distribution of Building Size (in SqFt)
hist(data$SqFt,
     main = "Distribution of Building Size (in SqFt)",
     xlab = "Building SqFt")

## Distribution of Days on Market
hist(data$CDOM,
     main = "Distribution of Days on Market",
     xlab = "CDOM")

## Distribution of Year Built
hist(data$YearBuilt,
     main = "Distribution of Year Built",
     xlab = "Year Built")

##Current Price based on Zip Code
boxplot(data$CurrentPrice~data$Zip,
     main = "Current Price based on Zip Code",
     xlab = "Zip Code",
     ylab = "Current Price")

##Building Square footage based on Zip Code
boxplot(data$SqFt~data$Zip,
     main = "Building Square footage based on Zip Code",
     xlab = "Zip Code",
     ylab = "Building SqFt")

##List Price vs. Current Price
plot(data$ListPrice~data$CurrentPrice,
     main = "List Price vs. Current Price",
     xlab = "Current Price",
     ylab = "List Price")

##Building Size vs. Number of Bathrooms
plot(data$Zip,
     data$Baths,
     main = "Building Size vs. Number of Bathrooms",
     xlab = "Building SqFt",
     ylab = "Baths Total")
abline(lm(Baths ~ SqFt, data = data))

##Current Value vs. Number of Bathrooms
plot(data$CurrentPrice,
     data$Baths,
     main = "Current Value vs. Number of Bathrooms",
     xlab = "Building SqFt",
     ylab = "Baths Total")
abline(lm(Baths ~ CurrentPrice, data = data))


cor(data$SqFt,
    data$CurrentPrice,
    use = "complete.obs")

vars <- data[c(SqFt, LotSize,
                 Bedrooms, Baths, YearBuilt, CDOM)]

cor(vars, use = "complete.obs")



##### Statistical Findings #####

## Does location change the relationship between size and price?
model <- lm(ClosePrice ~ SqFt * Area,
            data = data)

summary(model) #0.7937 R^2, represents a strong correlation

plot(model,which=4)
data <- data[-1104, ]

ggplot(data, aes(x = SqFt,
                 y = ClosePrice,
                 color = Area)) +
  geom_point(alpha = 0.5) +
  geom_smooth(method = "lm", se = FALSE) +
  labs(
    title = "Building Size vs. Close Price by Area",
    x = "Building SqFt",
    y = "Close Price",
    color = "Area"
  )


##Home Sale Price by Area (07/55 vs 98/07)
ggplot(data, aes(x = Area, y = ClosePrice)) +
  geom_boxplot() +
  labs(
    title = "Home Sale Prices by Area",
    x = "Zip Codes",
    y = "Close Price"
  )

ggplot(data, aes(x = YearBuilt, fill = Area)) +
  geom_histogram(
    binwidth = 5,
    position = "identity",
    alpha = 0.5
  ) +
  labs(
    title = "Distribution of Year Built by Houston Area",
    x = "Year Built",
    y = "Number of Homes",
    fill = "Area"
  ) +
  theme_minimal()

colnames(data)
data

ggplot(data, aes(
  x = SqFt,
  y = ClosePrice,
  color = PriceCategory
)) +
  geom_point(alpha = 0.5) +
  geom_smooth(method = "lm", se = FALSE) +
  coord_cartesian(xlim = c(0, 8000)) +
  labs(
    title = "Building Size vs. Sale Price by Price Category",
    x = "Building SqFt",
    y = "Close Price",
    color = "Price Category"
  )

mean(data$ClosePrice,na.rm=TRUE)
mean(data$SqFt,na.rm=TRUE)
na.omit(data)
mean(data$SqFt)

     