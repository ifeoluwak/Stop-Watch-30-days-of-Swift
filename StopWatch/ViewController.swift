//
//  ViewController.swift
//  StopWatch
//
//  Created by Bambooks on 26/11/2018.
//  Copyright © 2018 Bambooks. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var counter = 0.0
    var timer = Timer()
    var isPlaying = false

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .orange
        setupTimerViewsConstaints()
        setupActionViews()
        
        TimeLabel.text = "\(counter)"
    }
    
    var TimerView: UIView = {
        let vw = UIView()
        vw.backgroundColor = UIColor(red: 6.0/255, green: 4.0/255, blue: 31.0/255, alpha: 1)
        vw.translatesAutoresizingMaskIntoConstraints = false
        
        return vw
    }()
    
    var TimeLabel: UILabel = {
       let lbl = UILabel()
        lbl.font = UIFont.systemFont(ofSize: 60.0, weight: .light)
        lbl.textColor = .white
        lbl.translatesAutoresizingMaskIntoConstraints = false
        
        return lbl
    }()
    
    var ResetButton: UIButton = {
       let btn = UIButton(type: .system)
        btn.setTitle("Reset", for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 30.0, weight: .light)
        btn.tintColor = .white
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(resetTapped), for: .touchUpInside)
        
        return btn
    }()
    
    var PlayButton: UIButton = {
       let btn = UIButton(type: .system)
        btn.backgroundColor = .brown
        btn.setImage(UIImage(named: "play")?.withRenderingMode(.alwaysOriginal), for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(playTapped), for: .touchUpInside)
        
        return btn
    }()
    
    var PauseButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.backgroundColor = .purple
        btn.setImage(UIImage(named: "pause")?.withRenderingMode(.alwaysOriginal), for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(pauseTapped), for: .touchUpInside)
        
        return btn
    }()
    
    override func loadView() {
        super.loadView()
        view.addSubview(TimerView)
        TimerView.addSubview(ResetButton)
        TimerView.addSubview(TimeLabel)
    }
    
    func setupTimerViewsConstaints() {
        TimerView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        TimerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        TimerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        TimerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.45).isActive = true
        
        ResetButton.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 30).isActive = true
        ResetButton.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor, constant: -10).isActive = true
        
        TimeLabel.centerXAnchor.constraint(equalTo: TimerView.centerXAnchor, constant: 0).isActive = true
        TimeLabel.centerYAnchor.constraint(equalTo: TimerView.centerYAnchor, constant: 0).isActive = true
    }
    
    func setupActionViews() {
        let ActionView = UIStackView(arrangedSubviews: [PlayButton, PauseButton])
        ActionView.translatesAutoresizingMaskIntoConstraints = false
        ActionView.distribution = .fillEqually
        
        view.addSubview(ActionView)
        
        NSLayoutConstraint.activate([
            ActionView.topAnchor.constraint(equalTo: TimerView.bottomAnchor),
            ActionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            ActionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            ActionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            ])
    }
    
    @objc func resetTapped() {
//        print("reset tapped")
        timer.invalidate()
        counter = 0.0
        PlayButton.isEnabled = true
        TimeLabel.text = String(counter)
    }
    
    @objc func playTapped() {
        PlayButton.isEnabled = false
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
    }
    
    @objc func pauseTapped() {
        timer.invalidate()
        PlayButton.isEnabled = true
    }
    
    @objc func updateCounter(time: Timer) {
//        print(time.timeInterval)
        counter = counter + 0.1
        TimeLabel.text = String(format: "%.1f", counter)
        
    }


}

