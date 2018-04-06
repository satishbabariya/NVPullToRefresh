//
//  NVPullToRefresh.swift
//
//  Created by Satish on 06/04/18.
//

import Foundation
import NVActivityIndicatorView
import PullToRefresh
import UIKit

public class NVPullToRefresh: PullToRefresh {
    
    public init(NVActivityIndicatorType type: NVActivityIndicatorType, Color color: UIColor) {
        let height: CGFloat = UIDevice.current.userInterfaceIdiom == .pad ? 65.0 : 55.0
        let refreshView = RefreshView()
        refreshView.type = type
        refreshView.color = color
        refreshView.translatesAutoresizingMaskIntoConstraints = false
        refreshView.autoresizingMask = [.flexibleWidth]
        refreshView.frame.size.height = height
        super.init(refreshView: refreshView, animator: Animator(refreshView: refreshView), height: height, position: .top)
    }
    
    public init(NVActivityIndicatorType type: NVActivityIndicatorType, Color color: UIColor, Height height: CGFloat) {
        let refreshView = RefreshView()
        refreshView.type = type
        refreshView.color = color
        refreshView.translatesAutoresizingMaskIntoConstraints = false
        refreshView.autoresizingMask = [.flexibleWidth]
        refreshView.frame.size.height = height
        super.init(refreshView: refreshView, animator: Animator(refreshView: refreshView), height: height, position: .top)
    }
    
    public convenience init() {
        self.init(NVActivityIndicatorType: NVActivityIndicatorView.DEFAULT_TYPE, Color: NVActivityIndicatorView.DEFAULT_COLOR)
    }
    
}

class RefreshView: UIView {
    
    fileprivate let h: CGFloat = UIDevice.current.userInterfaceIdiom == .pad ? 40.0 : 30.0
    var type: NVActivityIndicatorType = NVActivityIndicatorView.DEFAULT_TYPE
    var color: UIColor = NVActivityIndicatorView.DEFAULT_COLOR
    
    fileprivate(set) lazy var activityIndicator: NVActivityIndicatorView! = {
        let activityIndicator = NVActivityIndicatorView(frame: .init(x: 0, y: 0, width: h, height: h))
        activityIndicator.color = color
        activityIndicator.type = type
        self.addSubview(activityIndicator)
        return activityIndicator
    }()
    
    func start() {
        layoutSubviews()
        activityIndicator.startAnimating()
    }
    
    func end() {
        activityIndicator.stopAnimating()
    }
    
    override func layoutSubviews() {
        centerActivityIndicator()
        setupFrame(in: superview)
        super.layoutSubviews()
    }
    
    override func willMove(toSuperview newSuperview: UIView?) {
        super.willMove(toSuperview: newSuperview)
        centerActivityIndicator()
        setupFrame(in: superview)
    }
    
    func setupFrame(in newSuperview: UIView?) {
        guard let superview = newSuperview else { return }
        
        frame = CGRect(x: frame.origin.x, y: frame.origin.y, width: superview.frame.width, height: frame.height)
    }
    
    func centerActivityIndicator() {
        activityIndicator.center = convert(center, from: superview)
    }
}

class Animator: RefreshViewAnimator {
    
    private let refreshView: RefreshView
    
    init(refreshView: RefreshView) {
        self.refreshView = refreshView
    }
    
    func animate(_ state: State) {
        // animate refreshView according to state
        switch state {
            
        case .initial:
            refreshView.start()
            break
        case .releasing:
            
            break
        case .loading:
            
            break
        case .finished:
            refreshView.end()
            break
        }
    }
}
