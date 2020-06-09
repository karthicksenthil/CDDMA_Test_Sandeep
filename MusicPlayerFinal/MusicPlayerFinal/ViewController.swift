//
//  ViewController.swift
//  MusicPlayerFinal
//
//  Created by Naveen kumar Oruganti on 09/06/20.
//  Copyright © 2020 Sandeep Athiyarath. All rights reserved.
//

import UIKit
import AVKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        copyFromJSON()
    }
    func copyFromJSON()
    {
        do{
            let fileURL = try FileManager.default
            .url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
            .appendingPathComponent("song1.mp3")
            //print(fileURL)
            guard let path = Bundle.main.path(forResource: "song1", ofType: "mp3")
                else{
                    return
                }
            guard let data = FileManager.default.contents(atPath: path)
            else{
                return
             }
            print(fileURL)
            // create the file if not already present (Assuming no changes to the file will be made)
            // Changes made after creation of the file will not be reflected
            if FileManager.default.fileExists(atPath: fileURL.path) == false
            {
                FileManager.default.createFile(atPath: fileURL.path, contents: data, attributes: nil)
            }

        }catch{
            print(error)
        }
    }

}

