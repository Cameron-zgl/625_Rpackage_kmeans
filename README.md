# Kmeans

**Kmeans** is an R package providing an implementation of the K-Means clustering algorithm. The package includes additional features such as visualization of clustering results and performance benchmarking against the base R `kmeans` function.

## Installation

To install the package from GitHub:
```R
devtools::install_github("Cameron-zgl/625_mypackage")
```

## Features

1. **Custom K-Means Implementation**: Provides a modular implementation of the K-Means clustering algorithm via the `my_kmeans` function.
2. **Cluster Visualization**: Visualize clustering results in 2D space using `plot_clusters`.
3. **Performance Benchmarking**: Compare the performance of `my_kmeans` with the base R `kmeans` function using `benchmark_kmeans`.
4. **C++ Integration**: Leverages C++ for efficient computation of distances.

## Example Usage

### Clustering with `my_kmeans`

```R
library(Kmeans)

# Generate example data
data <- matrix(rnorm(1000), ncol = 2)

# Perform clustering
result <- my_kmeans(data, centers = 3, nstart = 10)
print(result)
```

### Visualizing Clustering Results

```R
# Visualize the clustering results
plot_clusters(data, result$cluster, result$centers)
```

### Performance Benchmarking

```R
# Benchmark the performance of my_kmeans and base kmeans
benchmark <- benchmark_kmeans(data, centers = 3, nstart = 10)
print(benchmark)
```
