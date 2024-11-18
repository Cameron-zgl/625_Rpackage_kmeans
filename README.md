# Kmeans

**Kmeans** is an R package providing an implementation of the K-Means clustering algorithm. The package includes additional features such as visualization of clustering results and performance benchmarking against the base R `kmeans` function.

## Installation

To install the package from GitHub:
```R
devtools::install_github("Cameron-zgl/625_Rpackage_kmeans/")
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
## Example Testing

After installation, you can test the package functionality using the examples provided above or your custom data. Below is a quick test:
```R
data <- matrix(rnorm(500), ncol = 2)
result <- my_kmeans(data, centers = 2, nstart = 5)
plot_clusters(data, result$cluster, result$centers)
```
For more detailed,you can find references in documents such as `vignettes`. DEMO test output is in the folder `doc`.

## Contribution

Contributions are welcome! If you find any issues or have suggestions for new features, feel free to open an issue or submit a pull request on GitHub.

### Steps to Contribute:
1. Fork the repository.
2. Clone your fork locally.
3. Create a new branch for your feature or bug fix.
4. Commit your changes and push to your fork.
5. Submit a pull request describing your changes.

## License

This project is licensed under the MIT License. See the `LICENSE` file for details.

## Acknowledgments

- This package was developed as part of the Biostat 625 coursework at the University of Michigan.
- Special thanks to the instructors and teaching assistants for their guidance and support.
