//
//  ExampleSettingsViewController.swift
//  SwiftSettingsExample
//
//  Created by Alexander Lesin on 8/3/17.
//  Copyright © 2017 Alexander Lesin. All rights reserved.
//

import UIKit
import SwiftyUserDefaults
import SwiftySettings
class Storage: SettingsStorageType {
    subscript(key: String) -> Bool? {
        get {
            return Defaults[key].bool
        }
        set {
            Defaults[key] = newValue
        }
    }
    subscript(key: String) -> Float? {
        get {
            return Float(Defaults[key].doubleValue)
        }
        set {
            Defaults[key] = newValue
        }
    }
    subscript(key: String) -> Int? {
        get {
            return Defaults[key].int
        }
        set {
            Defaults[key] = newValue
        }
    }
    subscript(key: String) -> String? {
        get {
            return Defaults[key].string
        }
        set {
            Defaults[key] = newValue
        }
    }
}

class ExampleSettingsViewController: SwiftySettingsViewController {
    var storage = Storage()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        settings = SwiftySettings(storage: storage, title: "Intelligent Home") {
            [Section(title: "Electricity") {
                [OptionsButton(key: "tariff", title: "Tariff") {
                    [Option(title: "Day", optionId: 1),
                     Option(title: "Night", optionId: 2),
                     Option(title: "Mixed", optionId: 3)]
                    },
                 Switch(key: "light-central", title: "Central Switch", icon: UIImage(named: "settings-light")),
                 Screen(title: "Livingroom") {
                    [Section(title: "Lights") {
                        [Switch(key: "light1", title: "Light 1"),
                         Switch(key: "light2", title: "Light 2"),
                         Slider(key: "brightness-1", title: "Brightness",
                                minimumValueImage: UIImage(named: "slider-darker"),
                                maximumValueImage: UIImage(named: "slider-brighter"),
                                minimumValue: 0,
                                maximumValue: 100)]
                        }]
                    },
                 Screen(title: "Bedroom") {
                    [Section(title: "Lights", footer: "Manage lights in your bedroom") {
                        [Switch(key: "light3", title: "Light 1"),
                         Switch(key: "light4", title: "Light 2"),
                         Slider(key: "brightness-2", title: "Brightness")]
                        }]
                    }]
                },
             OptionsSection(key: "alarm-status", title: "Alarm") {
                [Option(title: "Armed", optionId: 1),
                 Option(title: "Only ground floor", optionId: 2),
                 Option(title: "Disarmed", optionId: 3)]
                },
             Section(title: "Administrator") {
                [TextField(key: "password", title: "Password", secureTextEntry: true)]
                }]
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
