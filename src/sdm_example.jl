using SimpleSDMLayers
using GBIF
using Plots
using LinearAlgebra
using Turing
using StatsFuns: logistic

getData(tx::GBIFTaxon; country="US") = begin
    occData = occurrences(tx, "hasCoordinate" => true, "country" => country)
    while (length(occData)< 1000) 
        occurrences!(occData) 
        @info length(occData)
    end
    occData
end

coordinates(occData) = [(o.longitude, o.latitude) for o in occData]

boundingBox(occData) = begin
    left, right = extrema([o.longitude for o in occData]) .+ (-2, 2)
    bottom, top = extrema([o.latitude for o in occData])  .+ (-5, 5)
    (left=left, right=right, bottom=bottom, top=top)
end


latitude(r::GBIFRecord) = r.latitude
longitude(r::GBIFRecord) = r.longitude

getOccupancyLayer(envLayer::SimpleSDMPredictor, occupancy) = begin
    latticeLats = latitudes(envLayer)
    latticeLongs = longitudes(envLayer)

    occLayer = similar(envLayer)
    for o in occupancy
        long,lat = longitude(o), latitude(o) 
        occLayer[long,lat] = convert(eltype(occLayer), 1)
    end
    occLayer
end

function buildFeaturesMatrix(environment::LT, occurrence::OT) where {LT <: AbstractVector{T} where T <: SimpleSDMPredictor, OT <: GBIFRecords}
    xDim, yDim = size(environment[1])
    numberSpatialPoints = xDim*yDim
    numFeatures = length(environment)
        
    featuresMatrix = zeros(numberSpatialPoints, numFeatures)
    labels = [false for i in 1:numberSpatialPoints]
    occupancyLayer = getOccupancyLayer(environment[1], occurrence)
    
    cursor = 1
    for pt in 1:numberSpatialPoints
        if (!isnothing(environment[1][pt] ))
            for f in 1:numFeatures
                featuresMatrix[cursor, f] = environment[f][pt]  
                labels[cursor] = occupancyLayer[pt]
            end
            cursor += 1
        end
    end
    return (featuresMatrix[1:cursor, :], labels[1:cursor])
end

occupancy = getData(taxon("Carnegiea gigantea"))    
coords = coordinates(occupancy)
bounds = boundingBox(occupancy)
environment = worldclim(collect(1:19); bounds...)
for i in 1:length(environment) rescale!(environment[i], (0.,1.)) end

features, labels = buildFeaturesMatrix(environment, occupancy)


@model mv_logit(features, labels, σ) = begin
    numDataPts = size(features)[1]
    numFeatures = size(features)[2]
    α ~ Normal(0, σ)
    β ~ MvNormal([0. for i in 1:numFeatures], I*[σ for i in 1:numFeatures])
    for i in 1:numDataPts
        v = α + (β ⋅ features[i,:])
        p = logistic(v)
        labels[i] ~ Bernoulli(p)
    end
end;


chain = sample(mv_logit(features, labels, 1), HMC(0.01, 10), 1500)

function logit(α, β, features)
    v = α + (β ⋅ features)
    p = logistic(v)
end

function predict(chain, environment)
    predictedProb = similar(environment[1])
    numFeatures = length(environment)

    α = mean(chain[:α])
    βvec = [mean(chain["β[$i]"]) for i in 1:numFeatures]

    for i in 1:length(predictedProb)
        envFeatures= [environment[j][i] for j in 1:numFeatures]

        if (!in(nothing, envFeatures))
            prob::eltype(predictedProb) = (logit(α,βvec, envFeatures))
            predictedProb[i] = prob
        end
    end
    predictedProb
end

predictionLayer = predict(chain, environment)

pl = plot(predictionLayer, aspectratio=1, size=(700,1000), xlim=(bounds.left, bounds.right))
scatter!(coords, c=:white, alpha=0.2, legend=nothing)
savefig(pl, "out_sdm.png")
