//
//  File.swift
//  
//
//  Created by Oleh Hudeichuk on 17.06.2021.
//

import TonClientSwift

public extension SwiftTonTool {

    func readAbi(_ relativeFilePath: String) -> AnyValue {
        let abiJSON: String = pathToRootDirectory + "/\(relativeFilePath)"
        var abiText: String = .init()
        DOFileReader.readFile(abiJSON) { (line) in
            abiText.append(line)
        }
        guard let any = abiText.toAnyValue() else { fatalError("AbiJSON Not Parsed From File") }

        return any
    }
}
