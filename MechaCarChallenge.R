#Deliverable 1- Linear Regression to Predict MPG

# Load Package
library(dplyr)

# File is imported and read into dataframe
Mecha_mpg <- read.csv('MechaCar_mpg.csv')

# Perform linear regression
Mecha_linear = lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD,data=Mecha_mpg)

# Determine the p-value and the r-squared value for the linear regression model
summary(Mecha_linear)

#Deliverable 2- Create Visualizations for the Trip Analysis

# File is imported and read into dataframe
Mecha_coil <- read.csv('Suspension_coil.csv')

# An RScript is written to create a summary dataframe
total_summary = summarise(Mecha_coil,
                          Mean = mean(PSI, na.rm = TRUE),
                          Median = median(PSI, na.rm = TRUE),
                          Variance = var(PSI, na.rm = TRUE),
                          SD = sd(PSI, na.rm = TRUE)
)

# An RScript is written to create a lot summary dataframe
lot_summary = group_by(Mecha_coil, Manufacturing_Lot) %>%
              summarise(  Mean = mean(PSI, na.rm = TRUE),
                          Median = median(PSI, na.rm = TRUE),
                          Variance = var(PSI, na.rm = TRUE),
                          SD = sd(PSI, na.rm = TRUE)
)

#Deliverable 3- T-Tests on Suspension Coils

# Peform t-test across all
t.test(Mecha_coil$PSI, mu = 1500)

# Peform t-test on Lot 1
t.test(subset(Mecha_coil,Manufacturing_Lot=="Lot1")$PSI,mu = 1500)

# Peform t-test on Lot 2
t.test(subset(Mecha_coil,Manufacturing_Lot=="Lot2")$PSI,mu = 1500)

# Peform t-test on Lot 3
t.test(subset(Mecha_coil,Manufacturing_Lot=="Lot3")$PSI,mu = 1500)