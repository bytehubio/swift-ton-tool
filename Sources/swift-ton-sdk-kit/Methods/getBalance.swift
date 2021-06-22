//
//  File.swift
//  
//
//  Created by Oleh Hudeichuk on 18.06.2021.
//

import TonClientSwift
import BigInt

public extension TonSdkKit {
    
    func getBalance(accountAddress: String,
                    _ handler: @escaping (Result<BigInt, TSDKClientError>) -> Void
    ) {
        let paramsOfWaitForCollection: TSDKParamsOfWaitForCollection = .init(collection: "accounts",
                                                                             filter: .object(["id": .object(
                                                                                                [
                                                                                                    "eq": .string(accountAddress)
                                                                                                ])
                                                                             ]),
                                                                             result: "id balance(format: DEC)",
                                                                             timeout: nil)
        client.net.wait_for_collection(paramsOfWaitForCollection) { (response) in
            if let error = response.error {
                handler(.failure(error))
            } else if
                response.finished,
                let result = response.result?.result.toDictionary(),
                let balance: BigInt = BigInt(result["balance"] as? String ?? "")
            {
                handler(.success(balance))
            } else {
                let error = TSDKClientError(code: 0, message: "getBalance: Finished, but no result", data: AnyJSONType(1))
                handler(.failure(error))
            }
        }
    }
}

