//
//  File.swift
//  
//
//  Created by Oleh Hudeichuk on 17.06.2021.
//

import Foundation
import TonClientSwift

public extension SwiftTonTool {

    func readTvc(_ relativeFilePath: String) -> Data {
        let tvc: String = pathToRootDirectory + "/\(relativeFilePath)"
        guard let data = FileManager.default.contents(atPath: tvc) else { fatalError("tvc not read") }

        return data
    }
}
