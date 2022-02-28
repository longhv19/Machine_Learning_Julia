### A Pluto.jl notebook ###
# v0.17.1

using Markdown
using InteractiveUtils

# ╔═╡ d301a2e3-6dda-4d3e-ade3-e3e6cb1b7eae
function train(X, y)
	N = length(y)
	D = size(X, 2)
	K = length(unique(y))
	θ_k = zeros(K)
	θ_jk = zeros(D, K)
	for k=1:K
		θ_k[k] = sum(y .== k)/N
		X_k = X[y .== k,:]
		s = sum(X_k, dims=1)
		θ_jk[:,k] = s ./ size(X_k, 1)
	end
	return θ_k, θ_jk #prior, likelihood
end

# ╔═╡ 0f02d8b4-1c9b-43ed-bca3-f1e7564fb68c


# ╔═╡ 54ad47a0-1f36-11ec-1266-cb7af92bbfb3
# X = 8x4 matrix


X = [1 1 1 0;
	1 1 1 1;
	0 1 1 0;
	0 0 1 1;
	0 0 0 0;
	0 0 0 1;
	1 0 0 0;
	0 1 1 1]

# ╔═╡ ad7c4d46-ad5c-41b5-9585-73176babfb72
# y = 1x8 column vector
y = [1, 1, 2, 2, 2, 1, 2, 1]

# ╔═╡ a0eb2fab-db97-48ba-8201-e23f791bded1
unique(y)

# ╔═╡ 367abc2f-54b3-41f9-9a00-d30be6469c5d
prior, likelihood = train(X, y)

# ╔═╡ 8ee8be39-ec7c-4ddb-9968-5292ea4e711c
function classify(prior, likelihood, x)
	K = length(prior)
	D = size(likelihood, 1)
	posterior = zeros(K)
	for k=1:K
		for j=1:D
			posterior[k] += (x[j] ==1) ? log(likelihood[j,k]) : log(1 - likelihood[j,k])
		end
		posterior[k] += log(prior[k])
	end

	return argmax(posterior)
end

# ╔═╡ b60c5a95-9c66-460b-8fa5-ffed8291ba3b
x = [1, 0, 1, 0]

# ╔═╡ 9ba329d9-eb5d-47ca-bfbc-5702688d3ac5
posterior = classify(prior, likelihood, x)

# ╔═╡ 8d4c796e-9182-4068-83be-a2c5a28cd220


# ╔═╡ Cell order:
# ╠═d301a2e3-6dda-4d3e-ade3-e3e6cb1b7eae
# ╠═0f02d8b4-1c9b-43ed-bca3-f1e7564fb68c
# ╠═54ad47a0-1f36-11ec-1266-cb7af92bbfb3
# ╠═ad7c4d46-ad5c-41b5-9585-73176babfb72
# ╠═a0eb2fab-db97-48ba-8201-e23f791bded1
# ╠═367abc2f-54b3-41f9-9a00-d30be6469c5d
# ╠═8ee8be39-ec7c-4ddb-9968-5292ea4e711c
# ╠═b60c5a95-9c66-460b-8fa5-ffed8291ba3b
# ╠═9ba329d9-eb5d-47ca-bfbc-5702688d3ac5
# ╠═8d4c796e-9182-4068-83be-a2c5a28cd220
