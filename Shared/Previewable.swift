//
//  Previewable.swift
//  ComponentBook
//
//  Created by Joshua Walsh on 9/2/21.
//

import Foundation
import SwiftUI

#if DEBUG
protocol Previewable {
    associatedtype ViewModel
    associatedtype Preview: View

    static var defaultViewModel: PreviewData<ViewModel> { get }
    static var alternateViewModels: [PreviewData<ViewModel>] { get }
    static var layout: PreviewLayout { get } // .device, .sizeThatFits or .fixed(width: height: )
    static var environmentColor: ColorScheme { get }

    static func create(from viewModel: ViewModel) -> Preview
}

struct PreviewData<ViewModel>: Identifiable {
    let id: String
    let viewModel: ViewModel
}

extension Previewable {
    static var debugPreviews: some View {
        Group {
            AnyView(create(from: defaultViewModel.viewModel))
                .environment(\.colorScheme, environmentColor)
                .previewDisplayName("\(defaultViewModel.id) Light")
                .previewLayout(layout)

            // 10 or more items/views
            ForEach(alternateViewModels, id: \.id) { previewData in
                AnyView(create(from: previewData.viewModel))
                    .previewDisplayName("\(previewData.id) Light")
                    .previewLayout(layout)
            }
        }
    }

    static var devicePreviews: some View {
        Group {
            AnyView(create(from: defaultViewModel.viewModel))
                .environment(\.colorScheme, environmentColor)
                .previewDisplayName("\(defaultViewModel.id) Light")

            ForEach(alternateViewModels, id: \.id) { previewData in
                AnyView(create(from: previewData.viewModel))
                    .previewDisplayName("\(previewData.id) Light")
            }
        }
    }

    static func capturedPreviews(title: String) -> [(String, NSImage)] {

        var captured: [(String, NSImage)] = []

        let hostingView = NSHostingView(rootView: AnyView(create(from: defaultViewModel.viewModel)).previewLayout(.sizeThatFits).previewDependencies())
        captured.append((title + "-" + defaultViewModel.id + "-", hostingView.snapshot))

        for previewData in alternateViewModels {
            let alternateView = NSHostingView(rootView: AnyView(create(from: previewData.viewModel)).previewLayout(.sizeThatFits).previewDependencies())
            captured.append((title + "-" + previewData.id, alternateView.snapshot))
        }

        return captured
    }
}

#endif

extension NSHostingView {

    var snapshot: NSImage {

        let snapshotSize: NSSize = {
            guard fittingSize.width > 0 && fittingSize.height > 0 else {
                // Unable to determine a fitting size so we will generate a default size
                return NSSize(width: 1024, height: 768)
            }
            return fittingSize
        }()

        let contentRect = NSRect(x: 0, y: 0, width: snapshotSize.width, height: snapshotSize.height)
        let window = NSWindow(
            contentRect: contentRect,
            styleMask: [.titled, .closable, .miniaturizable, .resizable, .fullSizeContentView],
            backing: .buffered,
            defer: false)
        window.center()
        window.setFrameAutosaveName("Main Window")
        window.contentView = self
        window.makeKeyAndOrderFront(nil)

        let newWindow = NSWindow(
            contentRect: contentRect,
            styleMask: [.titled, .closable, .miniaturizable, .resizable, .fullSizeContentView],
            backing: .buffered,
            defer: false)

        newWindow.contentView = self
        if let bitmapImageRepresentation = newWindow.contentView?.bitmapImageRepForCachingDisplay(in: contentRect) {
            newWindow.contentView?.cacheDisplay(in: contentRect, to: bitmapImageRepresentation)
            let renderedImage = NSImage(size: bitmapImageRepresentation.size)
            renderedImage.addRepresentation(bitmapImageRepresentation)
            return renderedImage
        } else {
            print("ERROR UNABLE TO CREATE NSIMAGE???")
            return NSImage()
        }
    }

    func snapshot(using window: NSWindow, in frame: NSRect) -> NSImage {

        if let bitmapImageRepresentation = self.bitmapImageRepForCachingDisplay(in: frame) {
            self.cacheDisplay(in: frame, to: bitmapImageRepresentation)
            let renderedImage = NSImage(size: bitmapImageRepresentation.size)
            renderedImage.addRepresentation(bitmapImageRepresentation)
            return renderedImage
        } else {
            print("ERROR UNABLE TO CREATE NSIMAGE???")
            return NSImage()
        }
    }
}


