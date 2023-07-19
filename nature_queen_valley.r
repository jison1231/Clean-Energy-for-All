#1
# Create a Data Frame containing country, electricity access percentage and electricity use per capita
# in gigawatt hours
country_elec <- data.frame(country=c("Nigeria", "China", "India", "Kenya", 
                                     "Uganda", "South Africa"),
                          elec_access=c(60, 97, 73, 40, 20, 90),
                          elec_use_per_cap=c(0.4,7,1, 0.1, 0.05, 6))

#2
# Calculate total energy use per capita (in gigawatt hours)
country_elec$total_elec_per_cap <- country_elec$elec_access*country_elec$elec_use_per_cap

#3
# Calculate the percent of renewable energy used within each country
renewable <- c(0.25, 0.45, 0.15, 0.55, 0.01, 0.20)
country_elec$renewable_pct <- renewable

#4
# Create a new column for the percent of energy from renewable sources
country_elec$renewable_energy_percentage <- country_elec$renewable_pct * country_elec$total_elec_per_cap

#5
# Calculate the average renewable energy percentage across all countries
mean_renewable <- mean(country_elec$renewable_energy_percentage)

#6
# Print the average renewable energy percentage across all countries
cat("The average renewable energy percentage across all countries is:", mean_renewable)

#7
# Create a function to determine the proportion of clean energy use for a particular country
proportion_clean_energy <- function(country, data){
  x <- as.character(country)
  my_data <- data[data$country == x,]
  prop_clean_energy <- my_data$renewable_energy_percentage/ my_data$total_elec_per_cap
  return(prop_clean_energy)
}

#8
# Calculate the proportion of clean energy use for each country
country_elec$prop_clean_energy <- sapply(country_elec$country, proportion_clean_energy, data=country_elec)

#9
# Create an index to rank each country in terms of clean energy use
index <- country_elec$prop_clean_energy * 100
country_elec$clean_energy_use_index <- index/max(index)*100

#10
# Create a new data frame to compare the clean energy use index to electricity access
clean_energy <- data.frame(country=c("Nigeria", "China", "India", "Kenya", 
                                     "Uganda", "South Africa"),
                           elec_access=c(60, 97, 73, 40, 20, 90),
                           clean_energy_index=c(30, 86, 46, 78, 2, 20))

#11
# Calculate correlation between electricity access and clean energy use index
correlation_elec_clean <- cor(clean_energy$elec_access, clean_energy$clean_energy_index)

#12
# Print out the correlation between electricity access and clean energy use index
cat("The correlation between electricity access and clean energy use index is:", correlation_elec_clean)

#13
# Create a function to convert clean energy use index to an absolute value
clean_energy_use <- function(index){
  x <- index/100
  absolute_value <- x*max(clean_energy$elec_access)
  return(absolute_value)
}

#14
# Calculate the absolute value of clean energy use for each country
clean_energy$clean_energy_abs_val <- sapply(clean_energy$clean_energy_index, clean_energy_use)

#15
# Create a line graph to illustrate the relationship between electricity access and clean energy use
library(ggplot2)
ggplot(clean_energy, aes(x=elec_access, y=clean_energy_abs_val, color=country)) +
  geom_line()+ theme_bw()+
  labs(x="Electricity Access (%)", y="Clean Energy Use (GWh)")+
  ggtitle("Clean Energy Use vs. Electricity Access")

#16
# Calculate the difference between clean energy use and electricity access
clean_energy$difference <- clean_energy$elec_access - clean_energy$clean_energy_abs_val

#17
# Create a bar plot to visualize the difference between clean energy use and electricity access
ggplot(clean_energy, aes(x=country, y=difference)) +
  geom_bar(stat="identity")+ theme_bw()+
  labs(x="Country", y="Difference Between\nElectricity Access and Clean Energy Use")+
  ggtitle("Difference Between Electricity Access and Clean Energy Use")

#18
# Create a linear regression model to predict the difference between clean energy use and electricity access
model <- lm(clean_energy$difference ~ clean_energy$elec_access)

#19
# Summarize the linear regression model
summary(model)

#20
# Calculate the predicted difference between clean energy use and electricity access
predicted_difference <- predict(model, clean_energy$elec_access)

#21
# Create a scatter plot to visualize the predicted difference between clean energy use and electricity access
ggplot(clean_energy, aes(x=elec_access, y=predicted_difference)) +
  geom_point()+ theme_bw()+
  labs(x="Electricity Access (%)", y="Predicted Difference\nBetween Electricity Access and Clean Energy Use")+
  ggtitle("Predicted Difference Between Electricity Access and Clean Energy Use")

#22
# Create a function to calculate the proportion of clean energy used compared to total energy used
proportion_clean_energy_use <- function(renewable_energy_percentage, total_elec_per_cap){
  proportion_clean_energy_use <- renewable_energy_percentage/total_elec_per_cap
  return(proportion_clean_energy_use)
}

#23
# Calculate the proportion of clean energy used compared to total energy used for each country
country_elec$prop_clean_energy_use <- with(country_elec, 
                                        proportion_clean_energy_use(renewable_energy_percentage, total_elec_per_cap))

#24
# Calculate the difference between the proportion of clean energy used and the proportion of electricity access
country_elec$diff_clean_elec <- country_elec$prop_clean_energy_use - country_elec$elec_access/100

#25
# Create a bar plot to visualize the difference between the proportion of clean energy used and the proportion
# of electricity access
ggplot(country_elec, aes(x=country, y=diff_clean_elec)) +
  geom_bar(stat="identity")+ theme_bw()+
  labs(x="Country", y="Difference Between\nProportion of Clean Energy Used and\nProportion of Electricity Access")+
  ggtitle("Difference Between Proportion of Clean Energy Used and Proportion of Electricity Access")

#26
# Create a linear regression model to predict the difference between the proportion of clean energy used
# and the proportion of electricity access
model2 <- lm(country_elec$diff_clean_elec ~ country_elec$elec_access)

#27
# Summarize the linear regression model
summary(model2)

#28
# Calculate the predicted difference between the proportion of clean energy used and the proportion of electricity access
predicted_diff <- predict(model2, country_elec$elec_access)

#29
# Create a scatter plot to visualize the predicted difference between the proportion of clean energy used
# and the proportion of electricity access
ggplot(country_elec, aes(x=elec_access, y=predicted_diff)) +
  geom_point()+ theme_bw()+
  labs(x="Electricity Access (%)", y="Predicted Difference Between\nProportion of Clean Energy Used and\nProportion of Electricity Access")+
  ggtitle("Predicted Difference Between Proportion of Clean Energy Used and Proportion of Electricity Access")

#30
# Calculate the proportion of households with access to clean energy
cleaned_energy_access <- country_elec$elec_access * country_elec$prop_clean_energy

#31
# Create a bar plot to visualize the proportion of households with access to clean energy
ggplot(country_elec, aes(x=country, y=cleaned_energy_access)) +
  geom_bar(stat="identity")+ theme_bw()+
  labs(x="Country", y="Proportion of Households with Access to Clean Energy")+
  ggtitle("Proportion of Households with Access to Clean Energy")

#32
# Calculate the difference between the proportion of households with access to clean energy
# and the proportion of households with access to electricity
country_elec$diff_clean_elec_access <- country_elec$cleaned_energy_access - country_elec$elec_access

#33
# Create a bar plot to visualize the difference between the proportion of households with access to clean energy
# and the proportion of households with access to electricity
ggplot(country_elec, aes(x=country, y=diff_clean_elec_access)) +
  geom_bar(stat="identity")+ theme_bw()+
  labs(x="Country", y="Difference Between\nProportion of Households with Access to Clean Energy\nand Proportion of Households with Access to Electricity")+
  ggtitle("Difference Between Proportion of Households with Access to Clean Energy and Proportion of Households with Access to Electricity")

#34
# Create a linear regression model to predict the difference between the proportion of households with access to clean energy
# and the proportion of households with access to electricity
model3 <- lm(country_elec$diff_clean_elec_access ~ country_elec$elec_access)

#35
# Summarize the linear regression model
summary(model3)

#36
# Calculate the predicted difference between the proportion of households with access to clean energy
# and the proportion of households with access to electricity
predicted_diff_elec_access <- predict(model3, country_elec$elec_access)

#37
# Create a scatter plot to visualize the predicted difference between the proportion of households with access to clean energy
# and the proportion of households with access to electricity
ggplot(country_elec, aes(x=elec_access, y=predicted_diff_elec_access)) +
  geom_point()+ theme_bw()+
  labs(x="Electricity Access (%)", y="Predicted Difference Between\nProportion of Households with Access to Clean Energy\nand Proportion of Households with Access to Electricity")+
  ggtitle("Predicted Difference Between Proportion of Households with Access to Clean Energy and Proportion of Households with Access to Electricity")

#38
# Create a function to estimate the number of households with access to clean energy
estimate_households_with_clean_energy <- function(elec_access, cleaned_energy_access){
  households_with_clean_energy <- cleaned_energy_access/elec_access * 100
  return(households_with_clean_energy)
}

#39
# Calculate the estimated number of households with access to clean energy
country_elec$est_households_with_clean_energy <- with(country_elec, 
                                            estimate_households_with_clean_energy(elec_access, cleaned_energy_access))

#40
# Create a bar plot to visualize the estimated number of households with access to clean energy
ggplot(country_elec, aes(x=country, y=est_households_with_clean_energy)) +
  geom_bar(stat="identity")+ theme_bw()+
  labs(x="Country", y="Estimated Number of Households\nwith Access to Clean Energy")+
  ggtitle("Estimated Number of Households with Access to Clean Energy")

#41
# Calculate the percentage of increase in households with access to clean energy
country_elec$percent_increase_clean_energy <- (country_elec$est_households_with_clean_energy - country_elec$elec_access)/country_elec$elec_access * 100

#42
# Create a bar plot to visualize the percentage of increase in households with access to clean energy
ggplot(country_elec, aes(x=country, y=percent_increase_clean_energy)) +
  geom_bar(stat="identity")+ theme_bw()+
  labs(x="Country", y="Percent Increase in Households\nwith Access to Clean Energy")+
  ggtitle("Percent Increase in Households with Access to Clean Energy")

#43
# Create a linear regression model to predict the percentage of increase in households with access to clean energy
model4 <- lm(country_elec$percent_increase_clean_energy ~ country_elec$elec_access)

#44
# Summarize the linear regression model
summary(model4)

#45
# Calculate the predicted percentage of increase in households with access to clean energy
predicted_increase_clean_energy <- predict(model4, country_elec$elec_access)

#46
# Create a scatter plot to visualize the predicted percentage of increase in households with access to clean energy
ggplot(country_elec, aes(x=elec_access, y=predicted_increase_clean_energy)) +
  geom_point()+ theme_bw()+
  labs(x="Electricity Access (%)", y="Predicted Percentage Increase in Households\nwith Access to Clean Energy")+
  ggtitle("Predicted Percentage Increase in Households with Access to Clean Energy")

#47
# Create a summary table displaying the results of the analysis
summary_table <- data.frame(Country = c("Nigeria", "China", "India", "Kenya", "Uganda", "South Africa"), 
                            Electricity.Access = c(60, 97, 73, 40, 20, 90),
                            Proportion.Clean.Energy.Used = round(country_elec$prop_clean_energy_use,2),
                            Proportion.Households.with.Access.to.Clean.Energy = round(country_elec$cleaned_energy_access,2),
                            Percentage.Increase.in.Households.with.Access.to.Clean.Energy = round(country_elec$percent_incre