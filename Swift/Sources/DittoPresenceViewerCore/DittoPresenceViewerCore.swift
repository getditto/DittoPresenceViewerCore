//
//  DittoPresenceViewerCore.swift
//  DittoPresenceViewerCore
//
//  Created by Brian Plattenburg on 1/3/25.
//
import Foundation

public struct DittoPresenceViewerResources {
    public let webDistDirURL = Bundle.module.bundleURL.appendingPathComponent("Resources/dist")
    public let htmlURL = Bundle.module.url(forResource: "Resources/index", withExtension: "html")!
}
