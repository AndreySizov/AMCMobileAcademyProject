//
//  ViewController.swift
//  AMCMobileAcademyProject
//
//  Created by Андрей on 02/03/2020.
//  Copyright © 2020 AMC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
//      объекты из storyboard, поключенные к данному ViewController
//    (для подключения объектов: выбираете бъект на storyboard, зажимаете ctrl, перетаскиваете под class, но над viewDidLoad
    @IBOutlet weak var myLabel: UILabel!
    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var transferButton: UIButton!
    @IBOutlet weak var myTextField: UITextField!
    @IBOutlet weak var myButton: UIButton!
   
    
    // функция загрузки экрана (см жизненный цикл UIViewController), констрейнты еще не загружены
    override func viewDidLoad() {
        
        //вызов функции родительского класса UIViewController
        super.viewDidLoad()
        
        //изменение шрифта
        myLabel.font = UIFont.systemFont(ofSize: 37, weight: .light)
        
//        добавление базового цвета
//        myLabel.textColor = UIColor.red
        
//        добавление цвета по RGB
        myLabel.textColor = UIColor(red: 150/255, green: 200/255, blue: 102/255, alpha: 1)
        
//        у кнопки внутри находится Label, поэтому для изменения текста в кнопке уже используется функция
//        myButton.setTitle("My Button", for: .normal)
        
//        цвет шрифта так же заносится через функцию
        myButton.setTitleColor(UIColor.white, for: .normal)
        
//        фон кнопки задается напрямую
        myButton.backgroundColor = UIColor(red: 150/255, green: 200/255, blue: 102/255, alpha: 1)
//        толщина обводки
        myButton.layer.borderWidth = 2
//        цвет обводки
        myButton.layer.borderColor = UIColor.lightGray.cgColor
//        скругление границы кнопки (высота берется из storyboard, констрейнтов еще нет!)
        myButton.layer.cornerRadius = myButton.frame.size.height/2
        
//        передаем картинку в myImageView через инициализатор картинки
//        название картинки совпадает с названием в assets
        myImageView.image = UIImage(named: "nature")
        
//        скругление границы кнопки (высота берется из storyboard, констрейнтов еще нет!)
//        показательный пример! В данном случае ширина картинки собирается как 1:1 с высотой, но до закгрузки constraints этого занчения еще нет! Берется текущее значение из storyboard.
//        myImageView.layer.cornerRadius = myImageView.frame.size.width/2
        
//        задний цвет всего экрана
//        self.view.backgroundColor = UIColor.gray
        
//        картинка не квадратная изначально, поэтому необходимо задать принципы ее вставки в myImageView
//        в данном случае картинка масштабируется без изменения соотношения сторон и края обрезаются
        myImageView.contentMode = .scaleToFill
    }
    
    
//    данная функция вызывается после того, как загрузился экран и внутренние кострейнты (см жизненный цикл UIViewController)
    override func viewDidAppear(_ animated: Bool) {
//        теперь мы можем получить реальую ширину картинки и сделать ее действительно кргулой
        myImageView.layer.cornerRadius = myImageView.frame.size.width/2
    }

//    функция кнопки "Изменить заголовок"
    @IBAction func myButtonAction(_ sender: Any) {
        
//        проверка: если кнопку нажали,а textField пустой -> покажется "Базовый заголовок"
//        если не пустой, то заменится заголовок на тот, который введен в textField
        if let str = myTextField.text{
            if str.isEmpty{
                myLabel.text = "Базовый заголовок"
            }else{
                myLabel.text = str
            }
        }
        
    }
    
//    функция кнопок "Перейти к ...".
//    В данном случае все три кнопки привязаны к одному методу, а для их
//    распознавания в сториборде в правом окне для каждой кнопки введены идентификаторы.
//    При нажатии на любую из трех кнопок перехода в sender приходит та кнопка,
//    которая была нажата, дальше сверяется ее идентификатор, чтобы вызвать переход к запрашиваемому экрану.
    @IBAction func transferButtonAction(_ sender: UIButton) {
//        вызов по имени segue, с помощью которой связан ViewController c другими контроллерами
        
        if sender.restorationIdentifier == "tableVC"{
            performSegue(withIdentifier: "showSecondVC", sender: nil)
        }else if sender.restorationIdentifier == "mapVC"{
            performSegue(withIdentifier: "showMapVC", sender: nil)
        }else if sender.restorationIdentifier == "videoVC"{
            performSegue(withIdentifier: "showVideoVC", sender: nil)
        }
    }
    
}

