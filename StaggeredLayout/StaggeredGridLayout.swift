//
//  StaggeredGridLayout.swift
//  StaggeredLayout
//
//  Created by Nay Lin on 2025/07/26.
//

import SwiftUI

struct StaggeredGridLayout: Layout {
    let columns: Int

    func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) -> CGSize {
        let width = proposal.width ?? 300
        let columnWidth = width / CGFloat(columns)
        var columnHeights = Array(repeating: CGFloat(0), count: columns)

        for index in subviews.indices {
            let size = subviews[index].sizeThatFits(
                ProposedViewSize(width: columnWidth, height: nil)
            )
            let shortestColumn = columnHeights.firstIndex(of: columnHeights.min()!)!
            columnHeights[shortestColumn] += size.height
        }

        return CGSize(width: width, height: columnHeights.max()!)
    }

    func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) {
        let columnWidth = bounds.width / CGFloat(columns)
        var columnHeights = Array(repeating: CGFloat(0), count: columns)

        for index in subviews.indices {
            let size = subviews[index].sizeThatFits(
                ProposedViewSize(width: columnWidth, height: nil)
            )
            let shortestColumn = columnHeights.firstIndex(of: columnHeights.min()!)!
            let x = bounds.minX + CGFloat(shortestColumn) * columnWidth
            let y = bounds.minY + columnHeights[shortestColumn]
            subviews[index].place(
                at: CGPoint(x: x, y: y),
                proposal: ProposedViewSize(width: columnWidth, height: size.height)
            )
            columnHeights[shortestColumn] += size.height
        }
    }
}
