//
//  Alert.swift
//  TestApp
//
//  Created by Елена Воронцова on 15.12.2023.
//

import UIKit

enum Alert: Error {
    
    case error
    case dataError
    case noData
    case noInternet
    case serverError
    
    var message: String {
        
        switch self {
        case .error: return "Ошибка"
        case .dataError: return "Ошибка получения данных"
        case .noData: return "Отсутствуют данные"
        case .noInternet: return "Нет соединения с интернет"
        case .serverError: return "Сервер недоступен"
        }
    }
}
