//
//  VideoViewController.swift
//  AMCMobileAcademyProject
//
//  Created by Андрей on 12/03/2020.
//  Copyright © 2020 AMC. All rights reserved.
//

import UIKit
import AVKit

class VideoViewController: UIViewController {
    @IBOutlet weak var showVideoButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func showVideo(_ sender: UIButton) {
        
        //ссылка на сам видеофайл, а не на сайт, где расположено видео (ссылка временная, может перестать работать) 
        let videoURL = URL(string: "https://tinyurl.com/r98y8w9")
        //создание плеера
        let player = AVPlayer(url: videoURL!)
        //создание контроллера для плеера
        let playerViewController = AVPlayerViewController()
        playerViewController.player = player
        
        //открытие плеера на весь экран
        self.present(playerViewController, animated: true, completion: {
            playerViewController.player!.play()
        })
    }

}
