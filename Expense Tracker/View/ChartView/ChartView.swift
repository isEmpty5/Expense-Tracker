//
//  ChartView.swift
//  Expense Tracker
//
//  Created by isEmpty on 03.12.2020.
//

import UIKit

@IBDesignable
final class ChartView: UIView {
    
    //MARK: - Properties
    private var graphView: GraphView!
    private var bottomStackView: UIStackView!
    private var scrollView: UIScrollView!
    private var stackView: UIStackView!
    private var balanceLabel: UILabel!
    private var netLabel: UILabel!
    public var currentBalance = "" {
        didSet {
            balanceLabel.text = currentBalance
        }
    }
    public var chartModel: [GraphPoint]?{
        didSet {
            reloadData()
        }
    }
        
    override func draw(_ rect: CGRect) {
        let path = UIBezierPath(roundedRect: rect, cornerRadius: 25)
        UIColor.white.setFill()
        path.fill()
    }
}

//MARK: - Layouts
extension ChartView {
    /// Configure `GraphView`. Passes data to it for display
    private func configureGraphView() {
        graphView = GraphView()
        graphView.graphPoints = chartModel!.map{$0.value}
        graphView.translatesAutoresizingMaskIntoConstraints = false
        stackView.addArrangedSubview(graphView)
        var graphWidth: CGFloat
        if CGFloat(chartModel!.count * 70) > frame.width {
            graphWidth = CGFloat(chartModel!.count * 70)
        } else {
            graphWidth = frame.width
        }
        graphView.widthAnchor.constraint(equalToConstant: graphWidth).isActive = true
    }
    
    /// Configure `StackView` contains all bottom labels.
    private func configureBottomStackView() {
        bottomStackView = UIStackView()
        bottomStackView.axis = .horizontal
        bottomStackView.distribution = .fillEqually
        bottomStackView.translatesAutoresizingMaskIntoConstraints = true

        chartModel!.forEach { (model) in
            let label = UILabel()
            let formatter = DateFormatter()
            formatter.dateFormat = "dd"
            label.text = formatter.string(from: model.date)
            label.font = UIFont.systemFont(ofSize: 16, weight: .light)
            label.textAlignment = .center
            label.textColor = #colorLiteral(red: 0.7254901961, green: 0.7411764706, blue: 0.7647058824, alpha: 1)
            bottomStackView.addArrangedSubview(label)
        }
        stackView.addArrangedSubview(bottomStackView)
        bottomStackView.heightAnchor.constraint(equalTo: stackView.heightAnchor, multiplier: 0.166).isActive = true
    }
    
    /// Configure a separator between graph and labels.
    private func configureSeparator() {
        let separator = UIView()
        separator.backgroundColor = #colorLiteral(red: 0.7254901961, green: 0.7411764706, blue: 0.7647058824, alpha: 1)
        stackView.addArrangedSubview(separator)
        separator.heightAnchor.constraint(equalToConstant: 1).isActive = true
    }
    
    /// Configure a labels with the current balance.
    private func configureLabels() {
        netLabel = UILabel()
        netLabel.text = "Net balance"
        netLabel.font = UIFont.systemFont(ofSize: 14, weight: .light)
        netLabel.textColor = #colorLiteral(red: 0.7254901961, green: 0.7411764706, blue: 0.7647058824, alpha: 1)
        netLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(netLabel)
        NSLayoutConstraint.activate([
            netLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            netLabel.topAnchor.constraint(equalTo: topAnchor, constant: 20)
        ])
        
        balanceLabel = UILabel()
        balanceLabel.font = UIFont.systemFont(ofSize: 44, weight: .bold)
        balanceLabel.textColor = #colorLiteral(red: 0.1960784314, green: 0.2117647059, blue: 0.2588235294, alpha: 1)
        balanceLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(balanceLabel)
        NSLayoutConstraint.activate([
            balanceLabel.leadingAnchor.constraint(equalTo: netLabel.leadingAnchor),
            balanceLabel.topAnchor.constraint(equalTo: netLabel.topAnchor, constant: 15)
        ])
    }
    
    /// Configures a StackView that contains the `graphView` and `labels`.
    private func configureStackView() {
        stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        scrollView.addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor),
            stackView.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor),
            stackView.heightAnchor.constraint(equalTo: scrollView.frameLayoutGuide.heightAnchor)
        ])
    }
    
    /// Configures a ScrollView that wraps the graph.
    private func configureScrollView() {
        scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(scrollView)
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}

//MARK: - Supporting Methods
extension ChartView {
    /// Recreate subviews.
    public func reloadData(){
        guard let chartModel = chartModel, !chartModel.isEmpty else { return }
        subviews.forEach { $0.removeFromSuperview() }
        configureScrollView()
        configureStackView()
        configureLabels()
        configureGraphView()
        configureSeparator()
        configureBottomStackView()
    }
}
