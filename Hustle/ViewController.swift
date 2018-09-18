//
//  ViewController.swift
//  Hustle
//
//  Created by Nikhil Muskur on 18/09/18.
//  Copyright © 2018 Nikhil Muskur. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

	var player: AVAudioPlayer!
	@IBOutlet weak var darkBlueImage: UIImageView!
	@IBOutlet weak var onButton: UIButton!
	@IBOutlet weak var blueView: UIView! {
		didSet {
			blueView.isHidden = true
		}
	}
	@IBOutlet weak var rocketImage: UIImageView! {
		didSet {
			rocketImage.isHidden = true
		}
	}
	@IBOutlet weak var cloudImage: UIImageView! {
		didSet {
			cloudImage.isHidden = true
		}
	}
	@IBOutlet weak var hustleLabel: UILabel!
	@IBOutlet weak var indicatorLabel: UILabel!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
		
		if let path = Bundle.main.path(forResource: "hustle-on", ofType: "wav") {
			let audioURL = URL(fileURLWithPath: path)
			
			do {
				player = try AVAudioPlayer(contentsOf: audioURL)
				player.prepareToPlay()
			} catch {
				print("Unable load the Audio Player with the provided URL with err: \(error)")
			}
		}
	}
	
	
	
	@IBAction func onButtonPressed(_ sender: Any) {
		// Hide the Elements
		darkBlueImage.isHidden = true
		onButton.isHidden = true
		
		//Show the Elements
		blueView.isHidden = false
		rocketImage.isHidden = false
		cloudImage.isHidden = false
		
		player.play()
		
		UIViewPropertyAnimator.runningPropertyAnimator(
			withDuration: 2.0,
			delay: 0,
			options: .curveEaseInOut,
			animations: {
				// Move the Image View frame
				let rocketImg = self.rocketImage!
				rocketImg.frame = CGRect(
					x: 0,
					y: 200,
					width: rocketImg.frame.size.width,
					height: rocketImg.frame.size.height)
		}) { (position) in
			self.hustleLabel.isHidden = false
			self.indicatorLabel.isHidden = false
		}
	}
	
}

