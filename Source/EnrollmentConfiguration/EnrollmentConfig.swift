//
//  EnrollmentConfig.swift
//  edX
//
//  Created by Akiva Leffert on 1/5/16.
//  Copyright © 2016 edX. All rights reserved.
//

import Foundation
import edXCore

enum EnrollmentType : String {
    case native = "native"
    case webview = "webview"
    case none = "none"
}

enum EnrollmentKeys: String, RawStringExtractable {
    case nativeSearchBarEnabled = "SEARCH_BAR_ENABLED"
    case searchURL = "SEARCH_URL"
    case enrollmentType = "TYPE"
    case webview = "WEBVIEW"
}

class EnrollmentWebviewConfig: NSObject {
    
    let nativeSearchbarEnabled: Bool
    let searchURL: URL?
    
    init(dictionary: [String: AnyObject]) {
        nativeSearchbarEnabled = dictionary[EnrollmentKeys.nativeSearchBarEnabled] as? Bool ?? false
        searchURL = (dictionary[EnrollmentKeys.searchURL] as? String).flatMap { URL(string:$0)}
        super.init()
    }
}

class EnrollmentConfig : NSObject {
    let type: EnrollmentType
    var isEnabled : Bool{
        return type != .none
    }
    // Associated swift enums can not be used in objective-c, that's why this extra function needed
    var isNative: Bool {
        return type == .native
    }
    
    init(dictionary: [String: AnyObject]) {
        type = (dictionary[EnrollmentKeys.enrollmentType] as? String).flatMap { EnrollmentType(rawValue: $0) } ?? .none
    }
}
