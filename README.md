
# KMeans Package Demo

**mypackage** provides an implementation of the K-Means clustering algorithm.

## Installation

```R
# Install directly from GitHub:
devtools::install_github("Cameron-zgl/625_mypackage")
```

## Example Usage

Here, we generate a dataset of random numbers and use the `my_kmeans` function from the `mypackage` package to perform clustering.

```R
# Load the Kmeans package
library(Kmeans)

# Generate some random data
set.seed(123)
data <- matrix(rnorm(100), ncol = 2)

# Perform clustering using my_kmeans
result <- my_kmeans(data, centers = 3, nstart = 10)

# Print the clustering result
print(result)
```

## Visualizing the Results

We can visualize the clustering results using a scatter plot.

```R
# Assign colors to clusters
colors <- c("red", "blue", "green")
cluster_colors <- colors[result$cluster]

# Plot the data
plot(data, col = cluster_colors, pch = 19, main = "KMeans Clustering Results")
points(result$centers, col = colors, pch = 4, cex = 2, lwd = 2) # Plot cluster centers
```

## Comparing with Base R `kmeans`

Let's compare the results of `my_kmeans` with the base R `kmeans` function.

```R
# Perform clustering using the base R kmeans function
base_result <- kmeans(data, centers = 3, nstart = 10)

# Check if the cluster assignments are the same
all_equal <- all.equal(result$cluster, base_result$cluster)
cat("Are the cluster assignments the same?", all_equal, "\n")

# Check the within-cluster sum of squares
cat("my_kmeans within-cluster sum of squares:", result$withinss, "\n")
cat("Base R kmeans within-cluster sum of squares:", base_result$tot.withinss, "\n")
```

## Benchmarking Performance

We can use the `bench` package to compare the performance of `my_kmeans` and the base R `kmeans`.

```R
library(bench)

# Benchmark the two functions
benchmark <- bench::mark(
  my_kmeans = my_kmeans(data, centers = 3, nstart = 10),
  base_kmeans = kmeans(data, centers = 3, nstart = 10),
  iterations = 100
)

# Print the benchmark results
print(benchmark)
```
