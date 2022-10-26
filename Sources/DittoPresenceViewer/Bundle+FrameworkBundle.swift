//
//  Copyright © 2020 DittoLive Incorporated. All rights reserved.
//

import Foundation

extension Bundle {

    static var presenceViewerFrameworkBundle: Bundle {
        Bundle(for: DittoPresenceView.self)
    }

    static var presenceViewerBundle: Bundle {
        // SwiftPM local package includes binary statically, resources end up in DittoPresenceViewer_DittoPresenceViewer.bundle
//        Bundle(identifier: "DittoPresenceViewer-DittoPresenceViewer-resources")!
//        Bundle(path: "DittoPresenceViewer_DittoPresenceViewer.bundle")!
        // Auto-generated for package
        // https://developer.apple.com/forums/thread/650158?answerId=614513022#614513022
        Bundle.module
    }

}
