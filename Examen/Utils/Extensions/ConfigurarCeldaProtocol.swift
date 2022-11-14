//
//  ConfigurarCeldaProtocol.swift
//  Examen
//
//  Created by David Lopez on 13/11/22.
//

import Foundation


protocol CellConfigurationProtocol {
//    func configurar<T>(item: T, indexPath: IndexPath)
}

extension CellConfigurationProtocol {
    func setup<T: Any>(item: T?, indexPath: IndexPath) {
    }
}

