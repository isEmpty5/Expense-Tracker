//
//  NavigationBar+Extensions.swift
//  Expense Tracker
//
//  Created by isEmpty on 03.12.2020.
//

import UIKit

extension UINavigationBar {
    /// Adds a `UINavigationBarGradientView` on top of the NavigationBar.
    /// - Parameters:
    ///   - colors: An array of colors used in the gradient.
    ///   - startPoint: The start point of the gradient when drawn in the layer’s coordinate space.
    ///   - endPoint: The end point of the gradient when drawn in the layer’s coordinate space.
    ///   - locations: An optional array of NSNumber objects defining the location of each gradient stop.
    func setGradientBackground(colors: [UIColor],
                               startPoint: Point = .topLeft,
                               endPoint: Point = .bottomLeft,
                               locations: [NSNumber] = [0, 1]) {
        
        guard let backgroundView = value(forKey: "backgroundView") as? UIView else { return }
        guard let gradientView = backgroundView.subviews.first(where: { $0 is UINavigationBarGradientView }) as? UINavigationBarGradientView else {
            let gradientView = UINavigationBarGradientView(colors: colors, startPoint: startPoint,
                                                           endPoint: endPoint, locations: locations)
            backgroundView.addSubview(gradientView)
            gradientView.setupConstraints()
            return
        }
        gradientView.set(colors: colors, startPoint: startPoint, endPoint: endPoint, locations: locations)
    }
    
    final private class UINavigationBarGradientView: UIView {
        private weak var gradientLayer: CAGradientLayer!
        
        convenience init(colors: [UIColor], startPoint: Point = .topLeft,
                         endPoint: Point = .bottomLeft, locations: [NSNumber] = [0, 1]) {
            self.init(frame: .zero)
            let gradientLayer = CAGradientLayer()
            gradientLayer.frame = frame
            layer.addSublayer(gradientLayer)
            self.gradientLayer = gradientLayer
            set(colors: colors, startPoint: startPoint, endPoint: endPoint, locations: locations)
            backgroundColor = .clear
        }
        
        func set(colors: [UIColor], startPoint: Point = .topLeft,
                 endPoint: Point = .bottomLeft, locations: [NSNumber] = [0, 1]) {
            gradientLayer.colors = colors.map { $0.cgColor }
            gradientLayer.startPoint = startPoint.point
            gradientLayer.endPoint = endPoint.point
            gradientLayer.locations = locations
        }
        
        func setupConstraints() {
            guard let parentView = superview else { return }
            translatesAutoresizingMaskIntoConstraints = false
            topAnchor.constraint(equalTo: parentView.topAnchor).isActive = true
            leftAnchor.constraint(equalTo: parentView.leftAnchor).isActive = true
            parentView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
            parentView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        }
        
        override func layoutSubviews() {
            super.layoutSubviews()
            guard let gradientLayer = gradientLayer else { return }
            gradientLayer.frame = frame
            superview?.addSubview(self)
        }
    }
    
}

public enum Point {
    case topRight, topLeft
    case bottomRight, bottomLeft
    case custom(point: CGPoint)
    
    var point: CGPoint {
        switch self {
        case .topRight: return CGPoint(x: 1, y: 0)
        case .topLeft: return CGPoint(x: 0, y: 0)
        case .bottomRight: return CGPoint(x: 1, y: 1)
        case .bottomLeft: return CGPoint(x: 0, y: 1)
        case .custom(let point): return point
        }
    }
}
