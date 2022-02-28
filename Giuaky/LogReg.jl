### A Pluto.jl notebook ###
# v0.17.1

using Markdown
using InteractiveUtils

# ╔═╡ 80d1e8c4-d49a-49ec-9019-2b7dc0e81506
using DelimitedFiles

# ╔═╡ 35120860-46b2-11ec-2449-451475fd3d21
md"""
	Read Data
"""

# ╔═╡ 4df7bccb-bba2-4a70-a424-f0f585877a69
function readData(path)
	A = readdlm(path, ',')
	y = Int.(A[:,2])
	X = hcat(ones(length(y)), A[:,3:12])
	return (X, y)
end

# ╔═╡ 3104b0b4-e49c-4294-a638-01bf140d8430
X, y = readData("E:/Julia/data/wdbc.txt")

# ╔═╡ 82735b73-7f3b-4d15-a99a-32f4a4b42f38
md"""
	Create Sigmoid function
"""

# ╔═╡ 63e176d8-8f86-4b30-82a1-134acf1cddff
function σ(z)
	return 1 ./ (1 .+ exp.(-z))
end

# ╔═╡ 09ef830c-ec33-40c1-9117-29f9636a90d1
md"""
	Gradient Descent
"""

# ╔═╡ 752aa2dd-e204-43a5-9e0e-0c779bf9a052
md"""
	Create cost function J(X, y, θ)
"""

# ╔═╡ 4408db64-b00b-4025-b58e-73935814dc34
function J(X::Array{Float64,2}, y::Array{Int}, θ::Array{Float64}, λ=0.0)::Float64
	N = length(y)
	u = θ[2:end]
	return (-1/N)*(y'*log.(σ(X*θ) .+ 1E-6) + (1 .- y)'*log.(1 .- σ(X*θ) .+ 1E-6)) + λ*u'*u/(2*N)
end

# ╔═╡ bd66d575-0dd1-4152-b51d-cb9fdfa93e9e
N, D = size(X)

# ╔═╡ db7db70e-8f7c-468b-8702-c683835d26b3
1 - σ(20)

# ╔═╡ 8d955c6d-09cd-4b01-a15b-dc5f0003f505
θ = ones(D)

# ╔═╡ facb6113-0c52-45a7-9ffd-1af135914227
J(X, y, θ, 0.01)

# ╔═╡ 4a53b68c-8eda-4435-86ea-49513e0d76dd
md"""
	Create function ∇J 
"""

# ╔═╡ 102409f1-56fd-4ebe-9284-24c856e59f0a
function ∇J(X, y, θ, λ=0.0)
	N = length(y)
	u = copy(θ)
	u[1] = 0
	return X'*(σ(X*θ) - y)/N  +  λ*u/N
end

# ╔═╡ 4c87a4a3-e446-4c3f-9148-ac0cf2a3f12d
function bgd(X, y, θ_0, λ=0.0, α=0.01, T = 1000)
	θ = θ_0
	θs = []
	N = length(y)
	for _= 1:T
		θ = θ - α*∇J(X, y, θ, λ)
		push!(θs, θ)
	end
	return θs
end

# ╔═╡ 0360f123-2530-4f63-8b0b-61420aaf319f
θ_0 = zeros(D)

# ╔═╡ 5b801c61-3ea4-4d9c-a9e7-c92acefdb86b
θs = bgd(X, y, θ_0, 0.01,0.01, 100)

# ╔═╡ e73dd076-808b-40a7-a3a0-f2777326632e
function classify(X, θ_best, t=0.5)
	y = X * θ
	return y .< t
end

# ╔═╡ dfcffe03-f4b9-4f98-9812-fcacfe534fbc
function evaluate(X, y, θ_best, t = 0.5)::Float64
	ŷ = classify(X, θ, t)
	return sum(ŷ .== (y .== 0)) / length(y)
end

# ╔═╡ 5d21271d-c96d-4ac9-a58e-8131f01cae0b


# ╔═╡ 00000000-0000-0000-0000-000000000001
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
DelimitedFiles = "8bb1440f-4735-579b-a4ab-409b98df4dab"
"""

# ╔═╡ 00000000-0000-0000-0000-000000000002
PLUTO_MANIFEST_TOML_CONTENTS = """
# This file is machine-generated - editing it directly is not advised

[[DelimitedFiles]]
deps = ["Mmap"]
uuid = "8bb1440f-4735-579b-a4ab-409b98df4dab"

[[Mmap]]
uuid = "a63ad114-7e13-5084-954f-fe012c677804"
"""

# ╔═╡ Cell order:
# ╟─35120860-46b2-11ec-2449-451475fd3d21
# ╠═80d1e8c4-d49a-49ec-9019-2b7dc0e81506
# ╠═4df7bccb-bba2-4a70-a424-f0f585877a69
# ╠═3104b0b4-e49c-4294-a638-01bf140d8430
# ╟─82735b73-7f3b-4d15-a99a-32f4a4b42f38
# ╠═63e176d8-8f86-4b30-82a1-134acf1cddff
# ╟─09ef830c-ec33-40c1-9117-29f9636a90d1
# ╟─752aa2dd-e204-43a5-9e0e-0c779bf9a052
# ╠═4408db64-b00b-4025-b58e-73935814dc34
# ╠═bd66d575-0dd1-4152-b51d-cb9fdfa93e9e
# ╠═db7db70e-8f7c-468b-8702-c683835d26b3
# ╠═8d955c6d-09cd-4b01-a15b-dc5f0003f505
# ╠═facb6113-0c52-45a7-9ffd-1af135914227
# ╟─4a53b68c-8eda-4435-86ea-49513e0d76dd
# ╠═102409f1-56fd-4ebe-9284-24c856e59f0a
# ╠═4c87a4a3-e446-4c3f-9148-ac0cf2a3f12d
# ╠═0360f123-2530-4f63-8b0b-61420aaf319f
# ╠═5b801c61-3ea4-4d9c-a9e7-c92acefdb86b
# ╠═e73dd076-808b-40a7-a3a0-f2777326632e
# ╠═dfcffe03-f4b9-4f98-9812-fcacfe534fbc
# ╠═5d21271d-c96d-4ac9-a58e-8131f01cae0b
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
