import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 41/255, green: 41/255, blue: 41/255, alpha: 1.0)

        // LOGO Görseli
        let logoImageView = UIImageView()
        logoImageView.image = UIImage(named: "LOGO")
        logoImageView.contentMode = .scaleAspectFit
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(logoImageView)
        
        NSLayoutConstraint.activate([
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImageView.centerYAnchor.constraint(equalTo: view.topAnchor, constant: 130),
            logoImageView.widthAnchor.constraint(equalToConstant: 300),
            logoImageView.heightAnchor.constraint(equalToConstant: 300)
        ])
       
        
        
        let apmainview = UIImageView()
        apmainview.image = UIImage(named: "mainphoto")
        apmainview.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(apmainview)
        apmainview.contentMode = .scaleAspectFit
        NSLayoutConstraint.activate([
            apmainview.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            apmainview.centerYAnchor.constraint(equalTo: view.topAnchor , constant: 250),
            apmainview.widthAnchor.constraint(equalToConstant: 800),
            apmainview.heightAnchor.constraint(equalToConstant: 800)
            
            
            
        ])
        
        
        
        
        
        
        
        
        // Açıklama Label
        let label1 = UILabel()
        label1.text = "En sonunda iş ve özel hayatını düzene koyabileceksin."
        label1.textAlignment = .center
        label1.numberOfLines = 2
        label1.textColor = .white
        label1.font = UIFont.systemFont(ofSize: 24, weight: .heavy)
        label1.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(label1)
        
        NSLayoutConstraint.activate([
            label1.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label1.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 30),
            label1.widthAnchor.constraint(equalToConstant: 400),
            label1.heightAnchor.constraint(equalToConstant: 100)
        ])
        
        // Apple Button
        let appleButton = createButton(icon: "applelogo", title: "Apple ile devam et", action: #selector(appleButtonTapped))
        view.addSubview(appleButton)
        
        // Google Button
        let googleButton = createButton(icon: "globe", title: "Google ile devam et", action: #selector(googleButtonTapped))
        view.addSubview(googleButton)
        
        // Mail Button
        let mailButton = createButton(icon: "envelope", title: "Mail ile devam et", action: #selector(mailButtonTapped))
        view.addSubview(mailButton)

        // Button Constraints
        NSLayoutConstraint.activate([
            appleButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            appleButton.topAnchor.constraint(equalTo: label1.bottomAnchor, constant: 50),
            appleButton.heightAnchor.constraint(equalToConstant: 45),
            appleButton.widthAnchor.constraint(equalToConstant: 350),
            
            googleButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            googleButton.topAnchor.constraint(equalTo: appleButton.bottomAnchor, constant: 20),
            googleButton.heightAnchor.constraint(equalToConstant: 45),
            googleButton.widthAnchor.constraint(equalToConstant: 350),
            
            mailButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            mailButton.topAnchor.constraint(equalTo: googleButton.bottomAnchor, constant: 20),
            mailButton.heightAnchor.constraint(equalToConstant: 45),
            mailButton.widthAnchor.constraint(equalToConstant: 350)
        ])
    }
    
    func createButton(icon: String, title: String, action: Selector) -> UIButton {
        let button = UIButton(type: .system)
        button.backgroundColor = .white
        button.layer.cornerRadius = 7
        button.tintColor = .black
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: action, for: .touchUpInside)
        
        // Tıklama Animasyonu Eklemek İçin
        button.addTarget(self, action: #selector(buttonTouchDown(_:)), for: .touchDown)
        button.addTarget(self, action: #selector(buttonTouchUp(_:)), for: [.touchUpInside, .touchUpOutside])
        
        let logo = UIImageView()
        logo.image = UIImage(systemName: icon)
        logo.tintColor = .black
        logo.contentMode = .scaleAspectFit
        logo.translatesAutoresizingMaskIntoConstraints = false
        
        let buttonLabel = UILabel()
        buttonLabel.text = title
        buttonLabel.textColor = .black
        buttonLabel.font = UIFont.boldSystemFont(ofSize: 20)
        buttonLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let contentStack = UIStackView(arrangedSubviews: [logo, buttonLabel])
        contentStack.axis = .horizontal
        contentStack.alignment = .center
        contentStack.spacing = 8
        contentStack.translatesAutoresizingMaskIntoConstraints = false
        button.addSubview(contentStack)
        
        NSLayoutConstraint.activate([
            contentStack.centerXAnchor.constraint(equalTo: button.centerXAnchor),
            contentStack.centerYAnchor.constraint(equalTo: button.centerYAnchor),
            logo.widthAnchor.constraint(equalToConstant: 24),
            logo.heightAnchor.constraint(equalToConstant: 24)
        ])
        
        return button
    }
    
    @objc func buttonTouchDown(_ sender: UIButton) {
        UIView.animate(withDuration: 0.2) {
            sender.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
        }
    }
    
    @objc func buttonTouchUp(_ sender: UIButton) {
        UIView.animate(withDuration: 0.2) {
            sender.transform = CGAffineTransform.identity
        }
    }
    
    @objc func appleButtonTapped() {
        print("Apple ile devam et butonuna tıklandı!")
        performSegue(withIdentifier: "FirstScreen", sender: nil)
    }
    
    @objc func googleButtonTapped() {
        print("Google ile devam et butonuna tıklandı!")
    }
    
    @objc func mailButtonTapped() {
        print("Mail ile devam et butonuna tıklandı!")
    }
}
