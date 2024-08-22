# Load the necessary libraries
# Install packages if not already installed
if (!require(ggplot2)) install.packages("ggplot2")
if (!require(dplyr)) install.packages("dplyr")
if (!require(ggcorrplot)) install.packages("ggcorrplot")
if (!require(summarytools)) install.packages("summarytools")
if (!require(reshape2)) install.packages("reshape2")
if (!require(DataExplorer)) install.packages("DataExplorer")

# Load libraries
library(ggplot2)
library(dplyr)
library(ggcorrplot)
library(summarytools)
library(reshape2)
library(DataExplorer)

# Import dataset
mobiles <- read.csv("C:/Users/ADMIN/Documents/R Files/Flipkart_Mobiles.csv")

# View initial rows
View(head(mobiles))

# Check dataset dimensions
dim(mobiles)  # 3114 records and 8 variables 

# Check dataset structure
str(mobiles)

# Rename columns
colnames(mobiles)[colnames(mobiles) == "Selling Price"] <- "Selling_Price"
colnames(mobiles)[colnames(mobiles) == "Original Price"] <- "Original_Price"

# Summary of the data
summary(mobiles)

# Check for duplicate rows
duplicate_rows <- mobiles[duplicated(mobiles), ]
cat("Number of duplicate records:", nrow(duplicate_rows), "\n")

# Remove duplicate rows
unique_values <- unique(mobiles)
cat("Number of unique records:", nrow(unique_values), "\n")

# Check missing values
num_of_na_values <- colSums(is.na(mobiles))
print(num_of_na_values)

# Remove rows with NA values
clean_data <- na.omit(mobiles)
cat("Dimensions of cleaned data:", dim(clean_data), "\n")
print(colSums(is.na(clean_data)))

# Glimpse of the data
glimpse(mobiles)

# Histogram of mobile prices
ggplot(mobiles, aes(x = Selling_Price)) +
  geom_histogram(binwidth = 10000, fill = "skyblue", color = "black") +
  labs(title = "Distribution of Mobile Prices on Flipkart", x = "Price (INR)", y = "Frequency") +
  theme_minimal()

# Bar plot of mobile brands
ggplot(mobiles, aes(x = Brand)) +
  geom_bar(fill = "skyblue", color = "black") +
  labs(title = "Count of Mobile Brands", x = "Brand", y = "Count") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

# Scatter plot of Price vs. Rating
ggplot(mobiles, aes(x = Original_Price, y = Rating)) +
  geom_point(color = "blue", alpha = 0.7) +
  labs(title = "Scatter Plot of Mobile Price vs. Rating on Flipkart", 
       x = "Price (INR)", 
       y = "Rating") +
  theme_minimal()

# Box plot of Price by Brand
ggplot(mobiles, aes(x = Brand, y = Original_Price)) +
  geom_boxplot(fill = "lightblue", color = "darkblue") +
  labs(title = "Box Plot of Mobile Prices by Brand on Flipkart", 
       x = "Brand", 
       y = "Price (INR)") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

# Stacked bar plot of the count of mobiles by Brand and Rating
ggplot(mobiles, aes(x = Brand, fill = factor(Rating))) +
  geom_bar(position = "stack") +
  labs(title = "Stacked Bar Chart of Mobile Brands by Rating",
       x = "Brand",
       y = "Count",
       fill = "Rating") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

# Box plot to detect outliers in the Price variable
ggplot(mobiles, aes(y = Original_Price)) +
  geom_boxplot(fill = "lightblue", color = "darkblue", outlier.color = "red", outlier.shape = 16) +
  labs(title = "Box Plot to Detect Outliers in Mobile Prices", 
       x = "", 
       y = "Original Price (INR)") +
  theme_minimal()

# Heat map
numerical_cols <- mobiles[, sapply(mobiles, is.numeric)]

# Calculate the correlation matrix
cor_matrix <- cor(numerical_cols, use = "complete.obs")

# Melt the correlation matrix for ggplot2
melted_cor_matrix <- melt(cor_matrix)

# Create the heatmap
ggplot(data = melted_cor_matrix, aes(x = Var1, y = Var2, fill = value)) +
  geom_tile(color = "white") +
  scale_fill_gradient2(low = "blue", high = "red", mid = "white", 
                       midpoint = 0, limit = c(-1, 1), space = "Lab", 
                       name = "Correlation") +
  theme_minimal() + 
  labs(title = "Correlation Heatmap",
       x = "Variables",
       y = "Variables") +
  theme(axis.text.x = element_text(angle = 45, vjust = 1, hjust = 1))

# Generate a detailed report
create_report(mobiles, 
              output_file = "mobiles_report.html", 
              report_title = "Flipkart Mobiles Dataset Report")
