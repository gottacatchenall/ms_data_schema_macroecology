using SimpleSDMLayers
using GBIF
using Plots
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

buildFeaturesMatrix(environment, occupancy) = begin
    xDim, yDim = size(environment[1])
    numberSpatialPoints = xDim*yDim
    numFeatures = length(environment)
        
    featuresMatrix = zeros(numberSpatialPoints, numFeatures)
    labels = [false for i in 1:numberSpatialPoints]
    occupancyLayer = getOccupancyLayer(environment[1], occupancy)
    
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

occupancy = getData(taxon("Picea pungens"))    
coords = coordinates(occupancy)
bounds = boundingBox(occupancy)
environment = worldclim([1,4,12,15]; bounds...)
for i in 1:length(bcvars) rescale!(environment[i], (0.,1.)) end

features, labels = buildFeaturesMatrix(environment, occupancy)


@model mv_logistic_regression(features, labels, σ) = begin
    numDataPts = size(features)[1]
    numFeatures = size(features)[2]
    α ~ Normal(0, σ)
    β_temp ~ Normal(0, σ)
    β_tempSeasonality ~ Normal(0, σ)
    β_precip ~ Normal(0, σ)
    β_precipSeasonality ~ Normal(0, σ)
    
    for i in 1:numDataPts
        v = α + β_temp*features[i,1] + β_tempSeasonality*features[i,2] + β_precip*features[i,3]+ β_precipSeasonality*features[i,4]
        p = logistic(v)
        labels[i] ~ Bernoulli(p)
    end

end;


chain = mapreduce(c -> sample(mv_logistic_regression(features, labels, 1), HMC(0.05, 10), 1000),
    chainscat,
    1
)

function predict(chain)
    predictedProb = similar(envLayer)
    for i in 1:length(predictedProb)
    end

end

function logit(β_temp, β_tempSeasonality)
end

scatter(coords)
plot(environment[1], frame=:box, aspectratio=1, c=:viridis)
scatter!(coords, c=:white, legend=nothing)

