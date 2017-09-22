//
//  DemoListViewController.swift
//  iOS10Demo
//
//  Created by Aydar Mukhametzyanov on 9/15/17.
//  Copyright © 2017 Aydar Mukhametzyanov. All rights reserved.
//

import UIKit

let MainStoryboard = UIStoryboard(name: "Main", bundle: nil)

struct Demo {
    let title: String
    let storyboardIdentifier: String
}

protocol DemoViewController: class {
    var model: Demo! { get set }
}

class DemoListViewController: UIViewController {
    
    private let demos = [
        Demo(title: "UIViewPropertyAnimator", storyboardIdentifier: "AnimatorDemoViewController"),
        Demo(title: "Attributed speech recognizer", storyboardIdentifier: "SpeechSynthesizerDemoViewController")
    ]
    
    @IBOutlet private weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "All demos"
        tableView.reloadData()
    }

}

extension DemoListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let demo = demos[indexPath.row]
        let vc = MainStoryboard.instantiateViewController(withIdentifier: demo.storyboardIdentifier)
        (vc as? DemoViewController)?.model = demo
        navigationController?.pushViewController(vc, animated: true)
    }
    
}

extension DemoListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return demos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let reuseIdentifier = "Cell"
        
        var demoCell: UITableViewCell
        if let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier) {
            demoCell = cell
        }
        demoCell = UITableViewCell(style: .default, reuseIdentifier: reuseIdentifier)
        demoCell.textLabel?.text = demos[indexPath.row].title
        
        return demoCell
    }
    
}
