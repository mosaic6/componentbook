//
//  XCTestCase+Extensions.swift
//  ComponentBook
//
//  Created by Joshua Walsh on 9/2/21.
//

import Foundation
import SwiftUI
import XCTest

extension XCTestCase {
    func capture<T: View>(_ view: T, title: String) {
        let host = NSHostingController(rootView: view)

        if let window = NSApplication.shared.windows.first(where: { $0.isKeyWindow }) {
            window.contentViewController = host
//            NSGraphicsBeginImageContextWithOptions(host.view.bounds.size, host.view.isOpaque, 0)
            host.view.draw(host.view.bounds)
//            let snapshotImage: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
//            UIGraphicsEndImageContext()
            host.dismiss(nil)
            window.contentViewController = nil

//            let attachment = XCTAttachment(image: snapshotImage)
//            attachment.name = title
//            attachment.lifetime = .keepAlways
//            add(attachment)
        }
    }

    func captureCropped<T: View>(_ view: T, title: String) {
        let host = NSHostingController(rootView: view)
        let size = host.sizeThatFits(in: NSScreen.main?.frame.size ?? CGSize(width: 0, height: 0))
        host.view.bounds.size = size
        host.view.fittingSize
//        UIGraphicsBeginImageContextWithOptions(host.view.bounds.size, host.view.isOpaque, 0)
//        host.view.drawHierarchy(in: host.view.bounds, afterScreenUpdates: true)
//        let snapshotImage: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
//        UIGraphicsEndImageContext()
        host.dismiss(nil)

//        let attachment = XCTAttachment(image: snapshotImage)
//        attachment.name = title
//        attachment.lifetime = .keepAlways
//        add(attachment)
    }

    func capture(_ feature: NSViewController, title: String) {
        let window = NSWindow()
        window.contentViewController = feature
        RunLoop.current.run(until: Date())
//        UIGraphicsBeginImageContextWithOptions(feature.view.bounds.size, feature.view.isOpaque, 0)
//        feature.view.drawHierarchy(in: feature.view.bounds, afterScreenUpdates: true)
//        let snapshotImage: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
//        UIGraphicsEndImageContext()
        window.contentViewController = nil

//        let attachment = XCTAttachment(image: snapshotImage)
//        attachment.name = title
//        attachment.lifetime = .keepAlways
//        add(attachment)
    }

    func captureScreen(title: String) {
        let screenshot = XCUIScreen.main.screenshot()
        let attachment = XCTAttachment(screenshot: screenshot)
        attachment.name = title
        attachment.lifetime = .keepAlways
        add(attachment)
    }

    func capturedPreviews(_ previews: [(String, NSImage)]) {
        for preview in previews {
            let attachment = XCTAttachment(image: preview.1)
            attachment.name = preview.0
            attachment.lifetime = .keepAlways
            add(attachment)
        }
    }
}

