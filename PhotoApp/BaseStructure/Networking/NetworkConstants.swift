//
//  NetworkConstants.swift
//  

import Foundation

let kAppEnvironment: AppEnvironment = .development

// MARK: - kBaseURLComponents
var kBaseURLComponents: URLComponents {
    var urlComponents = URLComponents()
    urlComponents.scheme = kScheme
    urlComponents.host = kHost
    if kPort != nil {
        urlComponents.port = kPort
    }
    return urlComponents
}

// MARK: - kBaseURL
var kBaseURL: String {
    return kBaseURLComponents.url?.absoluteString ?? ""
}

// MARK: - kScheme
var kScheme: String {
    switch kAppEnvironment {
    default: return "https"
    }
}

// MARK: - kHost
var kHost: String {
    switch kAppEnvironment {
    default: return "newsapi.org"
    }
}

// MARK: - kPort
var kPort: Int? {
    switch kAppEnvironment {
    default: return nil
    }
}

// MARK: Detect if app in Preview Mode
public var isInPreview: Bool {
    return ProcessInfo.processInfo.environment["XCODE_RUNNING_FOR_PREVIEWS"] == "1"
}


// MARK: - all requests key parameters
struct KeyParameters {
    static var contentTypeKey = "Content-Type"
    static var accept = "Accept"
    static var applicationJson = "application/json"
    static var acceptLanguage = "Accept-Language"
}

