### A Pluto.jl notebook ###
# v0.17.1

using Markdown
using InteractiveUtils

# ╔═╡ 390ba39c-c1b8-4942-998f-671dd2c7b3db
using Statistics

# ╔═╡ d0a7e384-c1a6-4eb0-82b5-5c7e71450b28
using LinearAlgebra

# ╔═╡ ac42a1d0-5d44-11ec-31f1-251eeb450709
# Implementation of the PCA algorithm

#Input: dataset X (matrx of shape N x D)
#Output: re-presentation Z (matrix of shape N x d) whew d <= D

#Step 1: Normalize X so that its mean is a zero-vector (X_norm)
#Step 2: Compute the cavariance of X_norm: S = cov(X_norm)
#Step 3: Compute eigenvectors and eigenvalues of S
#Step 4: Sort the eigenvectors by their corresponding egenvalues indescending order
#Step 5: Arrange d selected eigenvectors into a matrix θ
#Step 6: Compute Z = X*θ

# ╔═╡ 04719540-9b19-43f5-8cbd-dca39c5cb216
X = rand(10, 5)

# ╔═╡ 2257fc04-a9ee-43c4-b65b-0c2650a0af60
mean(X, dims=1)

# ╔═╡ e4970df7-2775-4c75-85e7-a984c1fdbaba
S = cov(X)

# ╔═╡ 4d9f73b4-c971-4494-b0df-30fbd2541c34
eig = eigen(S)

# ╔═╡ 8e817023-f853-4c91-b0bf-f3fa4907c371
eig.values

# ╔═╡ 99689957-ec53-4796-8e0a-36762168fe39
eig.vectors

# ╔═╡ ecbf1334-2ef0-417e-8a3d-926793436d4a


# ╔═╡ 61cd5c79-0d36-4f74-bc8b-fdc65e49c081
function pca(X, d)
	μ = mean(X, dims=1)
	N, D = size(X)
	X_norm = X - repeat(μ, N, 1)
	S = X'*X/(N - 1)  #cov(X_norm)
	eig = eigen(S)
	θ = eig.vectors[:, D:-1:(D-d+1)]
	Z = X*θ
	return Z
end


# ╔═╡ 87d45d3b-5073-4a6e-9caf-622b26c9f31f
pca(X, 2)

# ╔═╡ 09faa9e0-4ce5-43eb-9efe-f0fe91517612
pca(X, 3)

# ╔═╡ 83d44ca0-3c8d-46e3-b82e-c712d99f16aa
## Summary the course

1. Introduction to Machine Learning

2.Supervised Learning (học có giám sát/ hướng dẫn)
	D = {(x_1, y_1), (x_2, y_2), ..., (x_N, y_N)}
2.1. Classification
	y = f(x; θ), y E {1, 2, ..., K}
	Methods/Approaches/Models
		Navie bayes
		Logistic Regression / Multinomial Logistic Regression
		Neural Network
		
2.2. Regression/Prediction
	y = f(x; θ), y E R
	Methods/Approaches/Models
		Linear Regression
		Neural Network

3.Unsupervised Learning
	Dataset = {x_1, x_2, ..., x_N}
3.1. Clustering
	GMM and EM algorithm
	K_means
3.2. Dimensionality Reduction
	PCA

Librarie, Programing in Julia
- training, test, real datasets
- evaluation (accuracy, precision/recall/F1-meansure, areaUnderROC curve)

# ╔═╡ 00000000-0000-0000-0000-000000000001
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
LinearAlgebra = "37e2e46d-f89d-539d-b4ee-838fcccc9c8e"
Statistics = "10745b16-79ce-11e8-11f9-7d13ad32a3b2"
"""

# ╔═╡ 00000000-0000-0000-0000-000000000002
PLUTO_MANIFEST_TOML_CONTENTS = """
# This file is machine-generated - editing it directly is not advised

[[Libdl]]
uuid = "8f399da3-3557-5675-b5ff-fb832c97cbdb"

[[LinearAlgebra]]
deps = ["Libdl"]
uuid = "37e2e46d-f89d-539d-b4ee-838fcccc9c8e"

[[Random]]
deps = ["Serialization"]
uuid = "9a3f8284-a2c9-5f02-9a11-845980a1fd5c"

[[Serialization]]
uuid = "9e88b42a-f829-5b0c-bbe9-9e923198166b"

[[SparseArrays]]
deps = ["LinearAlgebra", "Random"]
uuid = "2f01184e-e22b-5df5-ae63-d93ebab69eaf"

[[Statistics]]
deps = ["LinearAlgebra", "SparseArrays"]
uuid = "10745b16-79ce-11e8-11f9-7d13ad32a3b2"
"""

# ╔═╡ Cell order:
# ╠═ac42a1d0-5d44-11ec-31f1-251eeb450709
# ╠═390ba39c-c1b8-4942-998f-671dd2c7b3db
# ╠═04719540-9b19-43f5-8cbd-dca39c5cb216
# ╠═2257fc04-a9ee-43c4-b65b-0c2650a0af60
# ╠═e4970df7-2775-4c75-85e7-a984c1fdbaba
# ╠═d0a7e384-c1a6-4eb0-82b5-5c7e71450b28
# ╠═4d9f73b4-c971-4494-b0df-30fbd2541c34
# ╠═8e817023-f853-4c91-b0bf-f3fa4907c371
# ╠═99689957-ec53-4796-8e0a-36762168fe39
# ╠═ecbf1334-2ef0-417e-8a3d-926793436d4a
# ╠═61cd5c79-0d36-4f74-bc8b-fdc65e49c081
# ╠═87d45d3b-5073-4a6e-9caf-622b26c9f31f
# ╠═09faa9e0-4ce5-43eb-9efe-f0fe91517612
# ╠═83d44ca0-3c8d-46e3-b82e-c712d99f16aa
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
