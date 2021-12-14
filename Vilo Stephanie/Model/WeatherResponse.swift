//
//  WeatherResponse.swift
//  Vilo Stephanie
//
//  Created by Apprenant 85 on 12/12/2021.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let weather = try? newJSONDecoder().decode(Weather.self, from: jsonData)

import Foundation

// MARK: - WeatherElement
struct WeatherElement: Codable {
    let datasetid, recordid: String
    let fields: Fields
    let geometry: Geometry
    let recordTimestamp: String

    enum CodingKeys: String, CodingKey {
        case datasetid, recordid, fields, geometry
        case recordTimestamp = "record_timestamp"
    }
}

// MARK: - Fields
struct Fields: Codable {
    let surfaceNetThermalRadiation: Int
    let downwardShortWaveRadiationFlux, the2_MetreTemperature, minimumTemperatureAt2_Metres, surfaceNetSolarRadiation: Double
    let timestamp: String
    let surfaceLatentHeatFlux, totalWaterPrecipitation: Int
    let relativeHumidity: Double
    let surfaceSensibleHeatFlux: Int
    let position: [Double]
    let windSpeed: Double
    let forecast: String
    let maximumTemperatureAt2_Metres: Double

    enum CodingKeys: String, CodingKey {
        case surfaceNetThermalRadiation = "surface_net_thermal_radiation"
        case downwardShortWaveRadiationFlux = "downward_short_wave_radiation_flux"
        case the2_MetreTemperature = "2_metre_temperature"
        case minimumTemperatureAt2_Metres = "minimum_temperature_at_2_metres"
        case surfaceNetSolarRadiation = "surface_net_solar_radiation"
        case timestamp
        case surfaceLatentHeatFlux = "surface_latent_heat_flux"
        case totalWaterPrecipitation = "total_water_precipitation"
        case relativeHumidity = "relative_humidity"
        case surfaceSensibleHeatFlux = "surface_sensible_heat_flux"
        case position
        case windSpeed = "wind_speed"
        case forecast
        case maximumTemperatureAt2_Metres = "maximum_temperature_at_2_metres"
    }
}

// MARK: - Geometry
struct Geometry: Codable {
    let type: String
    let coordinates: [Double]
}

typealias Weather = [WeatherElement]

