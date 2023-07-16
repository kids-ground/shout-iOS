//
//  MoyaProvider+Extension.swift
//  shout
//
//  Created by 김록원 on 2023/07/16.
//

import Foundation
import Moya

extension MoyaProvider {
  func request(_ target: Target) async -> Result<Response, MoyaError> {
    await withCheckedContinuation { continuation in
      self.request(target) { result in
        continuation.resume(returning: result)
      }
    }
  }
}
