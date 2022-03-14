//
//  ViewController.swift
//  formation-iOS
//
//  Created by svetlana.lesik on 14/03/2022.
//

import UIKit


protocol SideSelectorDelegate {
    func sideChoosen(color: UIColor)
}


class YourSideViewController: UIViewController {
    
    var sideSelectorDelegate: SideSelectorDelegate!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray
        navigationController?.isNavigationBarHidden = false
        
        setAllianceButton()
        setTitle()
        setEmpireButton()
    }
    
    private func setTitle() {
        let label = UILabel()
        
        self.view.addSubview(label)
        
        // MARK: set UI
        label.text = "Choose your side Padawan !"
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .systemOrange
        
        // MARK: set constaints
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            label.widthAnchor.constraint(equalToConstant: 200),
            label.heightAnchor.constraint(equalToConstant: 100)
        ])
    
    }
    
    private func setAllianceButton() {
        let button = UIButton(type: .custom)
        
        self.view.addSubview(button)
        
        button.setImage(UIImage(named: "Alliance.png"), for: .normal)
        
        // MARK: set UI
        button.backgroundColor = .systemBlue

        // MARK: set target
        button.addTarget(self, action: #selector(allianceChoosen), for: .touchUpInside)
        
        // MARK: set constaints
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -180),
            button.widthAnchor.constraint(equalToConstant: 140),
            button.heightAnchor.constraint(equalToConstant: 140)
        ])

    }
    
    @objc func allianceChoosen(sender: UIButton!) {
        sideSelectorDelegate.sideChoosen(color: .systemBlue)
        navigationController?.popViewController(animated: true)
    }
    
    private func setEmpireButton() {
        let button = UIButton(type: .custom)
        self.view.addSubview(button)
        
        button.setImage(UIImage(named: "Empire.png"), for: .normal)

        // MARK: set UI
        button.backgroundColor = .systemRed
        
        // MARK: set target
        button.addTarget(self, action: #selector(empireChoosen), for: .touchUpInside)
        
        // MARK: set constaints
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 180),
            button.widthAnchor.constraint(equalToConstant: 140),
            button.heightAnchor.constraint(equalToConstant: 140)
        ])

    }
    
    @objc func empireChoosen(sender: UIButton!) {
        sideSelectorDelegate.sideChoosen(color: .systemRed)
        navigationController?.popViewController(animated: true)
    }

}
