//
//  File.swift
//  
//
//  Created by Ben Chatelain on 9/23/22.
//

import DittoSwift
import UIKit
#if canImport(SwiftUI)
import SwiftUI
#endif

@available(iOS 13, macOS 10.15, *)
struct PresenceView: View {
    public var ditto: Ditto

    var body: some View {
        PresenceView(ditto: ditto)
    }
}

// MARK: - UIViewRepresentable
#if os(iOS)
@available(iOS 13, *)
extension PresenceView: UIViewRepresentable {
    typealias Body = Never
    typealias UIViewType = UIView

    func makeUIView(context: Self.Context) -> Self.UIViewType {
        return DittoPresenceView(ditto: self.ditto)
    }

    func updateUIView(_: Self.UIViewType, context: Self.Context) {
        return
    }
}
#endif

// MARK: - NSViewRepresentable
#if os(macOS)
@available(macOS 10.15, *)
extension PresenceView: NSViewRepresentable {
    typealias Body = Never
    typealias NSViewType = NSView

    func makeNSView(context: Self.Context) -> Self.NSViewType {
        return DittoPresenceView(ditto: self.ditto)
    }

    func updateNSView(_: Self.NSViewType, context: Self.Context) {
        return
    }
}
#endif
