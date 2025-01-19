//
//  InformationViewController.swift
//  ASTODO
//
//  Created by Berke Yakın on 17.01.2025.
//

import UIKit

class InformationViewController: UIViewController {
    var isPersonalSelected = false // 'Kişisel' seçeneği
    var isWorkSelected = false // 'İş' seçeneği
    var isSportSelected = false // 'Spor' seçeneği
    var isEducationSelected = false // 'Eğitim' seçeneği

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        view.backgroundColor = .white

        // Başlık Label
        let inflabel = UILabel()
        inflabel.text = "Astodo'yu nasıl kullanmayı planlıyorsun?"
        inflabel.textAlignment = .left
        inflabel.textColor = .black
        inflabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        inflabel.numberOfLines = 2
        inflabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(inflabel)

        NSLayoutConstraint.activate([
            inflabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            inflabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            inflabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20)
        ])

        // Kartlar
        let personalCard = createCard(title: "Kişisel", iconName: "personal", tag: 101)
        let workCard = createCard(title: "İş", iconName: "work", tag: 102)
        let sportCard = createCard(title: "Spor", iconName: "sport", tag: 103)
        let educationCard = createCard(title: "Eğitim", iconName: "education", tag: 104)

        // Kartları Görünüme Ekle
        view.addSubview(personalCard)
        view.addSubview(workCard)
        view.addSubview(sportCard)
        view.addSubview(educationCard)

        // Kart Yerleşimleri
        NSLayoutConstraint.activate([
            personalCard.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            personalCard.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            personalCard.topAnchor.constraint(equalTo: inflabel.bottomAnchor, constant: 20),
            personalCard.heightAnchor.constraint(equalToConstant: 80),

            workCard.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            workCard.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            workCard.topAnchor.constraint(equalTo: personalCard.bottomAnchor, constant: 20),
            workCard.heightAnchor.constraint(equalToConstant: 80),

            sportCard.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            sportCard.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            sportCard.topAnchor.constraint(equalTo: workCard.bottomAnchor, constant: 20),
            sportCard.heightAnchor.constraint(equalToConstant: 80),

            educationCard.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            educationCard.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            educationCard.topAnchor.constraint(equalTo: sportCard.bottomAnchor, constant: 20),
            educationCard.heightAnchor.constraint(equalToConstant: 80)
        ])

        // Devam Et Butonu
        let continueButton = UIButton()
        continueButton.setTitle("Devam Et", for: .normal)
        continueButton.backgroundColor = .lightGray
        continueButton.layer.cornerRadius = 10
        continueButton.isEnabled = false
        continueButton.translatesAutoresizingMaskIntoConstraints = false
        continueButton.addTarget(self, action: #selector(continueButtonTapped), for: .touchUpInside)
        view.addSubview(continueButton)

        NSLayoutConstraint.activate([
            continueButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            continueButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            continueButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -60),
            continueButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }

    func createCard(title: String, iconName: String, tag: Int) -> UIButton {
        let card = UIButton()
        card.backgroundColor = .white
        card.layer.cornerRadius = 10
        card.layer.borderWidth = 2
        card.layer.borderColor = UIColor.lightGray.cgColor
        card.translatesAutoresizingMaskIntoConstraints = false
        card.tag = tag
        card.addTarget(self, action: #selector(cardTapped(_:)), for: .touchUpInside)

        // Resim (Icon)
        let iconImageView = UIImageView()
        iconImageView.image = UIImage(named: iconName) // İkon adı daha sonra eklenebilir
        iconImageView.tintColor = .black
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        card.addSubview(iconImageView)

        NSLayoutConstraint.activate([
            iconImageView.centerYAnchor.constraint(equalTo: card.centerYAnchor),
            iconImageView.leadingAnchor.constraint(equalTo: card.leadingAnchor, constant: 16),
            iconImageView.widthAnchor.constraint(equalToConstant: 40),
            iconImageView.heightAnchor.constraint(equalToConstant: 40)
        ])

        // Başlık (Label)
        let titleLabel = UILabel()
        titleLabel.text = title
        titleLabel.textColor = .black
        titleLabel.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        card.addSubview(titleLabel)

        NSLayoutConstraint.activate([
            titleLabel.centerYAnchor.constraint(equalTo: card.centerYAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 16)
        ])

        // Yuvarlak Seçim Alanı (Circle)
        let selectionCircle = UIImageView()
        selectionCircle.image = UIImage(systemName: "circle") // Boş yuvarlak
        selectionCircle.tintColor = .lightGray
        selectionCircle.translatesAutoresizingMaskIntoConstraints = false
        card.addSubview(selectionCircle)

        NSLayoutConstraint.activate([
            selectionCircle.centerYAnchor.constraint(equalTo: card.centerYAnchor),
            selectionCircle.trailingAnchor.constraint(equalTo: card.trailingAnchor, constant: -16),
            selectionCircle.widthAnchor.constraint(equalToConstant: 30),
            selectionCircle.heightAnchor.constraint(equalToConstant: 30)
        ])

        selectionCircle.tag = tag + 100 // Her kart için farklı bir tag
        return card
    }

    @objc func cardTapped(_ sender: UIButton) {
        // Seçim Durumunu Tersine Çevir
        switch sender.tag {
        case 101:
            isPersonalSelected.toggle()
            updateCardAppearance(for: sender, isSelected: isPersonalSelected)
        case 102:
            isWorkSelected.toggle()
            updateCardAppearance(for: sender, isSelected: isWorkSelected)
        case 103:
            isSportSelected.toggle()
            updateCardAppearance(for: sender, isSelected: isSportSelected)
        case 104:
            isEducationSelected.toggle()
            updateCardAppearance(for: sender, isSelected: isEducationSelected)
        default:
            break
        }

        // Devam Et Butonunun Durumunu Güncelle
        updateContinueButtonState()
    }

    func updateCardAppearance(for card: UIButton, isSelected: Bool) {
        card.layer.borderColor = isSelected ? UIColor.red.cgColor : UIColor.lightGray.cgColor

        if let selectionCircle = card.viewWithTag(card.tag + 100) as? UIImageView {
            selectionCircle.image = isSelected ? UIImage(systemName: "checkmark.circle.fill") : UIImage(systemName: "circle")
            selectionCircle.tintColor = isSelected ? UIColor.red : UIColor.lightGray
        }
    }

    func updateContinueButtonState() {
        if let continueButton = view.subviews.first(where: { $0 is UIButton && ($0 as! UIButton).currentTitle == "Devam Et" }) as? UIButton {
            let isAnySelected = isPersonalSelected || isWorkSelected || isSportSelected || isEducationSelected
            continueButton.isEnabled = isAnySelected
            continueButton.backgroundColor = isAnySelected ? .red : .lightGray
        }
    }

    @objc func continueButtonTapped(_ sender: UIButton) {
        guard sender.isEnabled else { return }
        
        UIView.animate(withDuration: 0.1, animations: {
            sender.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
        }) { _ in
            UIView.animate(withDuration: 0.1, animations: {
                sender.transform = CGAffineTransform.identity
            })
        }
        
        
        performSegue(withIdentifier: "screen list", sender: nil)
        
        
        
        
        print("kontrol")
    //(Kontrol ayarları)
    }
    
}
