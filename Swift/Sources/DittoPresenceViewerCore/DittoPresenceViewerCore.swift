//
//  DittoPresenceViewerCore.swift
//  DittoPresenceViewerCore
//
//  Created by Brian Plattenburg on 1/3/25.
//
import Foundation

public struct DittoPresenceViewerResources {
    // These public accessors let consuming packages (e.g. DittoSwiftTools) use the bundled resources (JS & HTML) from this package
    public static let webDistDirURL = Bundle.module.bundleURL.appendingPathComponent("dist")
    public static let htmlURL = Bundle.module.url(forResource: "index", withExtension: "html")!
}
