//
//  Constants.swift
//  bb-quotes
//
//  Created by Seoyoon Lee on 2024/03/15.
//

import Foundation

// extension: 기존 타입을 확장할 때 사용
extension String {
    var replaceSpaceWithPlus: String { // 새로운 프로퍼티 혹은 기본 멤버 재정의 가능
        self.replacingOccurrences(of: " ", with: "+")
    }
}
