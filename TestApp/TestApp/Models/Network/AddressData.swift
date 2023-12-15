//
//  RequestData.swift
//  TestApp
//
//  Created by Елена Воронцова on 15.12.2023.
//

import Foundation

struct AddressData {
    typealias Response = AddressDataResponse
    var path: URL = URL(string: "http://suggestions.dadata.ru/suggestions/api/4_1/rs/suggest/address/")!
    
    struct AddressDataResponse: Decodable {
        let suggestions: [Suggestion]?
        
        enum CodingKeys: String, CodingKey {
            case suggestions = "suggestions"
        }
    }
    
    struct Suggestion: Decodable {
        let value: String?
        let unrestrictedValue: String?
        let data: DataClass?
        
        enum CodingKeys: String, CodingKey {
            case value = "value"
            case unrestrictedValue = "unrestricted_value"
            case data = "data"
        }
    }
    
    struct DataClass: Decodable {
        let postalCode: String?
        let country: String?
        let countryISOCode: String?
        let federalDistrict: String?
        let regionFiasID: String?
        let regionKladrID: String?
        let regionISOCode: String?
        let regionWithType: String?
        let regionType: String?
        let regionTypeFull: String?
        let region: String?
        let areaFiasID: String?
        let areaKladrID: String?
        let areaWithType: String?
        let areaType: String?
        let areaTypeFull: String?
        let area: String?
        let cityFiasID: String?
        let cityKladrID: String?
        let cityWithType: String?
        let cityType: String?
        let cityTypeFull: String?
        let city: String?
        let cityArea: String?
        let cityDistrictFiasID: String?
        let cityDistrictWithType: String?
        let cityDistrictType: String?
        let cityDistrictTypeFull: String?
        let cityDistrict: String?
        let settlementFiasID: String?
        let settlementKladrID: String?
        let settlementWithType: String?
        let settlementType: String?
        let settlementTypeFull: String?
        let settlement: String?
        let streetFiasID: String?
        let streetKladrID: String?
        let streetWithType: String?
        let streetType: String?
        let streetTypeFull: String?
        let street: String?
        let steadFiasID: String?
        let steadCadnum: String?
        let steadType: String?
        let steadTypeFull: String?
        let stead: String?
        let houseFiasID: String?
        let houseCadnum: String?
        let houseKladrID: String?
        let houseType: String?
        let houseTypeFull: String?
        let house: String?
        let blockType: String?
        let blockTypeFull: String?
        let block: String?
        let flatFiasID: String?
        let flatCadnum: String?
        let flatType: String?
        let flatTypeFull: String?
        let flat: String?
        let flatArea: String?
        let squareMeterPrice: String?
        let flatPrice: String?
        let postalBox: String?
        let fiasID: String?
        let fiasLevel: String?
        let fiasActualityState: String?
        let kladrID: String?
        let geonameID: String?
        let capitalMarker: String?
        let okato: String?
        let oktmo: String?
        let taxOffice: String?
        let taxOfficeLegal: String?
        let timezone: String?
        let geoLat: String?
        let geoLon: String?
        let beltwayHit: String?
        let beltwayDistance: String?
        let metro: [Metro]?
        let divisions: String?
        let qcGeo: String?
        let historyValues: String?
        
        enum CodingKeys: String, CodingKey {
            case postalCode = "postal_code"
            case country = "country"
            case countryISOCode = "country_iso_code"
            case federalDistrict = "federal_district"
            case regionFiasID = "region_fias_id"
            case regionKladrID = "region_kladr_id"
            case regionISOCode = "region_iso_code"
            case regionWithType = "region_with_type"
            case regionType = "region_type"
            case regionTypeFull = "region_type_full"
            case region = "region"
            case areaFiasID = "area_fias_id"
            case areaKladrID = "area_kladr_id"
            case areaWithType = "area_with_type"
            case areaType = "area_type"
            case areaTypeFull = "area_type_full"
            case area = "area"
            case cityFiasID = "city_fias_id"
            case cityKladrID = "city_kladr_id"
            case cityWithType = "city_with_type"
            case cityType = "city_type"
            case cityTypeFull = "city_type_full"
            case city = "city"
            case cityArea = "city_area"
            case cityDistrictFiasID = "city_district_fias_id"
            case cityDistrictWithType = "city_district_with_type"
            case cityDistrictType = "city_district_type"
            case cityDistrictTypeFull = "city_district_type_full"
            case cityDistrict = "city_district"
            case settlementFiasID = "settlement_fias_id"
            case settlementKladrID = "settlement_kladr_id"
            case settlementWithType = "settlement_with_type"
            case settlementType = "settlement_type"
            case settlementTypeFull = "settlement_type_full"
            case settlement = "settlement"
            case streetFiasID = "street_fias_id"
            case streetKladrID = "street_kladr_id"
            case streetWithType = "street_with_type"
            case streetType = "street_type"
            case streetTypeFull = "street_type_full"
            case street = "street"
            case steadFiasID = "stead_fias_id"
            case steadCadnum = "stead_cadnum"
            case steadType = "stead_type"
            case steadTypeFull = "stead_type_full"
            case stead = "stead"
            case houseFiasID = "house_fias_id"
            case houseKladrID = "house_kladr_id"
            case houseCadnum = "house_cadnum"
            case houseType = "house_type"
            case houseTypeFull = "house_type_full"
            case house = "house"
            case blockType = "block_type"
            case blockTypeFull = "block_type_full"
            case block = "block"
            case flatFiasID = "flat_fias_id"
            case flatCadnum = "flat_cadnum"
            case flatType = "flat_type"
            case flatTypeFull = "flat_type_full"
            case flat = "flat"
            case flatArea = "flat_area"
            case squareMeterPrice = "square_meter_price"
            case flatPrice = "flat_price"
            case postalBox = "postal_box"
            case fiasID = "fias_id"
            case fiasLevel = "fias_level"
            case fiasActualityState = "fias_actuality_state"
            case kladrID = "kladr_id"
            case geonameID = "geoname_id"
            case capitalMarker = "capital_marker"
            case okato = "okato"
            case oktmo = "oktmo"
            case taxOffice = "tax_office"
            case taxOfficeLegal = "tax_office_legal"
            case timezone = "timezone"
            case geoLat = "geo_lat"
            case geoLon = "geo_lon"
            case beltwayHit = "beltway_hit"
            case beltwayDistance = "beltway_distance"
            case metro = "metro"
            case divisions = "divisions"
            case qcGeo = "qc_geo"
            case historyValues = "history_values"
        }
    }
    
    struct Metro: Decodable {
        let name: String?
        let line: String?
        let distance: Double?
        
        enum CodingKeys: String, CodingKey {
            case name = "name"
            case line = "line"
            case distance = "distance"
        }
    }
}


