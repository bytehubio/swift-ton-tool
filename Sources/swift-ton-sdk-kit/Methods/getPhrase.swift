//
//  File.swift
//  
//
//  Created by Oleh Hudeichuk on 03.06.2021.
//

import TonClientSwift

public extension TonSdkKit {
    
    func getPhrase(wordCount: UInt8? = 12,
                   dictionary: TSDKMnemonicDictionary? = .ENGLISH,
                   _ handler: @escaping (Result<String, TSDKClientError>) -> Void
    ) {
        let params: TSDKParamsOfMnemonicFromRandom = .init(dictionary: dictionary, word_count: wordCount)
        client.crypto.mnemonic_from_random(params
        ) { (response: TSDKBindingResponse<TSDKResultOfMnemonicFromRandom, TSDKClientError, TSDKDefault>) in
            if response.finished {
                if let error = response.error {
                    handler(.failure(error))
                } else if let phrase = response.result?.phrase {
                    handler(.success(phrase))
                }
            }
        }
    }
}
