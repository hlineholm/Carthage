//
//  URLWhitelistExtensions.swift
//  CarthageKit
//
//  Created by Lineholm, Henrik on 2019-02-19.
//

import Foundation

extension URL {
    var isWhitelistedForBinaryDownload: Bool {
        return scheme == "http" && isHostedByARN && isBinary && containsArtifactoryPathComponent
    }
    private var isHostedByARN: Bool {
        return host?.contains("se-arn-") ?? false
    }
    private var isBinary: Bool {
        return pathExtension == "json" || pathExtension == "zip"
    }
    private var containsArtifactoryPathComponent: Bool {
        return pathComponents[1] == "artifactory"
    }
}
