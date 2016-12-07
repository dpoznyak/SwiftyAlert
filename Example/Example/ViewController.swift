/////////////////////////////////////////////////////////////////////////////////
// The MIT License (MIT)
//
// Copyright (c) 2016 TomoyaHayakawa.
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.
/////////////////////////////////////////////////////////////////////////////////

import UIKit
import SwiftyAlert


class ViewController: UIViewController {

    @IBOutlet private weak var alertButton1: UIButton!
    @IBOutlet private weak var alertButton2: UIButton!
    @IBOutlet private weak var alertButton3: UIButton!


    @IBAction private func tappedAlert1() {
        Alert(title: "Alert", message: "Simple Alert.")
            .addDefault("OK")
            .addCancel()
            .show()
    }

    @IBAction private func tappedAlert2(_ sender: UIButton) {
        Alert(title: "ActionSheet", style: .actionSheet)
            .addDefault("Take Photo") { print("take phote") }
            .addDefault("Open Library") { print("open library") }
            .addDestructive("Delete") { print("delete") }
            .addCancel()
            .handlePopoverController { [weak self] controller in
                controller?.sourceView = self?.view
                controller?.sourceRect = sender.frame
            }
            .show()
    }

    @IBAction private func tappedAlert3() {
        Alert(title: "Alert", message: "Alert with TextField.")
            .addTextField { textField in
                textField.placeholder = "ID"
            }
            .addTextField { textField in
                textField.placeholder = "Password"
                textField.isSecureTextEntry = true
            }
            .handleTextFieldDidChange { textField, index in
                print("Index of textFields:", index, "text:", textField.text ?? "nil")
                if (textField.text?.characters.count)! > 5 {
                    textField.text = ""
                }
            }
            .addDefaultWithTextField("Login") { textFields in
                textFields?.forEach({ print($0.text ?? "nil") })
            }
            .addCancel("Back") { print("Cancelled") }
            .show() { print("Completion") }
    }

}
