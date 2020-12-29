//
//  TopRightView.swift
//  Expense Tracker
//
//  Created by isEmpty on 24.12.2020.
//

import UIKit

@IBDesignable
final class TopRightView: UIView {

    override func draw(_ rect: CGRect) {
        let context = UIGraphicsGetCurrentContext()!

        //// Color Declarations
        let fillColor = UIColor(hex: UserDefaults.standard.string(forKey: "startColor") ?? "") ?? #colorLiteral(red: 0.549, green: 0.298, blue: 0.831, alpha: 1.000)


        context.saveGState()
        context.setAlpha(0.2)
        context.beginTransparencyLayer(auxiliaryInfo: nil)

        let path = UIBezierPath()
        let width = rect.maxX - rect.minX
        let height = rect.maxY - rect.minY
        path.move(to: CGPoint(x: 0.261 * width, y: 0.77 * height))
        path.addCurve(to: CGPoint(x: width, y: 0.97 * height), controlPoint1: CGPoint(x: 0.467 * width, y: 0.97 * height), controlPoint2: CGPoint(x: 0.74 * width, y: height))
        path.addLine(to: CGPoint(x: width, y: rect.minY))
        path.addLine(to: CGPoint(x: 0.015 * width, y: rect.minY))
        path.addCurve(to: CGPoint(x: 0.26 * width, y: 0.77 * height), controlPoint1: CGPoint(x: -0.03 * width, y: 0.27 * height), controlPoint2: CGPoint(x: 0.045 * width, y: 0.57 * height))
        
        path.close()
        path.usesEvenOddFillRule = true
        fillColor.setFill()
        path.fill()

        context.endTransparencyLayer()
        context.restoreGState()
    }
}