# Clustering Analysis of European Employment (1979)

##  Overview

This project applies clustering techniques to analyze employment patterns across European countries in 1979. The aim is to identify economic structures and similarities between countries based on sector-wise employment distribution.

##  Dataset

The dataset contains the percentage of employment across different sectors:

* Agriculture (Agr)
* Mining (Min)
* Manufacturing (Man)
* Power Supply (PS)
* Construction (Con)
* Service Industries (SI)
* Finance (Fin)

Each row represents a country.

##  Methods Used

* Data standardization (scaling)
* K-means clustering
* Hierarchical clustering (Ward.D2)
* Elbow method
* Silhouette analysis

##  Key Findings

* Optimal number of clusters: **3**
* Identified clusters:

  * **Cluster 1:** Transitional economies (moderate industry, high mining)
  * **Cluster 2:** Modern/service-based economies
  * **Cluster 3:** Agriculture-dominated economies (outliers)

Both K-means and hierarchical clustering produced consistent results, confirming robustness.

##  Visualizations

* Heatmap of distance matrix
* Elbow plot
* Silhouette plot
* K-means cluster plot
* Dendrogram

##  Tools & Technologies

* R
* Libraries: `stats`, `factoextra`, `ggplot2`

##  Files

* `code/` → R scripts
* `report/` → Final coursework report
* `images/` → Figures used in analysis

##  How to Run

1. Open the R script in RStudio
2. Install required packages:

   ```r
   install.packages(c("factoextra", "ggplot2"))
   ```
3. Run the script step by step

##  Conclusion

The analysis reveals clear economic groupings among European countries, reflecting different stages of development from agriculture-based to service-oriented economies.
