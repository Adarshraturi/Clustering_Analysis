#installing packages and loading the library
install.packages(c('factoextra','cluster','fpc'))
library(factoextra)
library(cluster)
library(fpc)

#loading data
europeanJobs <- read_table("Downloads/europeanJobs.txt")
head(europeanJobs)
tail(europeanJobs)

#data processing
#removing country column because we only need numeric values and making a separate data for that 
data_EJ = europeanJobs[,-1]
head(data_EJ)

#standardizing the data
data_EJ_scaled <- scale(data_EJ)
head(data_EJ_scaled)


#determine the optimal cluster with elbow and silhouette method
fviz_nbclust(data_EJ_scaled, kmeans, method = "wss") +
  ggtitle("Elbow Method")

fviz_nbclust(data_EJ_scaled, kmeans, method = "silhouette") +
  ggtitle("Silhouette Method")

#visualizing  a distance matrix heatmap to know more about the similarities in between the countries
distance <- get_dist(data_EJ_scaled)
fviz_dist(distance, gradient = list(low = "#00AFBB", mid = "white", high = "#FC4E07"))

# K-Means Cluster Analysis with 3 centers
fit <- kmeans(data_EJ_scaled, centers = 3, nstart = 30) 
# 3 clusters solution with 25 different initial configurations

# Display number of observations in each cluster
table(fit$cluster)

#The kmeans object that has a lot of components 
fit


# see which country is in which cluster 
kmeans_clusters <- data.frame(Country = rownames(europeanJobs),Cluster = fit$cluster)
kmeans_clusters

# Cluster 1
kmeans_clusters[kmeans_clusters$Cluster == 1, ]
# Cluster 2
kmeans_clusters[kmeans_clusters$Cluster == 2, ]
# Cluster 3
kmeans_clusters[kmeans_clusters$Cluster == 3, ]


#Visualize K-means Clusters
fviz_cluster(fit, data = data_EJ,geom = "point",ellipse.type = "convex",ggtheme = theme_minimal(),main = "K-means Clustering")

#plotcluster in fpc pacakge
plotcluster(data_EJ_scaled, fit$cluster)

# get cluster summary
aggregate(data_EJ_scaled,by=list(fit$cluster),FUN=mean)




#Wards Method or Hierarchical clustering

#Calculating the distance matrix
data_EJ_scaled.dist=dist(data_EJ_scaled)

#Obtaining clusters using the WardD2 method
data_EJ_scaled.hclust=hclust(data_EJ_scaled.dist, method="ward.D2")
plot(data_EJ_scaled.hclust)

#Cut dendrogram at the 3 clusters level and obtain cluster
data_EJ_scaled.3clust = cutree(data_EJ_scaled.hclust,k=3)
data_EJ_scaled[data_EJ_scaled.3clust==3,]

# see what in each cluster 

hierar_clusters <- data.frame(Country = rownames(europeanJobs),Cluster = data_EJ_scaled.3clust)
hierar_clusters

#visualize the hierarchical cluster
plotcluster(data_EJ_scaled, data_EJ_scaled.3clust)
