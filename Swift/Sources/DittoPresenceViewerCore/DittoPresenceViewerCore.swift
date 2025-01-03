//
//  DittoPresenceViewerCore.swift
//  DittoPresenceViewerCore
//
//  Created by Brian Plattenburg on 1/3/25.
//
import Foundation

public struct DittoPresenceViewerResources {
    public static let webDistDirURL = Bundle.module.bundleURL.appendingPathComponent("Resources/dist")
    public static let htmlURL = Bundle.module.url(forResource: "Resources/index", withExtension: "html")!
}
