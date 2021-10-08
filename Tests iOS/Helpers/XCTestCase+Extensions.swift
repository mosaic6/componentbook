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
        let host = UIHostingController(rootView: view)

        if let window = UIApplication.shared.windows.first(where: { $0.isKeyWindow }) {
            window.rootViewController = host
            UIGraphicsBeginImageContextWithOptions(host.view.bounds.size, host.view.isOpaque, 0)
            host.view.drawHierarchy(in: host.view.bounds, afterScreenUpdates: true)
            let snapshotImage: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
            UIGraphicsEndImageContext()
            host.dismiss(animated: false)
            window.rootViewController = nil

            let attachment = XCTAttachment(image: snapshotImage)
            attachment.name = title
            attachment.lifetime = .keepAlways
            add(attachment)
        }
    }

    func captureCropped<T: View>(_ view: T, title: String) {
        let host = UIHostingController(rootView: view)
        let size = host.sizeThatFits(in: UIScreen.main.bounds.size)
        host.view.bounds.size = size
        host.view.sizeToFit()
        UIGraphicsBeginImageContextWithOptions(host.view.bounds.size, host.view.isOpaque, 0)
        host.view.drawHierarchy(in: host.view.bounds, afterScreenUpdates: true)
        let snapshotImage: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        host.dismiss(animated: false)

        let attachment = XCTAttachment(image: snapshotImage)
        attachment.name = title
        attachment.lifetime = .keepAlways
        add(attachment)
    }

    func capture(_ feature: UIViewController, title: String) {
        let window = UIWindow()
        window.rootViewController = feature
        RunLoop.current.run(until: Date())
        UIGraphicsBeginImageContextWithOptions(feature.view.bounds.size, feature.view.isOpaque, 0)
        feature.view.drawHierarchy(in: feature.view.bounds, afterScreenUpdates: true)
        let snapshotImage: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        window.rootViewController = nil

        let attachment = XCTAttachment(image: snapshotImage)
        attachment.name = title
        attachment.lifetime = .keepAlways
        add(attachment)
    }

    func captureScreen(title: String) {
        let screenshot = XCUIScreen.main.screenshot()
        let attachment = XCTAttachment(screenshot: screenshot)
        attachment.name = title
        attachment.lifetime = .keepAlways
        add(attachment)
    }

    func capturedPreviews(_ previews: [(String, UIImage)]) {
        for preview in previews {
            let attachment = XCTAttachment(image: preview.1)
            attachment.name = preview.0
            attachment.lifetime = .keepAlways
            add(attachment)
        }
    }
}
