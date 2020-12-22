//
//  MeetingPictureDraw.swift
//  Expense Tracker
//
//  Created by isEmpty on 18.12.2020.
//

import UIKit

@IBDesignable
public class MeetingPictureView: UIView {
    public override func draw(_ rect: CGRect) {
        MeetingPictureDraw.drawMeetingPicture(frame: rect, resizing: .aspectFit)
    }
}

public class MeetingPictureDraw : NSObject {

    //// Drawing Methods

    @objc dynamic public class func drawMeetingPicture(frame targetFrame: CGRect = CGRect(x: 0, y: 0, width: 350, height: 310), resizing: ResizingBehavior = .aspectFit) {
        //// General Declarations
        let context = UIGraphicsGetCurrentContext()!
        
        //// Resize to Target Frame
        context.saveGState()
        let resizedFrame: CGRect = resizing.apply(rect: CGRect(x: 0, y: 0, width: 350, height: 310), target: targetFrame)
        context.translateBy(x: resizedFrame.minX, y: resizedFrame.minY)
        context.scaleBy(x: resizedFrame.width / 350, y: resizedFrame.height / 310)


        //// Color Declarations
        let fillColor = UIColor(red: 0.247, green: 0.239, blue: 0.337, alpha: 1.000)
        let fillColor2 = UIColor(red: 0.824, green: 0.831, blue: 0.851, alpha: 1.000)
        let fillColor3 = UIColor(red: 0.561, green: 0.306, blue: 0.839, alpha: 1.000)
        let fillColor4 = UIColor(red: 1.000, green: 1.000, blue: 1.000, alpha: 1.000)
        let fillColor5 = UIColor(red: 0.184, green: 0.180, blue: 0.255, alpha: 1.000)
        let fillColor6 = UIColor(red: 0.624, green: 0.380, blue: 0.416, alpha: 1.000)
        let fillColor7 = UIColor(red: 0.816, green: 0.804, blue: 0.882, alpha: 1.000)

        //// Meeting picture
        //// undraw_updates_et2k
        //// Dotted line Drawing
        let dottedLinePath = UIBezierPath()
        dottedLinePath.move(to: CGPoint(x: 236.73, y: 226.62))
        dottedLinePath.addLine(to: CGPoint(x: 236.73, y: 225.87))
        dottedLinePath.addCurve(to: CGPoint(x: 241.26, y: 225.78), controlPoint1: CGPoint(x: 238.23, y: 225.87), controlPoint2: CGPoint(x: 239.75, y: 225.84))
        dottedLinePath.addLine(to: CGPoint(x: 241.29, y: 226.53))
        dottedLinePath.addCurve(to: CGPoint(x: 236.73, y: 226.62), controlPoint1: CGPoint(x: 239.77, y: 226.59), controlPoint2: CGPoint(x: 238.24, y: 226.62))
        dottedLinePath.close()
        dottedLinePath.move(to: CGPoint(x: 232.16, y: 226.54))
        dottedLinePath.addCurve(to: CGPoint(x: 227.61, y: 226.27), controlPoint1: CGPoint(x: 230.65, y: 226.48), controlPoint2: CGPoint(x: 229.12, y: 226.39))
        dottedLinePath.addLine(to: CGPoint(x: 227.67, y: 225.51))
        dottedLinePath.addCurve(to: CGPoint(x: 232.19, y: 225.78), controlPoint1: CGPoint(x: 229.17, y: 225.63), controlPoint2: CGPoint(x: 230.69, y: 225.72))
        dottedLinePath.addLine(to: CGPoint(x: 232.16, y: 226.54))
        dottedLinePath.close()
        dottedLinePath.move(to: CGPoint(x: 245.84, y: 226.26))
        dottedLinePath.addLine(to: CGPoint(x: 245.78, y: 225.5))
        dottedLinePath.addCurve(to: CGPoint(x: 250.29, y: 225.05), controlPoint1: CGPoint(x: 247.28, y: 225.38), controlPoint2: CGPoint(x: 248.8, y: 225.23))
        dottedLinePath.addLine(to: CGPoint(x: 250.38, y: 225.8))
        dottedLinePath.addCurve(to: CGPoint(x: 245.84, y: 226.26), controlPoint1: CGPoint(x: 248.88, y: 225.98), controlPoint2: CGPoint(x: 247.35, y: 226.14))
        dottedLinePath.close()
        dottedLinePath.move(to: CGPoint(x: 223.07, y: 225.82))
        dottedLinePath.addCurve(to: CGPoint(x: 218.55, y: 225.18), controlPoint1: CGPoint(x: 221.56, y: 225.64), controlPoint2: CGPoint(x: 220.04, y: 225.42))
        dottedLinePath.addLine(to: CGPoint(x: 218.67, y: 224.44))
        dottedLinePath.addCurve(to: CGPoint(x: 223.16, y: 225.07), controlPoint1: CGPoint(x: 220.15, y: 224.68), controlPoint2: CGPoint(x: 221.66, y: 224.89))
        dottedLinePath.addLine(to: CGPoint(x: 223.07, y: 225.82))
        dottedLinePath.close()
        dottedLinePath.move(to: CGPoint(x: 254.9, y: 225.16))
        dottedLinePath.addLine(to: CGPoint(x: 254.78, y: 224.42))
        dottedLinePath.addCurve(to: CGPoint(x: 259.24, y: 223.6), controlPoint1: CGPoint(x: 256.26, y: 224.18), controlPoint2: CGPoint(x: 257.76, y: 223.9))
        dottedLinePath.addLine(to: CGPoint(x: 259.39, y: 224.34))
        dottedLinePath.addCurve(to: CGPoint(x: 254.9, y: 225.16), controlPoint1: CGPoint(x: 257.9, y: 224.65), controlPoint2: CGPoint(x: 256.39, y: 224.92))
        dottedLinePath.close()
        dottedLinePath.move(to: CGPoint(x: 214.06, y: 224.37))
        dottedLinePath.addCurve(to: CGPoint(x: 209.6, y: 223.37), controlPoint1: CGPoint(x: 212.57, y: 224.07), controlPoint2: CGPoint(x: 211.07, y: 223.73))
        dottedLinePath.addLine(to: CGPoint(x: 209.78, y: 222.64))
        dottedLinePath.addCurve(to: CGPoint(x: 214.21, y: 223.63), controlPoint1: CGPoint(x: 211.24, y: 223), controlPoint2: CGPoint(x: 212.73, y: 223.33))
        dottedLinePath.addLine(to: CGPoint(x: 214.06, y: 224.37))
        dottedLinePath.close()
        dottedLinePath.move(to: CGPoint(x: 263.84, y: 223.34))
        dottedLinePath.addLine(to: CGPoint(x: 263.66, y: 222.61))
        dottedLinePath.addCurve(to: CGPoint(x: 268.04, y: 221.44), controlPoint1: CGPoint(x: 265.13, y: 222.25), controlPoint2: CGPoint(x: 266.6, y: 221.86))
        dottedLinePath.addLine(to: CGPoint(x: 268.25, y: 222.16))
        dottedLinePath.addCurve(to: CGPoint(x: 263.84, y: 223.34), controlPoint1: CGPoint(x: 266.8, y: 222.58), controlPoint2: CGPoint(x: 265.32, y: 222.98))
        dottedLinePath.addLine(to: CGPoint(x: 263.84, y: 223.34))
        dottedLinePath.close()
        dottedLinePath.move(to: CGPoint(x: 205.19, y: 222.2))
        dottedLinePath.addCurve(to: CGPoint(x: 200.84, y: 220.85), controlPoint1: CGPoint(x: 203.74, y: 221.78), controlPoint2: CGPoint(x: 202.27, y: 221.32))
        dottedLinePath.addLine(to: CGPoint(x: 201.08, y: 220.13))
        dottedLinePath.addCurve(to: CGPoint(x: 205.4, y: 221.47), controlPoint1: CGPoint(x: 202.5, y: 220.6), controlPoint2: CGPoint(x: 203.96, y: 221.06))
        dottedLinePath.addLine(to: CGPoint(x: 205.19, y: 222.2))
        dottedLinePath.close()
        dottedLinePath.move(to: CGPoint(x: 272.61, y: 220.81))
        dottedLinePath.addLine(to: CGPoint(x: 272.37, y: 220.09))
        dottedLinePath.addCurve(to: CGPoint(x: 276.64, y: 218.57), controlPoint1: CGPoint(x: 273.8, y: 219.61), controlPoint2: CGPoint(x: 275.23, y: 219.1))
        dottedLinePath.addLine(to: CGPoint(x: 276.91, y: 219.27))
        dottedLinePath.addCurve(to: CGPoint(x: 272.61, y: 220.81), controlPoint1: CGPoint(x: 275.49, y: 219.81), controlPoint2: CGPoint(x: 274.04, y: 220.33))
        dottedLinePath.close()
        dottedLinePath.move(to: CGPoint(x: 196.53, y: 219.31))
        dottedLinePath.addCurve(to: CGPoint(x: 192.28, y: 217.61), controlPoint1: CGPoint(x: 195.11, y: 218.78), controlPoint2: CGPoint(x: 193.68, y: 218.2))
        dottedLinePath.addLine(to: CGPoint(x: 192.58, y: 216.91))
        dottedLinePath.addCurve(to: CGPoint(x: 196.79, y: 218.61), controlPoint1: CGPoint(x: 193.97, y: 217.5), controlPoint2: CGPoint(x: 195.38, y: 218.07))
        dottedLinePath.addLine(to: CGPoint(x: 196.53, y: 219.31))
        dottedLinePath.close()
        dottedLinePath.move(to: CGPoint(x: 281.13, y: 217.57))
        dottedLinePath.addLine(to: CGPoint(x: 280.83, y: 216.88))
        dottedLinePath.addCurve(to: CGPoint(x: 284.95, y: 215.02), controlPoint1: CGPoint(x: 282.21, y: 216.29), controlPoint2: CGPoint(x: 283.6, y: 215.66))
        dottedLinePath.addLine(to: CGPoint(x: 285.28, y: 215.7))
        dottedLinePath.addCurve(to: CGPoint(x: 281.13, y: 217.57), controlPoint1: CGPoint(x: 283.91, y: 216.35), controlPoint2: CGPoint(x: 282.52, y: 216.98))
        dottedLinePath.close()
        dottedLinePath.move(to: CGPoint(x: 188.11, y: 215.73))
        dottedLinePath.addCurve(to: CGPoint(x: 184.02, y: 213.69), controlPoint1: CGPoint(x: 186.74, y: 215.08), controlPoint2: CGPoint(x: 185.36, y: 214.39))
        dottedLinePath.addLine(to: CGPoint(x: 184.37, y: 213.02))
        dottedLinePath.addCurve(to: CGPoint(x: 188.43, y: 215.05), controlPoint1: CGPoint(x: 185.71, y: 213.72), controlPoint2: CGPoint(x: 187.07, y: 214.4))
        dottedLinePath.addLine(to: CGPoint(x: 188.11, y: 215.73))
        dottedLinePath.close()
        dottedLinePath.move(to: CGPoint(x: 289.35, y: 213.66))
        dottedLinePath.addLine(to: CGPoint(x: 289, y: 212.99))
        dottedLinePath.addCurve(to: CGPoint(x: 292.96, y: 210.81), controlPoint1: CGPoint(x: 290.33, y: 212.29), controlPoint2: CGPoint(x: 291.66, y: 211.56))
        dottedLinePath.addLine(to: CGPoint(x: 293.34, y: 211.46))
        dottedLinePath.addCurve(to: CGPoint(x: 289.35, y: 213.66), controlPoint1: CGPoint(x: 292.03, y: 212.22), controlPoint2: CGPoint(x: 290.69, y: 212.96))
        dottedLinePath.addLine(to: CGPoint(x: 289.35, y: 213.66))
        dottedLinePath.close()
        dottedLinePath.move(to: CGPoint(x: 180.02, y: 211.48))
        dottedLinePath.addCurve(to: CGPoint(x: 176.11, y: 209.11), controlPoint1: CGPoint(x: 178.7, y: 210.72), controlPoint2: CGPoint(x: 177.39, y: 209.92))
        dottedLinePath.addLine(to: CGPoint(x: 176.51, y: 208.47))
        dottedLinePath.addCurve(to: CGPoint(x: 180.4, y: 210.82), controlPoint1: CGPoint(x: 177.78, y: 209.28), controlPoint2: CGPoint(x: 179.09, y: 210.07))
        dottedLinePath.addLine(to: CGPoint(x: 180.02, y: 211.48))
        dottedLinePath.close()
        dottedLinePath.move(to: CGPoint(x: 297.24, y: 209.1))
        dottedLinePath.addLine(to: CGPoint(x: 296.83, y: 208.46))
        dottedLinePath.addCurve(to: CGPoint(x: 300.61, y: 205.96), controlPoint1: CGPoint(x: 298.1, y: 207.66), controlPoint2: CGPoint(x: 299.37, y: 206.82))
        dottedLinePath.addLine(to: CGPoint(x: 301.04, y: 206.58))
        dottedLinePath.addCurve(to: CGPoint(x: 297.24, y: 209.1), controlPoint1: CGPoint(x: 299.79, y: 207.45), controlPoint2: CGPoint(x: 298.51, y: 208.29))
        dottedLinePath.addLine(to: CGPoint(x: 297.24, y: 209.1))
        dottedLinePath.close()
        dottedLinePath.move(to: CGPoint(x: 172.3, y: 206.59))
        dottedLinePath.addCurve(to: CGPoint(x: 168.6, y: 203.92), controlPoint1: CGPoint(x: 171.05, y: 205.73), controlPoint2: CGPoint(x: 169.81, y: 204.83))
        dottedLinePath.addLine(to: CGPoint(x: 169.05, y: 203.32))
        dottedLinePath.addCurve(to: CGPoint(x: 172.73, y: 205.97), controlPoint1: CGPoint(x: 170.25, y: 204.22), controlPoint2: CGPoint(x: 171.49, y: 205.11))
        dottedLinePath.addLine(to: CGPoint(x: 172.3, y: 206.59))
        dottedLinePath.close()
        dottedLinePath.move(to: CGPoint(x: 304.73, y: 203.92))
        dottedLinePath.addLine(to: CGPoint(x: 304.28, y: 203.31))
        dottedLinePath.addCurve(to: CGPoint(x: 307.84, y: 200.52), controlPoint1: CGPoint(x: 305.48, y: 202.41), controlPoint2: CGPoint(x: 306.68, y: 201.47))
        dottedLinePath.addLine(to: CGPoint(x: 308.32, y: 201.1))
        dottedLinePath.addCurve(to: CGPoint(x: 304.73, y: 203.92), controlPoint1: CGPoint(x: 307.15, y: 202.06), controlPoint2: CGPoint(x: 305.94, y: 203.01))
        dottedLinePath.addLine(to: CGPoint(x: 304.73, y: 203.92))
        dottedLinePath.close()
        dottedLinePath.move(to: CGPoint(x: 165, y: 201.1))
        dottedLinePath.addCurve(to: CGPoint(x: 161.53, y: 198.15), controlPoint1: CGPoint(x: 163.83, y: 200.15), controlPoint2: CGPoint(x: 162.66, y: 199.15))
        dottedLinePath.addLine(to: CGPoint(x: 162.03, y: 197.58))
        dottedLinePath.addCurve(to: CGPoint(x: 165.48, y: 200.52), controlPoint1: CGPoint(x: 163.15, y: 198.58), controlPoint2: CGPoint(x: 164.32, y: 199.57))
        dottedLinePath.addLine(to: CGPoint(x: 165, y: 201.1))
        dottedLinePath.close()
        dottedLinePath.move(to: CGPoint(x: 311.8, y: 198.15))
        dottedLinePath.addLine(to: CGPoint(x: 311.3, y: 197.58))
        dottedLinePath.addCurve(to: CGPoint(x: 314.63, y: 194.51), controlPoint1: CGPoint(x: 312.42, y: 196.59), controlPoint2: CGPoint(x: 313.54, y: 195.55))
        dottedLinePath.addLine(to: CGPoint(x: 315.15, y: 195.06))
        dottedLinePath.addCurve(to: CGPoint(x: 311.8, y: 198.15), controlPoint1: CGPoint(x: 314.06, y: 196.1), controlPoint2: CGPoint(x: 312.93, y: 197.14))
        dottedLinePath.addLine(to: CGPoint(x: 311.8, y: 198.15))
        dottedLinePath.close()
        dottedLinePath.move(to: CGPoint(x: 158.17, y: 195.05))
        dottedLinePath.addCurve(to: CGPoint(x: 154.94, y: 191.83), controlPoint1: CGPoint(x: 157.08, y: 194.01), controlPoint2: CGPoint(x: 156, y: 192.92))
        dottedLinePath.addLine(to: CGPoint(x: 155.49, y: 191.3))
        dottedLinePath.addCurve(to: CGPoint(x: 158.7, y: 194.51), controlPoint1: CGPoint(x: 156.53, y: 192.39), controlPoint2: CGPoint(x: 157.61, y: 193.47))
        dottedLinePath.addLine(to: CGPoint(x: 158.17, y: 195.05))
        dottedLinePath.close()
        dottedLinePath.move(to: CGPoint(x: 318.38, y: 191.83))
        dottedLinePath.addLine(to: CGPoint(x: 317.83, y: 191.31))
        dottedLinePath.addCurve(to: CGPoint(x: 320.91, y: 187.98), controlPoint1: CGPoint(x: 318.88, y: 190.22), controlPoint2: CGPoint(x: 319.91, y: 189.1))
        dottedLinePath.addLine(to: CGPoint(x: 321.47, y: 188.48))
        dottedLinePath.addCurve(to: CGPoint(x: 318.38, y: 191.83), controlPoint1: CGPoint(x: 320.47, y: 189.61), controlPoint2: CGPoint(x: 319.43, y: 190.74))
        dottedLinePath.addLine(to: CGPoint(x: 318.38, y: 191.83))
        dottedLinePath.close()
        dottedLinePath.move(to: CGPoint(x: 151.85, y: 188.48))
        dottedLinePath.addCurve(to: CGPoint(x: 148.89, y: 185), controlPoint1: CGPoint(x: 150.84, y: 187.34), controlPoint2: CGPoint(x: 149.85, y: 186.17))
        dottedLinePath.addLine(to: CGPoint(x: 149.48, y: 184.53))
        dottedLinePath.addCurve(to: CGPoint(x: 152.41, y: 187.97), controlPoint1: CGPoint(x: 150.42, y: 185.69), controlPoint2: CGPoint(x: 151.41, y: 186.85))
        dottedLinePath.addLine(to: CGPoint(x: 151.85, y: 188.48))
        dottedLinePath.close()
        dottedLinePath.move(to: CGPoint(x: 324.44, y: 185))
        dottedLinePath.addLine(to: CGPoint(x: 323.85, y: 184.53))
        dottedLinePath.addCurve(to: CGPoint(x: 326.65, y: 180.96), controlPoint1: CGPoint(x: 324.81, y: 183.36), controlPoint2: CGPoint(x: 325.75, y: 182.16))
        dottedLinePath.addLine(to: CGPoint(x: 327.26, y: 181.41))
        dottedLinePath.addCurve(to: CGPoint(x: 324.44, y: 185), controlPoint1: CGPoint(x: 326.35, y: 182.62), controlPoint2: CGPoint(x: 325.4, y: 183.83))
        dottedLinePath.addLine(to: CGPoint(x: 324.44, y: 185))
        dottedLinePath.close()
        dottedLinePath.move(to: CGPoint(x: 146.07, y: 181.42))
        dottedLinePath.addCurve(to: CGPoint(x: 143.4, y: 177.72), controlPoint1: CGPoint(x: 145.16, y: 180.21), controlPoint2: CGPoint(x: 144.27, y: 178.97))
        dottedLinePath.addLine(to: CGPoint(x: 144.03, y: 177.29))
        dottedLinePath.addCurve(to: CGPoint(x: 146.68, y: 180.96), controlPoint1: CGPoint(x: 144.88, y: 178.53), controlPoint2: CGPoint(x: 145.77, y: 179.76))
        dottedLinePath.addLine(to: CGPoint(x: 146.07, y: 181.42))
        dottedLinePath.close()
        dottedLinePath.move(to: CGPoint(x: 329.93, y: 177.71))
        dottedLinePath.addLine(to: CGPoint(x: 329.31, y: 177.28))
        dottedLinePath.addCurve(to: CGPoint(x: 331.81, y: 173.5), controlPoint1: CGPoint(x: 330.17, y: 176.04), controlPoint2: CGPoint(x: 331.01, y: 174.77))
        dottedLinePath.addLine(to: CGPoint(x: 332.45, y: 173.9))
        dottedLinePath.addCurve(to: CGPoint(x: 329.93, y: 177.71), controlPoint1: CGPoint(x: 331.64, y: 175.18), controlPoint2: CGPoint(x: 330.79, y: 176.46))
        dottedLinePath.close()
        dottedLinePath.move(to: CGPoint(x: 140.89, y: 173.92))
        dottedLinePath.addCurve(to: CGPoint(x: 138.52, y: 170.03), controlPoint1: CGPoint(x: 140.08, y: 172.65), controlPoint2: CGPoint(x: 139.28, y: 171.34))
        dottedLinePath.addLine(to: CGPoint(x: 139.18, y: 169.65))
        dottedLinePath.addCurve(to: CGPoint(x: 141.52, y: 173.52), controlPoint1: CGPoint(x: 139.93, y: 170.95), controlPoint2: CGPoint(x: 140.72, y: 172.25))
        dottedLinePath.addLine(to: CGPoint(x: 140.89, y: 173.92))
        dottedLinePath.close()
        dottedLinePath.move(to: CGPoint(x: 334.82, y: 170))
        dottedLinePath.addLine(to: CGPoint(x: 334.17, y: 169.62))
        dottedLinePath.addCurve(to: CGPoint(x: 336.36, y: 165.64), controlPoint1: CGPoint(x: 334.92, y: 168.31), controlPoint2: CGPoint(x: 335.66, y: 166.97))
        dottedLinePath.addLine(to: CGPoint(x: 337.03, y: 166))
        dottedLinePath.addCurve(to: CGPoint(x: 334.82, y: 170), controlPoint1: CGPoint(x: 336.33, y: 167.33), controlPoint2: CGPoint(x: 335.58, y: 168.68))
        dottedLinePath.close()
        dottedLinePath.move(to: CGPoint(x: 136.32, y: 166.04))
        dottedLinePath.addCurve(to: CGPoint(x: 134.28, y: 161.97), controlPoint1: CGPoint(x: 135.62, y: 164.71), controlPoint2: CGPoint(x: 134.93, y: 163.34))
        dottedLinePath.addLine(to: CGPoint(x: 134.96, y: 161.65))
        dottedLinePath.addCurve(to: CGPoint(x: 136.99, y: 165.69), controlPoint1: CGPoint(x: 135.61, y: 163), controlPoint2: CGPoint(x: 136.29, y: 164.36))
        dottedLinePath.addLine(to: CGPoint(x: 136.32, y: 166.04))
        dottedLinePath.close()
        dottedLinePath.move(to: CGPoint(x: 339.08, y: 161.91))
        dottedLinePath.addLine(to: CGPoint(x: 338.39, y: 161.58))
        dottedLinePath.addCurve(to: CGPoint(x: 340.26, y: 157.44), controlPoint1: CGPoint(x: 339.04, y: 160.22), controlPoint2: CGPoint(x: 339.67, y: 158.83))
        dottedLinePath.addLine(to: CGPoint(x: 340.96, y: 157.74))
        dottedLinePath.addCurve(to: CGPoint(x: 339.08, y: 161.91), controlPoint1: CGPoint(x: 340.36, y: 159.14), controlPoint2: CGPoint(x: 339.73, y: 160.54))
        dottedLinePath.close()
        dottedLinePath.move(to: CGPoint(x: 132.4, y: 157.82))
        dottedLinePath.addCurve(to: CGPoint(x: 130.7, y: 153.61), controlPoint1: CGPoint(x: 131.81, y: 156.43), controlPoint2: CGPoint(x: 131.24, y: 155.01))
        dottedLinePath.addLine(to: CGPoint(x: 131.41, y: 153.34))
        dottedLinePath.addCurve(to: CGPoint(x: 133.1, y: 157.53), controlPoint1: CGPoint(x: 131.94, y: 154.73), controlPoint2: CGPoint(x: 132.51, y: 156.15))
        dottedLinePath.addLine(to: CGPoint(x: 132.4, y: 157.82))
        dottedLinePath.close()
        dottedLinePath.move(to: CGPoint(x: 342.67, y: 153.5))
        dottedLinePath.addLine(to: CGPoint(x: 341.96, y: 153.23))
        dottedLinePath.addCurve(to: CGPoint(x: 343.48, y: 148.95), controlPoint1: CGPoint(x: 342.49, y: 151.82), controlPoint2: CGPoint(x: 343.01, y: 150.38))
        dottedLinePath.addLine(to: CGPoint(x: 344.2, y: 149.19))
        dottedLinePath.addCurve(to: CGPoint(x: 342.67, y: 153.5), controlPoint1: CGPoint(x: 343.72, y: 150.63), controlPoint2: CGPoint(x: 343.2, y: 152.08))
        dottedLinePath.addLine(to: CGPoint(x: 342.67, y: 153.5))
        dottedLinePath.close()
        dottedLinePath.move(to: CGPoint(x: 129.16, y: 149.31))
        dottedLinePath.addCurve(to: CGPoint(x: 127.8, y: 144.95), controlPoint1: CGPoint(x: 128.68, y: 147.87), controlPoint2: CGPoint(x: 128.23, y: 146.41))
        dottedLinePath.addLine(to: CGPoint(x: 128.53, y: 144.74))
        dottedLinePath.addCurve(to: CGPoint(x: 129.88, y: 149.07), controlPoint1: CGPoint(x: 128.95, y: 146.19), controlPoint2: CGPoint(x: 129.4, y: 147.64))
        dottedLinePath.addLine(to: CGPoint(x: 129.16, y: 149.31))
        dottedLinePath.close()
        dottedLinePath.move(to: CGPoint(x: 345.56, y: 144.83))
        dottedLinePath.addLine(to: CGPoint(x: 344.83, y: 144.62))
        dottedLinePath.addCurve(to: CGPoint(x: 346, y: 140.24), controlPoint1: CGPoint(x: 345.25, y: 143.18), controlPoint2: CGPoint(x: 345.64, y: 141.71))
        dottedLinePath.addLine(to: CGPoint(x: 346.73, y: 140.42))
        dottedLinePath.addCurve(to: CGPoint(x: 345.56, y: 144.83), controlPoint1: CGPoint(x: 346.37, y: 141.9), controlPoint2: CGPoint(x: 345.98, y: 143.38))
        dottedLinePath.close()
        dottedLinePath.move(to: CGPoint(x: 126.62, y: 140.55))
        dottedLinePath.addCurve(to: CGPoint(x: 125.62, y: 136.1), controlPoint1: CGPoint(x: 126.26, y: 139.08), controlPoint2: CGPoint(x: 125.92, y: 137.58))
        dottedLinePath.addLine(to: CGPoint(x: 126.36, y: 135.95))
        dottedLinePath.addCurve(to: CGPoint(x: 127.35, y: 140.37), controlPoint1: CGPoint(x: 126.66, y: 137.42), controlPoint2: CGPoint(x: 126.99, y: 138.91))
        dottedLinePath.addLine(to: CGPoint(x: 126.62, y: 140.55))
        dottedLinePath.close()
        dottedLinePath.move(to: CGPoint(x: 347.73, y: 135.97))
        dottedLinePath.addLine(to: CGPoint(x: 346.99, y: 135.82))
        dottedLinePath.addCurve(to: CGPoint(x: 347.8, y: 131.36), controlPoint1: CGPoint(x: 347.29, y: 134.35), controlPoint2: CGPoint(x: 347.56, y: 132.85))
        dottedLinePath.addLine(to: CGPoint(x: 348.55, y: 131.48))
        dottedLinePath.addCurve(to: CGPoint(x: 347.73, y: 135.97), controlPoint1: CGPoint(x: 348.31, y: 132.98), controlPoint2: CGPoint(x: 348.03, y: 134.49))
        dottedLinePath.addLine(to: CGPoint(x: 347.73, y: 135.97))
        dottedLinePath.close()
        dottedLinePath.move(to: CGPoint(x: 124.8, y: 131.61))
        dottedLinePath.addCurve(to: CGPoint(x: 124.15, y: 127.09), controlPoint1: CGPoint(x: 124.55, y: 130.12), controlPoint2: CGPoint(x: 124.34, y: 128.6))
        dottedLinePath.addLine(to: CGPoint(x: 124.9, y: 127))
        dottedLinePath.addCurve(to: CGPoint(x: 125.54, y: 131.49), controlPoint1: CGPoint(x: 125.09, y: 128.5), controlPoint2: CGPoint(x: 125.3, y: 130.01))
        dottedLinePath.addLine(to: CGPoint(x: 124.8, y: 131.61))
        dottedLinePath.close()
        dottedLinePath.move(to: CGPoint(x: 349.19, y: 126.97))
        dottedLinePath.addLine(to: CGPoint(x: 348.43, y: 126.88))
        dottedLinePath.addCurve(to: CGPoint(x: 348.89, y: 122.37), controlPoint1: CGPoint(x: 348.61, y: 125.38), controlPoint2: CGPoint(x: 348.77, y: 123.86))
        dottedLinePath.addLine(to: CGPoint(x: 349.64, y: 122.43))
        dottedLinePath.addCurve(to: CGPoint(x: 349.19, y: 126.97), controlPoint1: CGPoint(x: 349.52, y: 123.93), controlPoint2: CGPoint(x: 349.37, y: 125.46))
        dottedLinePath.addLine(to: CGPoint(x: 349.19, y: 126.97))
        dottedLinePath.close()
        dottedLinePath.move(to: CGPoint(x: 123.7, y: 122.55))
        dottedLinePath.addCurve(to: CGPoint(x: 123.42, y: 118), controlPoint1: CGPoint(x: 123.57, y: 121.04), controlPoint2: CGPoint(x: 123.48, y: 119.51))
        dottedLinePath.addLine(to: CGPoint(x: 124.18, y: 117.97))
        dottedLinePath.addCurve(to: CGPoint(x: 124.45, y: 122.49), controlPoint1: CGPoint(x: 124.24, y: 119.47), controlPoint2: CGPoint(x: 124.33, y: 120.99))
        dottedLinePath.addLine(to: CGPoint(x: 123.7, y: 122.55))
        dottedLinePath.close()
        dottedLinePath.move(to: CGPoint(x: 349.91, y: 117.87))
        dottedLinePath.addLine(to: CGPoint(x: 349.16, y: 117.84))
        dottedLinePath.addCurve(to: CGPoint(x: 349.24, y: 113.31), controlPoint1: CGPoint(x: 349.21, y: 116.34), controlPoint2: CGPoint(x: 349.24, y: 114.81))
        dottedLinePath.addLine(to: CGPoint(x: 349.24, y: 113.06))
        dottedLinePath.addLine(to: CGPoint(x: 350, y: 113.06))
        dottedLinePath.addLine(to: CGPoint(x: 350, y: 113.31))
        dottedLinePath.addCurve(to: CGPoint(x: 349.91, y: 117.87), controlPoint1: CGPoint(x: 350, y: 114.82), controlPoint2: CGPoint(x: 349.97, y: 116.36))
        dottedLinePath.close()
        dottedLinePath.move(to: CGPoint(x: 124.08, y: 113.44))
        dottedLinePath.addLine(to: CGPoint(x: 123.33, y: 113.44))
        dottedLinePath.addLine(to: CGPoint(x: 123.33, y: 113.31))
        dottedLinePath.addCurve(to: CGPoint(x: 123.41, y: 108.88), controlPoint1: CGPoint(x: 123.33, y: 111.84), controlPoint2: CGPoint(x: 123.35, y: 110.34))
        dottedLinePath.addLine(to: CGPoint(x: 124.17, y: 108.91))
        dottedLinePath.addCurve(to: CGPoint(x: 124.08, y: 113.31), controlPoint1: CGPoint(x: 124.11, y: 110.36), controlPoint2: CGPoint(x: 124.08, y: 111.85))
        dottedLinePath.addLine(to: CGPoint(x: 124.08, y: 113.44))
        dottedLinePath.close()
        dottedLinePath.move(to: CGPoint(x: 349.14, y: 108.53))
        dottedLinePath.addCurve(to: CGPoint(x: 348.87, y: 104.01), controlPoint1: CGPoint(x: 349.08, y: 107.03), controlPoint2: CGPoint(x: 348.99, y: 105.51))
        dottedLinePath.addLine(to: CGPoint(x: 349.62, y: 103.95))
        dottedLinePath.addCurve(to: CGPoint(x: 349.9, y: 108.5), controlPoint1: CGPoint(x: 349.74, y: 105.46), controlPoint2: CGPoint(x: 349.84, y: 106.99))
        dottedLinePath.addLine(to: CGPoint(x: 349.14, y: 108.53))
        dottedLinePath.close()
        dottedLinePath.move(to: CGPoint(x: 124.43, y: 104.38))
        dottedLinePath.addLine(to: CGPoint(x: 123.68, y: 104.32))
        dottedLinePath.addCurve(to: CGPoint(x: 124.12, y: 99.78), controlPoint1: CGPoint(x: 123.8, y: 102.81), controlPoint2: CGPoint(x: 123.95, y: 101.28))
        dottedLinePath.addLine(to: CGPoint(x: 124.88, y: 99.87))
        dottedLinePath.addCurve(to: CGPoint(x: 124.43, y: 104.38), controlPoint1: CGPoint(x: 124.7, y: 101.36), controlPoint2: CGPoint(x: 124.55, y: 102.88))
        dottedLinePath.close()
        dottedLinePath.move(to: CGPoint(x: 348.41, y: 99.5))
        dottedLinePath.addCurve(to: CGPoint(x: 347.76, y: 95.01), controlPoint1: CGPoint(x: 348.22, y: 98.01), controlPoint2: CGPoint(x: 348.01, y: 96.5))
        dottedLinePath.addLine(to: CGPoint(x: 348.51, y: 94.89))
        dottedLinePath.addCurve(to: CGPoint(x: 349.16, y: 99.41), controlPoint1: CGPoint(x: 348.75, y: 96.39), controlPoint2: CGPoint(x: 348.97, y: 97.91))
        dottedLinePath.addLine(to: CGPoint(x: 348.41, y: 99.5))
        dottedLinePath.close()
        dottedLinePath.move(to: CGPoint(x: 125.5, y: 95.38))
        dottedLinePath.addLine(to: CGPoint(x: 124.76, y: 95.26))
        dottedLinePath.addCurve(to: CGPoint(x: 125.57, y: 90.77), controlPoint1: CGPoint(x: 124.99, y: 93.77), controlPoint2: CGPoint(x: 125.27, y: 92.26))
        dottedLinePath.addLine(to: CGPoint(x: 126.31, y: 90.92))
        dottedLinePath.addCurve(to: CGPoint(x: 125.5, y: 95.38), controlPoint1: CGPoint(x: 126.01, y: 92.4), controlPoint2: CGPoint(x: 125.74, y: 93.9))
        dottedLinePath.addLine(to: CGPoint(x: 125.5, y: 95.38))
        dottedLinePath.close()
        dottedLinePath.move(to: CGPoint(x: 346.94, y: 90.56))
        dottedLinePath.addCurve(to: CGPoint(x: 345.94, y: 86.14), controlPoint1: CGPoint(x: 346.64, y: 89.08), controlPoint2: CGPoint(x: 346.3, y: 87.59))
        dottedLinePath.addLine(to: CGPoint(x: 346.67, y: 85.95))
        dottedLinePath.addCurve(to: CGPoint(x: 347.68, y: 90.4), controlPoint1: CGPoint(x: 347.04, y: 87.42), controlPoint2: CGPoint(x: 347.38, y: 88.92))
        dottedLinePath.addLine(to: CGPoint(x: 346.94, y: 90.56))
        dottedLinePath.close()
        dottedLinePath.move(to: CGPoint(x: 127.29, y: 86.5))
        dottedLinePath.addLine(to: CGPoint(x: 126.56, y: 86.32))
        dottedLinePath.addCurve(to: CGPoint(x: 127.73, y: 81.91), controlPoint1: CGPoint(x: 126.92, y: 84.85), controlPoint2: CGPoint(x: 127.31, y: 83.37))
        dottedLinePath.addLine(to: CGPoint(x: 128.46, y: 82.12))
        dottedLinePath.addCurve(to: CGPoint(x: 127.29, y: 86.5), controlPoint1: CGPoint(x: 128.04, y: 83.57), controlPoint2: CGPoint(x: 127.65, y: 85.04))
        dottedLinePath.close()
        dottedLinePath.move(to: CGPoint(x: 344.76, y: 81.76))
        dottedLinePath.addCurve(to: CGPoint(x: 343.41, y: 77.44), controlPoint1: CGPoint(x: 344.34, y: 80.32), controlPoint2: CGPoint(x: 343.88, y: 78.86))
        dottedLinePath.addLine(to: CGPoint(x: 344.12, y: 77.2))
        dottedLinePath.addCurve(to: CGPoint(x: 345.49, y: 81.55), controlPoint1: CGPoint(x: 344.6, y: 78.63), controlPoint2: CGPoint(x: 345.06, y: 80.1))
        dottedLinePath.addLine(to: CGPoint(x: 344.76, y: 81.76))
        dottedLinePath.close()
        dottedLinePath.move(to: CGPoint(x: 129.8, y: 77.79))
        dottedLinePath.addLine(to: CGPoint(x: 129.08, y: 77.55))
        dottedLinePath.addCurve(to: CGPoint(x: 130.62, y: 73.24), controlPoint1: CGPoint(x: 129.56, y: 76.12), controlPoint2: CGPoint(x: 130.08, y: 74.66))
        dottedLinePath.addLine(to: CGPoint(x: 131.32, y: 73.51))
        dottedLinePath.addCurve(to: CGPoint(x: 129.8, y: 77.79), controlPoint1: CGPoint(x: 130.79, y: 74.92), controlPoint2: CGPoint(x: 130.28, y: 76.36))
        dottedLinePath.addLine(to: CGPoint(x: 129.8, y: 77.79))
        dottedLinePath.close()
        dottedLinePath.move(to: CGPoint(x: 341.87, y: 73.17))
        dottedLinePath.addCurve(to: CGPoint(x: 340.18, y: 68.98), controlPoint1: CGPoint(x: 341.34, y: 71.77), controlPoint2: CGPoint(x: 340.77, y: 70.36))
        dottedLinePath.addLine(to: CGPoint(x: 340.87, y: 68.68))
        dottedLinePath.addCurve(to: CGPoint(x: 342.58, y: 72.9), controlPoint1: CGPoint(x: 341.46, y: 70.07), controlPoint2: CGPoint(x: 342.04, y: 71.49))
        dottedLinePath.addLine(to: CGPoint(x: 341.87, y: 73.17))
        dottedLinePath.close()
        dottedLinePath.move(to: CGPoint(x: 133.02, y: 69.29))
        dottedLinePath.addLine(to: CGPoint(x: 132.32, y: 69))
        dottedLinePath.addCurve(to: CGPoint(x: 134.19, y: 64.83), controlPoint1: CGPoint(x: 132.91, y: 67.6), controlPoint2: CGPoint(x: 133.54, y: 66.2))
        dottedLinePath.addLine(to: CGPoint(x: 134.88, y: 65.15))
        dottedLinePath.addCurve(to: CGPoint(x: 133.02, y: 69.29), controlPoint1: CGPoint(x: 134.23, y: 66.51), controlPoint2: CGPoint(x: 133.61, y: 67.91))
        dottedLinePath.addLine(to: CGPoint(x: 133.02, y: 69.29))
        dottedLinePath.close()
        dottedLinePath.move(to: CGPoint(x: 338.31, y: 64.86))
        dottedLinePath.addCurve(to: CGPoint(x: 336.28, y: 60.82), controlPoint1: CGPoint(x: 337.66, y: 63.51), controlPoint2: CGPoint(x: 336.98, y: 62.15))
        dottedLinePath.addLine(to: CGPoint(x: 336.95, y: 60.47))
        dottedLinePath.addCurve(to: CGPoint(x: 338.99, y: 64.54), controlPoint1: CGPoint(x: 337.65, y: 61.81), controlPoint2: CGPoint(x: 338.34, y: 63.18))
        dottedLinePath.addLine(to: CGPoint(x: 338.31, y: 64.86))
        dottedLinePath.close()
        dottedLinePath.move(to: CGPoint(x: 136.91, y: 61.09))
        dottedLinePath.addLine(to: CGPoint(x: 136.24, y: 60.74))
        dottedLinePath.addCurve(to: CGPoint(x: 138.44, y: 56.74), controlPoint1: CGPoint(x: 136.94, y: 59.4), controlPoint2: CGPoint(x: 137.68, y: 58.05))
        dottedLinePath.addLine(to: CGPoint(x: 139.1, y: 57.11))
        dottedLinePath.addCurve(to: CGPoint(x: 136.91, y: 61.09), controlPoint1: CGPoint(x: 138.34, y: 58.42), controlPoint2: CGPoint(x: 137.61, y: 59.76))
        dottedLinePath.addLine(to: CGPoint(x: 136.91, y: 61.09))
        dottedLinePath.close()
        dottedLinePath.move(to: CGPoint(x: 334.09, y: 56.87))
        dottedLinePath.addCurve(to: CGPoint(x: 331.73, y: 53), controlPoint1: CGPoint(x: 333.33, y: 55.57), controlPoint2: CGPoint(x: 332.54, y: 54.26))
        dottedLinePath.addLine(to: CGPoint(x: 332.37, y: 52.59))
        dottedLinePath.addCurve(to: CGPoint(x: 334.74, y: 56.49), controlPoint1: CGPoint(x: 333.18, y: 53.87), controlPoint2: CGPoint(x: 333.98, y: 55.18))
        dottedLinePath.addLine(to: CGPoint(x: 334.09, y: 56.87))
        dottedLinePath.close()
        dottedLinePath.move(to: CGPoint(x: 141.44, y: 53.23))
        dottedLinePath.addLine(to: CGPoint(x: 140.81, y: 52.83))
        dottedLinePath.addCurve(to: CGPoint(x: 143.33, y: 49.02), controlPoint1: CGPoint(x: 141.62, y: 51.54), controlPoint2: CGPoint(x: 142.46, y: 50.26))
        dottedLinePath.addLine(to: CGPoint(x: 143.95, y: 49.45))
        dottedLinePath.addCurve(to: CGPoint(x: 141.44, y: 53.23), controlPoint1: CGPoint(x: 143.09, y: 50.68), controlPoint2: CGPoint(x: 142.25, y: 51.96))
        dottedLinePath.addLine(to: CGPoint(x: 141.44, y: 53.23))
        dottedLinePath.close()
        dottedLinePath.move(to: CGPoint(x: 329.23, y: 49.23))
        dottedLinePath.addCurve(to: CGPoint(x: 326.57, y: 45.56), controlPoint1: CGPoint(x: 328.37, y: 47.99), controlPoint2: CGPoint(x: 327.48, y: 46.76))
        dottedLinePath.addLine(to: CGPoint(x: 327.18, y: 45.11))
        dottedLinePath.addCurve(to: CGPoint(x: 329.85, y: 48.8), controlPoint1: CGPoint(x: 328.09, y: 46.31), controlPoint2: CGPoint(x: 328.99, y: 47.55))
        dottedLinePath.addLine(to: CGPoint(x: 329.23, y: 49.23))
        dottedLinePath.close()
        dottedLinePath.move(to: CGPoint(x: 146.6, y: 45.76))
        dottedLinePath.addLine(to: CGPoint(x: 145.99, y: 45.31))
        dottedLinePath.addCurve(to: CGPoint(x: 148.81, y: 41.72), controlPoint1: CGPoint(x: 146.91, y: 44.1), controlPoint2: CGPoint(x: 147.85, y: 42.89))
        dottedLinePath.addLine(to: CGPoint(x: 149.4, y: 42.19))
        dottedLinePath.addCurve(to: CGPoint(x: 146.6, y: 45.76), controlPoint1: CGPoint(x: 148.44, y: 43.36), controlPoint2: CGPoint(x: 147.5, y: 44.56))
        dottedLinePath.addLine(to: CGPoint(x: 146.6, y: 45.76))
        dottedLinePath.close()
        dottedLinePath.move(to: CGPoint(x: 323.77, y: 42))
        dottedLinePath.addCurve(to: CGPoint(x: 320.83, y: 38.56), controlPoint1: CGPoint(x: 322.82, y: 40.84), controlPoint2: CGPoint(x: 321.83, y: 39.68))
        dottedLinePath.addLine(to: CGPoint(x: 321.39, y: 38.05))
        dottedLinePath.addCurve(to: CGPoint(x: 324.36, y: 41.52), controlPoint1: CGPoint(x: 322.4, y: 39.19), controlPoint2: CGPoint(x: 323.4, y: 40.35))
        dottedLinePath.addLine(to: CGPoint(x: 323.77, y: 42))
        dottedLinePath.close()
        dottedLinePath.move(to: CGPoint(x: 152.33, y: 38.74))
        dottedLinePath.addLine(to: CGPoint(x: 151.77, y: 38.24))
        dottedLinePath.addCurve(to: CGPoint(x: 154.86, y: 34.88), controlPoint1: CGPoint(x: 152.77, y: 37.11), controlPoint2: CGPoint(x: 153.81, y: 35.98))
        dottedLinePath.addLine(to: CGPoint(x: 155.41, y: 35.41))
        dottedLinePath.addCurve(to: CGPoint(x: 152.33, y: 38.74), controlPoint1: CGPoint(x: 154.36, y: 36.49), controlPoint2: CGPoint(x: 153.33, y: 37.61))
        dottedLinePath.addLine(to: CGPoint(x: 152.33, y: 38.74))
        dottedLinePath.close()
        dottedLinePath.move(to: CGPoint(x: 317.75, y: 35.23))
        dottedLinePath.addCurve(to: CGPoint(x: 314.54, y: 32.03), controlPoint1: CGPoint(x: 316.7, y: 34.15), controlPoint2: CGPoint(x: 315.63, y: 33.07))
        dottedLinePath.addLine(to: CGPoint(x: 315.06, y: 31.48))
        dottedLinePath.addCurve(to: CGPoint(x: 318.29, y: 34.71), controlPoint1: CGPoint(x: 316.15, y: 32.53), controlPoint2: CGPoint(x: 317.24, y: 33.61))
        dottedLinePath.addLine(to: CGPoint(x: 317.75, y: 35.23))
        dottedLinePath.close()
        dottedLinePath.move(to: CGPoint(x: 158.61, y: 32.2))
        dottedLinePath.addLine(to: CGPoint(x: 158.08, y: 31.65))
        dottedLinePath.addCurve(to: CGPoint(x: 161.43, y: 28.56), controlPoint1: CGPoint(x: 159.17, y: 30.61), controlPoint2: CGPoint(x: 160.3, y: 29.56))
        dottedLinePath.addLine(to: CGPoint(x: 161.94, y: 29.12))
        dottedLinePath.addCurve(to: CGPoint(x: 158.61, y: 32.2), controlPoint1: CGPoint(x: 160.81, y: 30.12), controlPoint2: CGPoint(x: 159.69, y: 31.16))
        dottedLinePath.addLine(to: CGPoint(x: 158.61, y: 32.2))
        dottedLinePath.close()
        dottedLinePath.move(to: CGPoint(x: 311.2, y: 28.96))
        dottedLinePath.addCurve(to: CGPoint(x: 307.75, y: 26.03), controlPoint1: CGPoint(x: 310.08, y: 27.96), controlPoint2: CGPoint(x: 308.91, y: 26.97))
        dottedLinePath.addLine(to: CGPoint(x: 308.23, y: 25.44))
        dottedLinePath.addCurve(to: CGPoint(x: 311.71, y: 28.39), controlPoint1: CGPoint(x: 309.4, y: 26.4), controlPoint2: CGPoint(x: 310.57, y: 27.39))
        dottedLinePath.addLine(to: CGPoint(x: 311.2, y: 28.96))
        dottedLinePath.close()
        dottedLinePath.move(to: CGPoint(x: 165.38, y: 26.18))
        dottedLinePath.addLine(to: CGPoint(x: 164.91, y: 25.6))
        dottedLinePath.addCurve(to: CGPoint(x: 168.49, y: 22.78), controlPoint1: CGPoint(x: 166.08, y: 24.64), controlPoint2: CGPoint(x: 167.28, y: 23.69))
        dottedLinePath.addLine(to: CGPoint(x: 168.95, y: 23.39))
        dottedLinePath.addCurve(to: CGPoint(x: 165.38, y: 26.18), controlPoint1: CGPoint(x: 167.75, y: 24.29), controlPoint2: CGPoint(x: 166.55, y: 25.23))
        dottedLinePath.addLine(to: CGPoint(x: 165.38, y: 26.18))
        dottedLinePath.close()
        dottedLinePath.move(to: CGPoint(x: 304.17, y: 23.23))
        dottedLinePath.addCurve(to: CGPoint(x: 300.49, y: 20.58), controlPoint1: CGPoint(x: 302.97, y: 22.33), controlPoint2: CGPoint(x: 301.73, y: 21.44))
        dottedLinePath.addLine(to: CGPoint(x: 300.92, y: 19.96))
        dottedLinePath.addCurve(to: CGPoint(x: 304.63, y: 22.63), controlPoint1: CGPoint(x: 302.17, y: 20.82), controlPoint2: CGPoint(x: 303.41, y: 21.72))
        dottedLinePath.addLine(to: CGPoint(x: 304.17, y: 23.23))
        dottedLinePath.close()
        dottedLinePath.move(to: CGPoint(x: 172.62, y: 20.73))
        dottedLinePath.addLine(to: CGPoint(x: 172.19, y: 20.11))
        dottedLinePath.addCurve(to: CGPoint(x: 175.98, y: 17.59), controlPoint1: CGPoint(x: 173.43, y: 19.25), controlPoint2: CGPoint(x: 174.71, y: 18.4))
        dottedLinePath.addLine(to: CGPoint(x: 176.39, y: 18.23))
        dottedLinePath.addCurve(to: CGPoint(x: 172.62, y: 20.73), controlPoint1: CGPoint(x: 175.12, y: 19.03), controlPoint2: CGPoint(x: 173.85, y: 19.87))
        dottedLinePath.close()
        dottedLinePath.move(to: CGPoint(x: 296.71, y: 18.08))
        dottedLinePath.addCurve(to: CGPoint(x: 292.82, y: 15.74), controlPoint1: CGPoint(x: 295.43, y: 17.28), controlPoint2: CGPoint(x: 294.12, y: 16.49))
        dottedLinePath.addLine(to: CGPoint(x: 293.2, y: 15.08))
        dottedLinePath.addCurve(to: CGPoint(x: 297.11, y: 17.44), controlPoint1: CGPoint(x: 294.51, y: 15.84), controlPoint2: CGPoint(x: 295.83, y: 16.63))
        dottedLinePath.addLine(to: CGPoint(x: 296.71, y: 18.08))
        dottedLinePath.close()
        dottedLinePath.move(to: CGPoint(x: 180.26, y: 15.88))
        dottedLinePath.addLine(to: CGPoint(x: 179.88, y: 15.23))
        dottedLinePath.addCurve(to: CGPoint(x: 183.86, y: 13.02), controlPoint1: CGPoint(x: 181.19, y: 14.47), controlPoint2: CGPoint(x: 182.53, y: 13.73))
        dottedLinePath.addLine(to: CGPoint(x: 184.22, y: 13.69))
        dottedLinePath.addCurve(to: CGPoint(x: 180.26, y: 15.88), controlPoint1: CGPoint(x: 182.89, y: 14.39), controlPoint2: CGPoint(x: 181.56, y: 15.13))
        dottedLinePath.close()
        dottedLinePath.move(to: CGPoint(x: 288.84, y: 13.55))
        dottedLinePath.addCurve(to: CGPoint(x: 284.78, y: 11.52), controlPoint1: CGPoint(x: 287.51, y: 12.85), controlPoint2: CGPoint(x: 286.14, y: 12.17))
        dottedLinePath.addLine(to: CGPoint(x: 285.1, y: 10.84))
        dottedLinePath.addCurve(to: CGPoint(x: 289.19, y: 12.88), controlPoint1: CGPoint(x: 286.47, y: 11.49), controlPoint2: CGPoint(x: 287.85, y: 12.18))
        dottedLinePath.addLine(to: CGPoint(x: 288.84, y: 13.55))
        dottedLinePath.close()
        dottedLinePath.move(to: CGPoint(x: 188.26, y: 11.66))
        dottedLinePath.addLine(to: CGPoint(x: 187.93, y: 10.98))
        dottedLinePath.addCurve(to: CGPoint(x: 192.08, y: 9.1), controlPoint1: CGPoint(x: 189.3, y: 10.33), controlPoint2: CGPoint(x: 190.69, y: 9.7))
        dottedLinePath.addLine(to: CGPoint(x: 192.38, y: 9.8))
        dottedLinePath.addCurve(to: CGPoint(x: 188.26, y: 11.66), controlPoint1: CGPoint(x: 191, y: 10.39), controlPoint2: CGPoint(x: 189.61, y: 11.01))
        dottedLinePath.addLine(to: CGPoint(x: 188.26, y: 11.66))
        dottedLinePath.close()
        dottedLinePath.move(to: CGPoint(x: 280.63, y: 9.66))
        dottedLinePath.addCurve(to: CGPoint(x: 276.42, y: 7.97), controlPoint1: CGPoint(x: 279.24, y: 9.07), controlPoint2: CGPoint(x: 277.83, y: 8.51))
        dottedLinePath.addLine(to: CGPoint(x: 276.68, y: 7.27))
        dottedLinePath.addCurve(to: CGPoint(x: 280.93, y: 8.97), controlPoint1: CGPoint(x: 278.1, y: 7.8), controlPoint2: CGPoint(x: 279.53, y: 8.37))
        dottedLinePath.addLine(to: CGPoint(x: 280.63, y: 9.66))
        dottedLinePath.close()
        dottedLinePath.move(to: CGPoint(x: 196.57, y: 8.1))
        dottedLinePath.addLine(to: CGPoint(x: 196.3, y: 7.4))
        dottedLinePath.addCurve(to: CGPoint(x: 200.6, y: 5.86), controlPoint1: CGPoint(x: 197.72, y: 6.86), controlPoint2: CGPoint(x: 199.16, y: 6.34))
        dottedLinePath.addLine(to: CGPoint(x: 200.84, y: 6.57))
        dottedLinePath.addCurve(to: CGPoint(x: 196.57, y: 8.1), controlPoint1: CGPoint(x: 199.41, y: 7.05), controlPoint2: CGPoint(x: 197.97, y: 7.57))
        dottedLinePath.close()
        dottedLinePath.move(to: CGPoint(x: 272.13, y: 6.46))
        dottedLinePath.addCurve(to: CGPoint(x: 267.8, y: 5.12), controlPoint1: CGPoint(x: 270.7, y: 5.98), controlPoint2: CGPoint(x: 269.25, y: 5.53))
        dottedLinePath.addLine(to: CGPoint(x: 268.01, y: 4.39))
        dottedLinePath.addCurve(to: CGPoint(x: 272.37, y: 5.74), controlPoint1: CGPoint(x: 269.47, y: 4.81), controlPoint2: CGPoint(x: 270.93, y: 5.26))
        dottedLinePath.addLine(to: CGPoint(x: 272.13, y: 6.46))
        dottedLinePath.close()
        dottedLinePath.move(to: CGPoint(x: 205.16, y: 5.22))
        dottedLinePath.addLine(to: CGPoint(x: 204.95, y: 4.49))
        dottedLinePath.addCurve(to: CGPoint(x: 209.36, y: 3.31), controlPoint1: CGPoint(x: 206.41, y: 4.07), controlPoint2: CGPoint(x: 207.89, y: 3.67))
        dottedLinePath.addLine(to: CGPoint(x: 209.54, y: 4.04))
        dottedLinePath.addCurve(to: CGPoint(x: 205.16, y: 5.22), controlPoint1: CGPoint(x: 208.08, y: 4.4), controlPoint2: CGPoint(x: 206.61, y: 4.8))
        dottedLinePath.close()
        dottedLinePath.move(to: CGPoint(x: 263.42, y: 3.95))
        dottedLinePath.addCurve(to: CGPoint(x: 258.99, y: 2.97), controlPoint1: CGPoint(x: 261.96, y: 3.6), controlPoint2: CGPoint(x: 260.47, y: 3.27))
        dottedLinePath.addLine(to: CGPoint(x: 259.14, y: 2.23))
        dottedLinePath.addCurve(to: CGPoint(x: 263.6, y: 3.22), controlPoint1: CGPoint(x: 260.63, y: 2.53), controlPoint2: CGPoint(x: 262.13, y: 2.86))
        dottedLinePath.addLine(to: CGPoint(x: 263.42, y: 3.95))
        dottedLinePath.close()
        dottedLinePath.move(to: CGPoint(x: 213.96, y: 3.04))
        dottedLinePath.addLine(to: CGPoint(x: 213.81, y: 2.3))
        dottedLinePath.addCurve(to: CGPoint(x: 218.3, y: 1.48), controlPoint1: CGPoint(x: 215.29, y: 2), controlPoint2: CGPoint(x: 216.8, y: 1.72))
        dottedLinePath.addLine(to: CGPoint(x: 218.42, y: 2.23))
        dottedLinePath.addCurve(to: CGPoint(x: 213.96, y: 3.04), controlPoint1: CGPoint(x: 216.93, y: 2.47), controlPoint2: CGPoint(x: 215.43, y: 2.74))
        dottedLinePath.close()
        dottedLinePath.move(to: CGPoint(x: 254.53, y: 2.17))
        dottedLinePath.addCurve(to: CGPoint(x: 250.04, y: 1.54), controlPoint1: CGPoint(x: 253.05, y: 1.93), controlPoint2: CGPoint(x: 251.54, y: 1.72))
        dottedLinePath.addLine(to: CGPoint(x: 250.13, y: 0.79))
        dottedLinePath.addCurve(to: CGPoint(x: 254.65, y: 1.42), controlPoint1: CGPoint(x: 251.64, y: 0.97), controlPoint2: CGPoint(x: 253.16, y: 1.18))
        dottedLinePath.addLine(to: CGPoint(x: 254.53, y: 2.17))
        dottedLinePath.close()
        dottedLinePath.move(to: CGPoint(x: 222.91, y: 1.59))
        dottedLinePath.addLine(to: CGPoint(x: 222.82, y: 0.84))
        dottedLinePath.addCurve(to: CGPoint(x: 227.36, y: 0.38), controlPoint1: CGPoint(x: 224.32, y: 0.65), controlPoint2: CGPoint(x: 225.85, y: 0.5))
        dottedLinePath.addLine(to: CGPoint(x: 227.42, y: 1.13))
        dottedLinePath.addCurve(to: CGPoint(x: 222.91, y: 1.59), controlPoint1: CGPoint(x: 225.92, y: 1.25), controlPoint2: CGPoint(x: 224.4, y: 1.4))
        dottedLinePath.addLine(to: CGPoint(x: 222.91, y: 1.59))
        dottedLinePath.close()
        dottedLinePath.move(to: CGPoint(x: 245.53, y: 1.1))
        dottedLinePath.addCurve(to: CGPoint(x: 241.01, y: 0.84), controlPoint1: CGPoint(x: 244.04, y: 0.98), controlPoint2: CGPoint(x: 242.51, y: 0.89))
        dottedLinePath.addLine(to: CGPoint(x: 241.04, y: 0.08))
        dottedLinePath.addCurve(to: CGPoint(x: 245.59, y: 0.35), controlPoint1: CGPoint(x: 242.55, y: 0.14), controlPoint2: CGPoint(x: 244.08, y: 0.23))
        dottedLinePath.addLine(to: CGPoint(x: 245.53, y: 1.1))
        dottedLinePath.close()
        dottedLinePath.move(to: CGPoint(x: 231.94, y: 0.85))
        dottedLinePath.addLine(to: CGPoint(x: 231.91, y: 0.1))
        dottedLinePath.addCurve(to: CGPoint(x: 236.47, y: 0), controlPoint1: CGPoint(x: 233.42, y: 0.04), controlPoint2: CGPoint(x: 234.96, y: 0))
        dottedLinePath.addLine(to: CGPoint(x: 236.48, y: 0.76))
        dottedLinePath.addCurve(to: CGPoint(x: 231.94, y: 0.85), controlPoint1: CGPoint(x: 234.97, y: 0.76), controlPoint2: CGPoint(x: 233.44, y: 0.79))
        dottedLinePath.close()
        fillColor.setFill()
        dottedLinePath.fill()


        //// Table
        //// Table background Drawing
        let tableBackgroundPath = UIBezierPath(rect: CGRect(x: 24.32, y: 65.99, width: 193.67, height: 237.91))
        fillColor2.setFill()
        tableBackgroundPath.fill()


        //// Bottom Item
        //// Rectangle 6 Drawing
        let rectangle6Path = UIBezierPath(rect: CGRect(x: 6.95, y: 241.38, width: 238.83, height: 61.65))
        fillColor.setFill()
        rectangle6Path.fill()


        //// Oval 2 Drawing
        let oval2Path = UIBezierPath(ovalIn: CGRect(x: 19.11, y: 255.28, width: 33, height: 33.86))
        fillColor3.setFill()
        oval2Path.fill()


        //// Rectangle 8 Drawing
        let rectangle8Path = UIBezierPath(rect: CGRect(x: 70.35, y: 257.88, width: 69.48, height: 5.21))
        fillColor4.setFill()
        rectangle8Path.fill()


        //// Rectangle 10 Drawing
        let rectangle10Path = UIBezierPath(rect: CGRect(x: 70.35, y: 269.17, width: 151.99, height: 5.21))
        fillColor4.setFill()
        rectangle10Path.fill()


        //// Rectangle 12 Drawing
        let rectangle12Path = UIBezierPath(rect: CGRect(x: 70.35, y: 281.32, width: 151.99, height: 5.21))
        fillColor4.setFill()
        rectangle12Path.fill()




        //// Top Item
        //// Oval 4 Drawing
        let oval4Path = UIBezierPath(ovalIn: CGRect(x: 35.61, y: 101.59, width: 33, height: 33.86))
        fillColor3.setFill()
        oval4Path.fill()


        //// Rectangle 14 Drawing
        let rectangle14Path = UIBezierPath(rect: CGRect(x: 81.64, y: 105.93, width: 57.32, height: 5.21))
        fillColor4.setFill()
        rectangle14Path.fill()


        //// Rectangle 16 Drawing
        let rectangle16Path = UIBezierPath(rect: CGRect(x: 81.64, y: 118.09, width: 125.93, height: 5.21))
        fillColor4.setFill()
        rectangle16Path.fill()


        //// Rectangle 18 Drawing
        let rectangle18Path = UIBezierPath(rect: CGRect(x: 81.64, y: 130.24, width: 125.93, height: 5.21))
        fillColor4.setFill()
        rectangle18Path.fill()




        //// Center Item
        //// Oval 6 Drawing
        let oval6Path = UIBezierPath(ovalIn: CGRect(x: 35.61, y: 178, width: 33, height: 33.86))
        fillColor3.setFill()
        oval6Path.fill()


        //// Rectangle 20 Drawing
        let rectangle20Path = UIBezierPath(rect: CGRect(x: 81.64, y: 183.21, width: 57.32, height: 5.21))
        fillColor4.setFill()
        rectangle20Path.fill()


        //// Rectangle 22 Drawing
        let rectangle22Path = UIBezierPath(rect: CGRect(x: 81.64, y: 195.36, width: 125.93, height: 5.21))
        fillColor4.setFill()
        rectangle22Path.fill()


        //// Rectangle 24 Drawing
        let rectangle24Path = UIBezierPath(rect: CGRect(x: 81.64, y: 206.65, width: 125.93, height: 5.21))
        fillColor4.setFill()
        rectangle24Path.fill()




        //// Top view
        //// Rectangle 4 Drawing
        let rectangle4Path = UIBezierPath(rect: CGRect(x: 24.32, y: 52.97, width: 193.67, height: 26.92))
        fillColor3.setFill()
        rectangle4Path.fill()


        //// Rectangle 26 Drawing
        let rectangle26Path = UIBezierPath(rect: CGRect(x: 29.53, y: 58.18, width: 25.19, height: 3.47))
        fillColor4.setFill()
        rectangle26Path.fill()


        //// Rectangle 28 Drawing
        let rectangle28Path = UIBezierPath(rect: CGRect(x: 29.53, y: 64.25, width: 25.19, height: 3.47))
        fillColor4.setFill()
        rectangle28Path.fill()


        //// Rectangle 30 Drawing
        let rectangle30Path = UIBezierPath(rect: CGRect(x: 29.53, y: 71.2, width: 25.19, height: 3.47))
        fillColor4.setFill()
        rectangle30Path.fill()






        //// Flower
        //// Rectangle 32 Drawing
        let rectangle32Path = UIBezierPath(rect: CGRect(x: 21.71, y: 191.89, width: 1, height: 51.23))
        fillColor.setFill()
        rectangle32Path.fill()


        //// Oval 8 Drawing
        let oval8Path = UIBezierPath(ovalIn: CGRect(x: 14.76, y: 184.95, width: 14.76, height: 14.76))
        fillColor.setFill()
        oval8Path.fill()


        //// Path Drawing
        let pathPath = UIBezierPath()
        pathPath.move(to: CGPoint(x: 22.58, y: 224.02))
        pathPath.addCurve(to: CGPoint(x: 0, y: 204.26), controlPoint1: CGPoint(x: 22.58, y: 224.02), controlPoint2: CGPoint(x: 21.53, y: 201.66))
        fillColor.setFill()
        pathPath.fill()




        //// Girl
        //// Path 2 Drawing
        let path2Path = UIBezierPath()
        path2Path.move(to: CGPoint(x: 254.55, y: 144.14))
        path2Path.addLine(to: CGPoint(x: 245.96, y: 160.35))
        path2Path.addCurve(to: CGPoint(x: 191.77, y: 190.8), controlPoint1: CGPoint(x: 245.96, y: 160.35), controlPoint2: CGPoint(x: 183.84, y: 172.27))
        path2Path.addCurve(to: CGPoint(x: 213.25, y: 235.82), controlPoint1: CGPoint(x: 199.7, y: 209.34), controlPoint2: CGPoint(x: 208.62, y: 236.48))
        path2Path.addCurve(to: CGPoint(x: 244.31, y: 216.29), controlPoint1: CGPoint(x: 217.87, y: 235.16), controlPoint2: CGPoint(x: 243.32, y: 220.59))
        path2Path.addCurve(to: CGPoint(x: 221.51, y: 191.8), controlPoint1: CGPoint(x: 245.3, y: 211.99), controlPoint2: CGPoint(x: 221.51, y: 191.8))
        path2Path.addLine(to: CGPoint(x: 260.83, y: 184.18))
        path2Path.addCurve(to: CGPoint(x: 259.18, y: 228.87), controlPoint1: CGPoint(x: 260.83, y: 184.18), controlPoint2: CGPoint(x: 266.45, y: 210.66))
        path2Path.addCurve(to: CGPoint(x: 252.57, y: 297.05), controlPoint1: CGPoint(x: 251.91, y: 247.07), controlPoint2: CGPoint(x: 247.61, y: 296.39))
        path2Path.addCurve(to: CGPoint(x: 275.7, y: 298.04), controlPoint1: CGPoint(x: 257.53, y: 297.71), controlPoint2: CGPoint(x: 270.08, y: 301.68))
        path2Path.addCurve(to: CGPoint(x: 283.96, y: 214.63), controlPoint1: CGPoint(x: 281.32, y: 294.4), controlPoint2: CGPoint(x: 283.96, y: 214.63))
        path2Path.addCurve(to: CGPoint(x: 288.59, y: 156.38), controlPoint1: CGPoint(x: 283.96, y: 214.63), controlPoint2: CGPoint(x: 295.86, y: 162.34))
        path2Path.addCurve(to: CGPoint(x: 254.55, y: 144.14), controlPoint1: CGPoint(x: 281.32, y: 150.42), controlPoint2: CGPoint(x: 254.55, y: 144.14))
        path2Path.close()
        fillColor5.setFill()
        path2Path.fill()


        //// Path 3 Drawing
        let path3Path = UIBezierPath()
        path3Path.move(to: CGPoint(x: 268.23, y: 289.44))
        path3Path.addCurve(to: CGPoint(x: 259, y: 288.64), controlPoint1: CGPoint(x: 268.23, y: 289.44), controlPoint2: CGPoint(x: 260.6, y: 285.45))
        path3Path.addCurve(to: CGPoint(x: 255.39, y: 299.43), controlPoint1: CGPoint(x: 259, y: 288.64), controlPoint2: CGPoint(x: 260.2, y: 298.23))
        path3Path.addCurve(to: CGPoint(x: 255.39, y: 309.82), controlPoint1: CGPoint(x: 250.57, y: 300.63), controlPoint2: CGPoint(x: 248.57, y: 309.02))
        path3Path.addCurve(to: CGPoint(x: 269.03, y: 308.22), controlPoint1: CGPoint(x: 262.21, y: 310.61), controlPoint2: CGPoint(x: 266.62, y: 308.22))
        path3Path.addCurve(to: CGPoint(x: 269.03, y: 299.83), controlPoint1: CGPoint(x: 271.44, y: 308.22), controlPoint2: CGPoint(x: 269.03, y: 299.83))
        path3Path.addLine(to: CGPoint(x: 268.23, y: 289.44))
        path3Path.close()
        fillColor5.setFill()
        path3Path.fill()


        //// Path 4 Drawing
        let path4Path = UIBezierPath()
        path4Path.move(to: CGPoint(x: 232.47, y: 222.17))
        path4Path.addCurve(to: CGPoint(x: 223.28, y: 223.33), controlPoint1: CGPoint(x: 232.47, y: 222.17), controlPoint2: CGPoint(x: 224.17, y: 219.86))
        path4Path.addCurve(to: CGPoint(x: 222.03, y: 234.65), controlPoint1: CGPoint(x: 223.28, y: 223.33), controlPoint2: CGPoint(x: 226.49, y: 232.46))
        path4Path.addCurve(to: CGPoint(x: 224.23, y: 244.82), controlPoint1: CGPoint(x: 217.57, y: 236.84), controlPoint2: CGPoint(x: 217.39, y: 245.47))
        path4Path.addCurve(to: CGPoint(x: 237.24, y: 240.39), controlPoint1: CGPoint(x: 231.07, y: 244.17), controlPoint2: CGPoint(x: 234.88, y: 240.89))
        path4Path.addCurve(to: CGPoint(x: 235.46, y: 232.17), controlPoint1: CGPoint(x: 239.6, y: 239.88), controlPoint2: CGPoint(x: 235.46, y: 232.17))
        path4Path.addLine(to: CGPoint(x: 232.47, y: 222.17))
        path4Path.close()
        fillColor5.setFill()
        path4Path.fill()


        //// Path 5 Drawing
        let path5Path = UIBezierPath()
        path5Path.move(to: CGPoint(x: 273.17, y: 86.81))
        path5Path.addCurve(to: CGPoint(x: 271.21, y: 99.92), controlPoint1: CGPoint(x: 273.17, y: 86.81), controlPoint2: CGPoint(x: 273.5, y: 98.93))
        path5Path.addCurve(to: CGPoint(x: 283.98, y: 106.8), controlPoint1: CGPoint(x: 268.91, y: 100.9), controlPoint2: CGPoint(x: 283.98, y: 106.8))
        path5Path.addLine(to: CGPoint(x: 286.6, y: 102.21))
        path5Path.addCurve(to: CGPoint(x: 284.31, y: 84.51), controlPoint1: CGPoint(x: 286.6, y: 102.21), controlPoint2: CGPoint(x: 283.65, y: 85.82))
        path5Path.addCurve(to: CGPoint(x: 273.17, y: 86.81), controlPoint1: CGPoint(x: 284.96, y: 83.2), controlPoint2: CGPoint(x: 273.17, y: 86.81))
        path5Path.close()
        fillColor6.setFill()
        path5Path.fill()


        //// Oval 10 Drawing
        let oval10Path = UIBezierPath(ovalIn: CGRect(x: 258.81, y: 48.62, width: 40.82, height: 40.81))
        fillColor5.setFill()
        oval10Path.fill()


        //// Oval 12 Drawing
        let oval12Path = UIBezierPath(ovalIn: CGRect(x: 271.84, y: 41.68, width: 16.5, height: 16.5))
        fillColor5.setFill()
        oval12Path.fill()


        //// Path 6 Drawing
        let path6Path = UIBezierPath()
        path6Path.move(to: CGPoint(x: 269.3, y: 45.59))
        path6Path.addCurve(to: CGPoint(x: 277.05, y: 37.38), controlPoint1: CGPoint(x: 269.3, y: 41.36), controlPoint2: CGPoint(x: 272.64, y: 37.82))
        path6Path.addCurve(to: CGPoint(x: 276.15, y: 37.34), controlPoint1: CGPoint(x: 276.75, y: 37.35), controlPoint2: CGPoint(x: 276.45, y: 37.34))
        path6Path.addCurve(to: CGPoint(x: 267.49, y: 45.59), controlPoint1: CGPoint(x: 271.37, y: 37.34), controlPoint2: CGPoint(x: 267.49, y: 41.03))
        path6Path.addCurve(to: CGPoint(x: 276.15, y: 53.83), controlPoint1: CGPoint(x: 267.49, y: 50.14), controlPoint2: CGPoint(x: 271.37, y: 53.83))
        path6Path.addCurve(to: CGPoint(x: 277.05, y: 53.79), controlPoint1: CGPoint(x: 276.45, y: 53.83), controlPoint2: CGPoint(x: 276.75, y: 53.82))
        path6Path.addCurve(to: CGPoint(x: 269.3, y: 45.59), controlPoint1: CGPoint(x: 272.64, y: 53.35), controlPoint2: CGPoint(x: 269.3, y: 49.81))
        path6Path.close()
        fillColor5.setFill()
        path6Path.fill()


        //// Oval 14 Drawing
        let oval14Path = UIBezierPath(ovalIn: CGRect(x: 264.02, y: 65.12, width: 27.79, height: 27.79))
        fillColor6.setFill()
        oval14Path.fill()


        //// Path 7 Drawing
        let path7Path = UIBezierPath()
        path7Path.move(to: CGPoint(x: 288.21, y: 97.12))
        path7Path.addCurve(to: CGPoint(x: 270.34, y: 97.12), controlPoint1: CGPoint(x: 288.21, y: 97.12), controlPoint2: CGPoint(x: 276.3, y: 100.75))
        path7Path.addCurve(to: CGPoint(x: 247.84, y: 108.66), controlPoint1: CGPoint(x: 264.39, y: 93.5), controlPoint2: CGPoint(x: 250.16, y: 104.05))
        path7Path.addCurve(to: CGPoint(x: 256.44, y: 117.89), controlPoint1: CGPoint(x: 245.52, y: 113.27), controlPoint2: CGPoint(x: 256.44, y: 117.89))
        path7Path.addCurve(to: CGPoint(x: 253.96, y: 131.24), controlPoint1: CGPoint(x: 256.44, y: 117.89), controlPoint2: CGPoint(x: 253.33, y: 126.8))
        path7Path.addCurve(to: CGPoint(x: 253.47, y: 145.25), controlPoint1: CGPoint(x: 254.62, y: 135.85), controlPoint2: CGPoint(x: 253.47, y: 145.25))
        path7Path.addCurve(to: CGPoint(x: 289.2, y: 155.79), controlPoint1: CGPoint(x: 253.47, y: 145.25), controlPoint2: CGPoint(x: 282.7, y: 164.43))
        path7Path.addCurve(to: CGPoint(x: 298.47, y: 123.49), controlPoint1: CGPoint(x: 290.2, y: 154.48), controlPoint2: CGPoint(x: 298.47, y: 123.49))
        path7Path.addLine(to: CGPoint(x: 310.05, y: 111.96))
        path7Path.addCurve(to: CGPoint(x: 298.47, y: 100.42), controlPoint1: CGPoint(x: 310.05, y: 111.96), controlPoint2: CGPoint(x: 302.77, y: 101.41))
        path7Path.addCurve(to: CGPoint(x: 288.21, y: 97.12), controlPoint1: CGPoint(x: 294.17, y: 99.43), controlPoint2: CGPoint(x: 288.21, y: 97.12))
        path7Path.close()
        fillColor7.setFill()
        path7Path.fill()


        //// Path 8 Drawing
        let path8Path = UIBezierPath()
        path8Path.move(to: CGPoint(x: 207.98, y: 164.97))
        path8Path.addCurve(to: CGPoint(x: 189.96, y: 180.15), controlPoint1: CGPoint(x: 207.98, y: 164.97), controlPoint2: CGPoint(x: 185.29, y: 176.78))
        path8Path.addCurve(to: CGPoint(x: 213.65, y: 167), controlPoint1: CGPoint(x: 194.63, y: 183.52), controlPoint2: CGPoint(x: 213.65, y: 167))
        path8Path.addLine(to: CGPoint(x: 207.98, y: 164.97))
        path8Path.close()
        fillColor6.setFill()
        path8Path.fill()


        //// Path 9 Drawing
        let path9Path = UIBezierPath()
        path9Path.move(to: CGPoint(x: 296.79, y: 157.11))
        path9Path.addCurve(to: CGPoint(x: 285.01, y: 153.76), controlPoint1: CGPoint(x: 296.79, y: 157.11), controlPoint2: CGPoint(x: 286.64, y: 150.41))
        path9Path.addCurve(to: CGPoint(x: 298.8, y: 161.7), controlPoint1: CGPoint(x: 283.37, y: 157.11), controlPoint2: CGPoint(x: 296.12, y: 164.65))
        path9Path.addCurve(to: CGPoint(x: 296.79, y: 157.11), controlPoint1: CGPoint(x: 301.48, y: 158.75), controlPoint2: CGPoint(x: 296.79, y: 157.11))
        path9Path.close()
        fillColor6.setFill()
        path9Path.fill()


        //// Path 10 Drawing
        let path10Path = UIBezierPath()
        path10Path.move(to: CGPoint(x: 304.34, y: 108.54))
        path10Path.addLine(to: CGPoint(x: 310.24, y: 112.17))
        path10Path.addCurve(to: CGPoint(x: 323.37, y: 146.16), controlPoint1: CGPoint(x: 310.24, y: 112.17), controlPoint2: CGPoint(x: 330.26, y: 139.89))
        path10Path.addCurve(to: CGPoint(x: 298.76, y: 164.97), controlPoint1: CGPoint(x: 316.48, y: 152.43), controlPoint2: CGPoint(x: 298.76, y: 164.97))
        path10Path.addCurve(to: CGPoint(x: 294.82, y: 156.06), controlPoint1: CGPoint(x: 298.76, y: 164.97), controlPoint2: CGPoint(x: 292.85, y: 156.39))
        path10Path.addCurve(to: CGPoint(x: 312.54, y: 142.53), controlPoint1: CGPoint(x: 296.79, y: 155.73), controlPoint2: CGPoint(x: 312.54, y: 142.53))
        path10Path.addLine(to: CGPoint(x: 298.76, y: 116.79))
        path10Path.addLine(to: CGPoint(x: 304.34, y: 108.54))
        path10Path.close()
        fillColor7.setFill()
        path10Path.fill()


        //// Path 11 Drawing
        let path11Path = UIBezierPath()
        path11Path.move(to: CGPoint(x: 251.59, y: 106.8))
        path11Path.addLine(to: CGPoint(x: 247.25, y: 108.46))
        path11Path.addLine(to: CGPoint(x: 235.89, y: 128.75))
        path11Path.addLine(to: CGPoint(x: 205.83, y: 165.01))
        path11Path.addCurve(to: CGPoint(x: 213.18, y: 170), controlPoint1: CGPoint(x: 205.83, y: 165.01), controlPoint2: CGPoint(x: 209.84, y: 171.33))
        path11Path.addCurve(to: CGPoint(x: 241.57, y: 140.73), controlPoint1: CGPoint(x: 216.52, y: 168.67), controlPoint2: CGPoint(x: 241.57, y: 140.73))
        path11Path.addLine(to: CGPoint(x: 257.94, y: 115.45))
        path11Path.addLine(to: CGPoint(x: 251.59, y: 106.8))
        path11Path.close()
        fillColor7.setFill()
        path11Path.fill()


        //// Oval 16 Drawing
        let oval16Path = UIBezierPath(ovalIn: CGRect(x: 264.89, y: 54.7, width: 27.79, height: 16.5))
        fillColor5.setFill()
        oval16Path.fill()
        
        context.restoreGState()

    }




    @objc(MeetingPictureDrawResizingBehavior)
    public enum ResizingBehavior: Int {
        case aspectFit /// The content is proportionally resized to fit into the target rectangle.
        case aspectFill /// The content is proportionally resized to completely fill the target rectangle.
        case stretch /// The content is stretched to match the entire target rectangle.
        case center /// The content is centered in the target rectangle, but it is NOT resized.

        public func apply(rect: CGRect, target: CGRect) -> CGRect {
            if rect == target || target == CGRect.zero {
                return rect
            }

            var scales = CGSize.zero
            scales.width = abs(target.width / rect.width)
            scales.height = abs(target.height / rect.height)

            switch self {
                case .aspectFit:
                    scales.width = min(scales.width, scales.height)
                    scales.height = scales.width
                case .aspectFill:
                    scales.width = max(scales.width, scales.height)
                    scales.height = scales.width
                case .stretch:
                    break
                case .center:
                    scales.width = 1
                    scales.height = 1
            }

            var result = rect.standardized
            result.size.width *= scales.width
            result.size.height *= scales.height
            result.origin.x = target.minX + (target.width - result.width) / 2
            result.origin.y = target.minY + (target.height - result.height) / 2
            return result
        }
    }
}