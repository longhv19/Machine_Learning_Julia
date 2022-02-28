### A Pluto.jl notebook ###
# v0.16.1

using Markdown
using InteractiveUtils

# ╔═╡ c024590b-6655-4122-b23f-dc2e0e3d08ac
using Statistics

# ╔═╡ f3d286e0-1f2e-11ec-0083-dd742c7dadca
X = rand(10,5)

# ╔═╡ b272a4f7-50df-4b26-9a5c-1dc7073d1140
#indexing
X[1,:]

# ╔═╡ 638d8e0b-1860-466b-a419-9e511bdb7a14
X[1:3,:]

# ╔═╡ e6069887-276e-458d-830d-d928b4d1f7bf
X[[1,4,5,8], :]

# ╔═╡ 3efc44a3-2f8d-4cec-b911-97e318ffdce4
X[[1,4,5,8], [1,end]]

# ╔═╡ cf5b5e27-5bbe-4878-b626-209d53f196b1
v = rand(10)

# ╔═╡ 5d5405d4-7559-4099-8737-a3ac47714657
X[:, 1] = v

# ╔═╡ 9f098160-2222-411f-b69a-450171aafcd4
X

# ╔═╡ fbadb4c8-f27c-406e-9bab-1bb8b3c77c1a
#filter
y = [1 3 2 4 6 7]

# ╔═╡ 209141ac-3457-4d51-a27a-9ea42c9d9456
j = y .> 3

# ╔═╡ cf9eb379-4d31-4bcf-81df-52c300ad1c1a
y[j]

# ╔═╡ 48c859fc-42e3-4d2c-be72-98818cff751c
#take odd numbers only?
k = mod.(y,2) .== 1

# ╔═╡ 70e122df-55cb-4cd8-8a77-de4c93a118bb
y[k]

# ╔═╡ 66bec109-62ad-4e95-8bc2-4204080f6c33
filter(iseven, y)

# ╔═╡ 4828fb14-ce93-4283-a2e4-acf1bb93866c
filter(isodd, y)

# ╔═╡ 09574e0a-7415-4478-a4c6-30bf4d3fe64a
map(a -> 2*a, y)

# ╔═╡ 1b332921-5152-4299-87ea-a010a73b5c75
filter(a -> (mod(a,2)==0 && mod(a,3)==0),y)

# ╔═╡ 269f1f69-915c-4e66-be1c-1c06bdfed969
#sum/average
X

# ╔═╡ 451520fa-badb-4131-9ca2-e7cee6a5bc36
sum(X)

# ╔═╡ 62c83b01-5d04-4ee8-9a7d-46a537b46f88
#dims=1 tong theo cot
#dims=2 tong theo hang
sum(X, dims=2)

# ╔═╡ 6e73557c-dc61-4fe3-872a-d4b17fbb959b
mean(X, dims=1)

# ╔═╡ e8672a50-faa2-44c4-81a0-c0d9df48626a
mean(X, dims=1)

# ╔═╡ 761b8a12-768a-4004-b393-1deff5c7213d


# ╔═╡ 00000000-0000-0000-0000-000000000001
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
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
# ╠═f3d286e0-1f2e-11ec-0083-dd742c7dadca
# ╠═b272a4f7-50df-4b26-9a5c-1dc7073d1140
# ╠═638d8e0b-1860-466b-a419-9e511bdb7a14
# ╠═e6069887-276e-458d-830d-d928b4d1f7bf
# ╠═3efc44a3-2f8d-4cec-b911-97e318ffdce4
# ╠═cf5b5e27-5bbe-4878-b626-209d53f196b1
# ╠═5d5405d4-7559-4099-8737-a3ac47714657
# ╠═9f098160-2222-411f-b69a-450171aafcd4
# ╠═fbadb4c8-f27c-406e-9bab-1bb8b3c77c1a
# ╠═209141ac-3457-4d51-a27a-9ea42c9d9456
# ╠═cf9eb379-4d31-4bcf-81df-52c300ad1c1a
# ╠═48c859fc-42e3-4d2c-be72-98818cff751c
# ╠═70e122df-55cb-4cd8-8a77-de4c93a118bb
# ╠═66bec109-62ad-4e95-8bc2-4204080f6c33
# ╠═4828fb14-ce93-4283-a2e4-acf1bb93866c
# ╠═09574e0a-7415-4478-a4c6-30bf4d3fe64a
# ╠═1b332921-5152-4299-87ea-a010a73b5c75
# ╠═269f1f69-915c-4e66-be1c-1c06bdfed969
# ╠═451520fa-badb-4131-9ca2-e7cee6a5bc36
# ╠═62c83b01-5d04-4ee8-9a7d-46a537b46f88
# ╠═6e73557c-dc61-4fe3-872a-d4b17fbb959b
# ╠═c024590b-6655-4122-b23f-dc2e0e3d08ac
# ╠═e8672a50-faa2-44c4-81a0-c0d9df48626a
# ╠═761b8a12-768a-4004-b393-1deff5c7213d
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
