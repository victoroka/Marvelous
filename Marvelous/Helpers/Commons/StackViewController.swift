//
//  StackViewController.swift
//  Marvelous
//
//  Created by Victor Hideo Oka on 15/12/21.
//  Copyright © 2021 Victor Oka. All rights reserved.
//

import UIKit

// MARK: - Stack View Controller Protocol
protocol StackViewControllerProtocol {
    func insert(view: UIView, above: UIView)
    func insert(view: UIView, below: UIView)
    func insert(view: UIView, at: Int)
    func add(view: UIView)
    func add(space: StackableSpaceView)
    func remove(view: UIView)
    func removeAllViews()
    func contains(view: UIView) -> Bool
    func scroll(to view: UIView)
}

// MARK: - Stack View Controller View
final class StackableSpaceView: UIView {
    
    private var height: CGFloat
    private var color: UIColor
    
    init(height: CGFloat = 24, color: UIColor = .clear) {
        self.height = height
        self.color = color
        super.init(frame: .zero)
        prepareLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError(Constants.initFatalErrorDefaultMessage)
    }
    
    private func prepareLayout() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = color
        frame.size.height = height
    }
    
}

// MARK: - Stack View Controller
class StackViewController: UIViewController, StackViewControllerProtocol {
    
    private lazy var scrollView: UIScrollView = .init()
    private lazy var stackView: UIStackView = .init()
    
    var offset: UIEdgeInsets = .zero
    
    var bounces: Bool = true {
        didSet {
            scrollView.bounces = bounces
        }
    }
    
    var spacing: CGFloat = 16 {
        didSet {
            stackView.spacing = spacing
        }
    }
    
    var color: UIColor = .white {
        didSet {
            view.backgroundColor = color
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func index(of view: UIView) -> Int? {
        guard let index = stackView.arrangedSubviews.firstIndex(of: view) else {
            return nil
        }
        return index
    }
    
    // MARK: Protocol Methods Implementations
    func insert(view: UIView, above: UIView) {
        guard let index = index(of: above), index > 0 else {
            return
        }
        stackView.insertArrangedSubview(view, at: index - 1)
    }
    
    func insert(view: UIView, below: UIView) {
        guard let index = index(of: below) else {
            return
        }
        stackView.insertArrangedSubview(view, at: index + 1)
    }
    
    func insert(view: UIView, at index: Int) {
        if index == 0 || stackView.arrangedSubviews.indices.contains(index) {
            stackView.insertArrangedSubview(view, at: index)
        }
    }
    
    func add(view: UIView) {
        if let last = stackView.arrangedSubviews.last {
            guard !stackView.arrangedSubviews.contains(view) else {
                return
            }
            insert(view: view, below: last)
        }
    }
    
    func add(space: StackableSpaceView) {
        // TODO: addHeight
        stackView.addArrangedSubview(space)
    }
    
    func remove(view: UIView) {
        guard stackView.arrangedSubviews.contains(view) else {
            return
        }
        stackView.removeArrangedSubview(view)
        view.removeFromSuperview()
    }
    
    func removeAllViews() {
        stackView.arrangedSubviews.forEach { view in
            stackView.removeArrangedSubview(view)
            view.removeFromSuperview()
        }
    }
    
    func contains(view: UIView) -> Bool {
        return stackView.arrangedSubviews.contains(view)
    }
    
    func scroll(to view: UIView) {
        scrollView.scrollRectToVisible(view.frame, animated: true)
    }
    
}

// MARK: - Stack View Controller Code View Protocol
extension StackViewController: CodeView {
    
    func buildViewHierarchy() {
        view.addSubview(scrollView)
        scrollView.addSubview(stackView)
    }
    
    func setupConstraints() {
        scrollView.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(offset.left)
            make.right.equalToSuperview().inset(offset.right)
            make.bottom.equalTo(stackView.snp.bottom).offset(offset.bottom)
        }
        
        stackView.snp.makeConstraints { make in
            make.left.right.top.width.equalToSuperview()
        }
    }
    
    func setupAdditionalConfigurarion() {
        scrollView.bounces = bounces
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        scrollView.clipsToBounds = false
        
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.axis = .vertical
        stackView.spacing = spacing
        stackView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        stackView.clipsToBounds = false
    }
}
