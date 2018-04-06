//
//  ViewController.swift
//  NVPullToRefresh
//
//  Created by satish.babariya@gmail.com on 04/06/2018.
//  Copyright (c) 2018 satish.babariya@gmail.com. All rights reserved.
//

import NVPullToRefresh
import UIKit

class ViewController: UIViewController {

    fileprivate var tableView: UITableView!
    fileprivate var refresher: NVPullToRefresh!

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        view.addSubview(tableView)
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true

        // NVPullToRefresh Setup
        refresher = NVPullToRefresh(NVActivityIndicatorType: .circleStrokeSpin, Color: .black) // NVPullToRefresh()
        tableView.addPullToRefresh(refresher) {
            let delayTime = DispatchTime.now() + Double(Int64(5 * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC)
            DispatchQueue.main.asyncAfter(deadline: delayTime) { [weak self] in
                if self == nil {
                    return
                }
                self?.tableView.endRefreshing(at: .top)
            }
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = "\((indexPath as NSIndexPath).row)"
        return cell
    }
}
